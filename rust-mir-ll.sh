#!/bin/bash
cargo rustc -- --emit mir,llvm-ir
cd target/debug/deps/