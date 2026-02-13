mod hawkes;
mod schema;

use clap::Parser;
use hawkes::{HawkesConfig, generate_hawkes_events};
use reqwest::Client;
use schema::OrderRequest;
use std::{
    error::Error,
    time::{Duration, Instant},
};

#[derive(Parser, Debug)]
#[command(author = "Ewout Verlinde", version = "0.1.0", about = "Simulate clients creating orders on a distributed wasm application", long_about = None)]
struct Cli {
    /// Background rate (lambda0)
    #[arg(short, long, default_value = "4")]
    rate: f64,

    /// Self-excitation factor (alpha)
    #[arg(short, long, default_value = "0.45")]
    alpha: f64,

    /// Decay rate (beta)
    #[arg(short, long, default_value = "0.5")]
    decay: f64,

    /// Stop after N seconds
    #[arg(short, long, default_value = "600")]
    stop_after: u64,

    /// Order endpoint URL
    #[arg(short, long, default_value = "http://0.0.0.0:8080/order")]
    url: String,

    /// Run in blocking mode (wait for each request to complete before sending next)
    #[arg(long)]
    blocking: bool,
}

async fn create_order(
    client: &reqwest::Client,
    url: &str,
    order: &OrderRequest,
) -> Result<(), Box<dyn Error + Send + Sync>> {
    let response = client.post(url).json(&order).send().await?;

    if response.status().is_success() {
        println!("✓ Created order {}", order.order_id);
    } else {
        let status = response.status();
        let text = response.text().await.unwrap_or_default();
        eprintln!("✗ Failed: {} - {}", status, text);
    }

    Ok(())
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
    let cli = Cli::parse();
    let client = Client::new();

    let lambda0 = cli.rate;
    let alpha = cli.alpha;
    let beta = cli.decay;

    println!("Starting order simulator:");
    println!("  lambda0 (background): {} req/sec", lambda0);
    println!("  alpha (excitation): {}", alpha);
    println!("  beta (decay): {}", beta);
    println!("  Duration: {}s", cli.stop_after);
    println!("  Endpoint: {}", cli.url);
    println!();

    let config = HawkesConfig {
        tmax: cli.stop_after as f64,
        alpha,
        beta,
        lambda0,
    };

    let event_times = generate_hawkes_events(config);
    println!(
        "Generated {} events from Hawkes process\n",
        event_times.len()
    );

    // Setup stop timer if specified
    let stop_time = Instant::now() + Duration::from_secs(cli.stop_after);

    let mut request_count = 0u64;
    let mut rng = rand::rng();

    let start_time = Instant::now();

    for event_time in event_times {
        // Check if we should stop due to time limit
        if Instant::now() >= stop_time {
            println!(
                "\nTime limit reached, stopping after {} requests",
                request_count
            );

            break;
        }

        // Wait until the event time
        let target_time = start_time + Duration::from_secs_f64(event_time);
        let now = Instant::now();

        if target_time > now {
            tokio::time::sleep(target_time - now).await;
        }

        let order = OrderRequest::random(&mut rng);

        let http_client = client.clone();
        let url = cli.url.clone();

        if cli.blocking {
            // Blocking mode: wait for request to complete
            let result = create_order(&http_client, &url, &order).await;

            if let Err(e) = result {
                eprintln!("Error creating order: {}", e);
            }
        } else {
            // Concurrent mode: spawn task without waiting
            tokio::spawn(async move {
                let result = create_order(&http_client, &url, &order).await;
                if let Err(e) = result {
                    eprintln!("Error creating order: {}", e);
                }
            });
        }

        request_count += 1;
    }

    Ok(())
}
