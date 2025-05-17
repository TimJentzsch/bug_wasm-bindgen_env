set -e
set -x

# --- REPRODUCTION ---

echo "Reproducing the issue with wasm-bindgen..."

rustc --version --verbose

# Compile to Wasm (ensure to use nightly Rust, see setup.sh)
cargo build --target=wasm32-unknown-unknown

# Create the JS bindings
wasm-bindgen --no-typescript --target=web --out-dir=target/wasm32-unknown-unknown/debug target/wasm32-unknown-unknown/debug/bug_wasm-bindgen_env.wasm

# --- CHECKS ---

set +x

echo "Checking for problematic package imports in the generated JS..."

# Determine the first line of the generated JS file, which would contain the problematic package import
import_line=$(head -1 target/wasm32-unknown-unknown/debug/bug_wasm-bindgen_env.js)

# Check if the problematic line is present in the generated JS
if echo "$import_line" | grep -q 'env'; then
  echo "Error: Problematic package import found in generated JS:\n$import_line"
  exit 1
fi

echo "Success: Couldn't detect the issue anymore!"
