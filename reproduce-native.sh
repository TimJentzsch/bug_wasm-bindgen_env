set -e
set -x

# --- REPRODUCTION ---

echo "Reproducing the issue on native..."

rustc --version --verbose

echo "Check if linker error is emitted when running the app..."

# Compile and run (ensure to use nightly Rust, see setup.sh)
cargo run
