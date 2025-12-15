package main

import "testing"

func BenchmarkCalc(b *testing.B) {
	for b.Loop() {
		calc()
	}
}
