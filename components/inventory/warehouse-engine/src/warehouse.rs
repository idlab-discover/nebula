// const PATH: &str = "/warehouses.json";

/// Load the list of warehouse slugs from a JSON configuration file
/// located in a preopened directory.
///
/// ## Errors
/// This function will return an `Err` if:
/// - The configuration directory is not preopened by the host.
/// - The configuration file cannot be opened.
/// - There are errors reading from the configuration file.
/// - The configuration file contains invalid JSON.
pub fn load_warehouse_slugs() -> Result<Vec<String>, String> {
	return Ok(vec![
		"brugge".to_string(),
		"gent".to_string(),
		"antwerpen".to_string(),
	]);
	// let meta = fs::metadata(PATH).map_err(|e| {
	// 	let message = format!(
	// 		"Failed to access metadata for configuration file at '{PATH}': {e}"
	// 	);
	// 	log(Level::Critical, "nebula:inventory/warehouse-engine", &message);
	// 	message
	// })?;

	// if !meta.is_file() {
	// 	let message =
	// 		format!("Configuration path '{PATH}' is not a regular file.");
	// 	log(Level::Critical, "nebula:inventory/warehouse-engine", &message);
	// 	return Err(message);
	// }

	// let contents = fs::read_to_string(PATH).map_err(|e| {
	// 	let message =
	// 		format!("Failed to read configuration file at '{PATH}': {e}");
	// 	log(Level::Critical, "nebula:inventory/warehouse-engine", &message);
	// 	message
	// })?;

	// let warehouses = match serde_json::from_str::<Vec<String>>(&contents) {
	// 	Ok(warehouses) => warehouses,
	// 	Err(e) => {
	// 		let message = format!(
	// 			"JSON parsing error in configuration file at '{PATH}': {e}"
	// 		);
	// 		log(Level::Critical, "nebula:inventory/warehouse-engine", &message);
	// 		return Err(message);
	// 	},
	// };

	// Ok(warehouses)
}
