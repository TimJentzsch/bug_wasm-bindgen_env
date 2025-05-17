# Reproduction for nightly linker / wasm-bindgen bug

See <https://github.com/rust-lang/rust/issues/141085> and <https://github.com/bevyengine/bevy/issues/19225>.

## Installation

Run the `./setup.sh` script, or replicate the commands manually.

## Reproduction

There are two ways to reproduce the issue:

- When running `cargo run`, you can get a linker error in the console. See `./reproduce-native.sh`.
- When creating JS bindings with `wasm-bindgen`, you get an invalid import in the JS. See `./reproduce-wasm.sh`.
