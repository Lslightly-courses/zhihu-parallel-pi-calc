package main

import "testing"

func BenchmarkCalc(b *testing.B) {
	for i := 0; i < 5; i++ {
		calc(20)
	}
}

func BenchmarkCalcSingleCore(b *testing.B) {
	for i := 0; i < 2; i++ {
		calc(1)
	}
}
