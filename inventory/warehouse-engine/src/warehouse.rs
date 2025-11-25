use std::vec;

use crate::wasi::filesystem::preopens::get_directories;
use crate::wasi::filesystem::types::{
	Descriptor, DescriptorFlags, DescriptorType, OpenFlags, PathFlags,
};

const CONFIG_PATH: &str = "/config";
const FILE_NAME: &str = "warehouses.json";

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
	// Find the preopened directory descriptor for the configuration path
	let dir_desc_option =
		get_directories().into_iter().find(|(_, path)| path == CONFIG_PATH);

	let dir_desc: Descriptor = match dir_desc_option {
		Some((desc, _)) => desc,
		None => {
			return Err(format!(
				"Configuration directory '{CONFIG_PATH}' not preopened by host."
			));
		},
	};

	// Open the configuration file within the preopened directory
	let file_desc_result = dir_desc.open_at(
		PathFlags::SYMLINK_FOLLOW,
		FILE_NAME,
		OpenFlags::empty(),
		DescriptorFlags::READ,
	);

	let file_desc: Descriptor = match file_desc_result {
		Ok(desc) => desc,
		Err(e) => {
			return Err(format!(
				"Failed to open {FILE_NAME}: Filesystem Error Code {e:?}"
			));
		},
	};

	// Read the contents of the configuration file via a stream
	let input_stream_result = match file_desc.get_type() {
		Ok(DescriptorType::RegularFile) => file_desc.read_via_stream(0),
		_ => {
			return Err(format!(
				"{FILE_NAME} is not a regular file or file type unknown"
			));
		},
	};

	let input_stream = match input_stream_result {
		Ok(stream) => stream,
		Err(e) => {
			// Explicitly handle the error if the stream couldn't be created
			return Err(format!(
				"Failed to get input stream: Filesystem Error Code {e:?}"
			));
		},
	};

	let mut file_contents = vec![0u8];

	loop {
		let read_result = input_stream.blocking_read(1024);

		match read_result {
			Ok(vec) => {
				if vec.is_empty() {
					break;
				}
				file_contents.extend_from_slice(&vec);
			},
			Err(e) => {
				return Err(format!(
					"Error reading from stream: Filesystem Error Code {e:?}"
				));
			},
		}
	}

	// Deserialize the JSON contents into a Vec<String>
	let config_result: Result<Vec<String>, serde_json::Error> =
		serde_json::from_slice(&file_contents);

	let warehouses: Vec<String> = match config_result {
		Ok(c) => c,
		Err(e) => {
			return Err(format!("JSON parsing error in {FILE_NAME}: {e}"));
		},
	};

	// Return the list of warehouse slugs
	Ok(warehouses)
}
