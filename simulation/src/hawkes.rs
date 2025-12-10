use pointprocesses::TimeProcessResult;
use pointprocesses::hawkes_exponential;

pub struct HawkesConfig {
    pub tmax: f64,
    pub alpha: f64,
    pub beta: f64,
    pub lambda0: f64,
}

pub fn generate_hawkes_events(config: HawkesConfig) -> Vec<f64> {
    let events: TimeProcessResult =
        hawkes_exponential(config.tmax, config.alpha, config.beta, config.lambda0);

    events.timestamps.to_vec()
}
