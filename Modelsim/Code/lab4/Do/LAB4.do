add wave *

run 10 ns

force reset 1
run 20 ns
force reset 0
run 20 ns

force clk 0
force clk 1 {5 ns} -repeat {10 ns}

force din "1100"
run 100 ns

force din "1010"
run 100 ns

force din "0011"
run 100 ns

force sel "11"
run 100 ns

force reset 1
run 20 ns
force reset 0
run 20 ns

force sel "01"
run 100 ns

force sel "10"
run 100 ns

run 50 ns
quit
