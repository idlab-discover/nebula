fn main() {
	for cfg in [
		"nebula_rnd_1_2",
		"nebula_rnd_1_3",
		"nebula_rnd_1_4",
		"nebula_rnd_1_5",
		"nebula_rnd_1_6",
		"nebula_rnd_1_8",
		"nebula_rnd_1_10",
		"nebula_rnd_1_15",
		"nebula_rnd_1_20",
	] {
		println!("cargo:rustc-check-cfg=cfg({cfg})");
	}
}