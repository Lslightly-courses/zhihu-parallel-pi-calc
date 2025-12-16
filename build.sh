#!/bin/bash
cfgs=(base opt base_padding)
go build -tags heap -o ./base .
go build -o ./opt .
go build -tags padding -o ./base_padding .
for cfg in "${cfgs[@]}"
do
    go tool objdump -S $cfg > plan9/$cfg.plan9
done
benchcalc="go test -bench=BenchmarkCalc -run=none ."
out=BenchmarkCalc
$benchcalc -tags heap -cpuprofile $out/base.cpu.out -memprofile $out/base.mem.out
$benchcalc -tags padding -cpuprofile $out/base_padding.cpu.out -memprofile $out/base_padding.mem.out
$benchcalc -cpuprofile $out/opt.cpu.out -memprofile $out/opt.mem.out
out=BenchmarkCalcSingleCore
benchSingleCore="go test -bench=BenchmarkCalcSingleCore -run=none ."
$benchSingleCore -tags heap -cpuprofile $out/base.cpu.out -memprofile $out/base.mem.out
$benchSingleCore -tags padding -cpuprofile $out/base_padding.cpu.out -memprofile $out/base_padding.mem.out
$benchSingleCore -cpuprofile $out/opt.cpu.out -memprofile $out/opt.mem.out
