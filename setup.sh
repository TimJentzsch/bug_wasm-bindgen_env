set -e
set -x

# Install the required version of Rust
rustup install nightly-2025-05-16
# Setup the toolchain for use with Wasm
rustup +nightly-2025-05-16 target add wasm32-unknown-unknown
# Install the compatible version of wasm-bindgen
cargo install wasm-bindgen-cli --version 0.2.100
