add wave *

# Initialize the reset and clock signals
force reset 1
force clk 0

# Start the simulation
run 10 ns

# Release reset
force reset 0
run 20 ns


force clk 1 5 ns -repeat 50 ns
force clk 0 6 ns -repeat 50 ns

# First input on din
force din "1100"
run 100 ns

# Second input on din
force din "1010"
run 100 ns

# Third input on din
force din "0011"
run 100 ns

# Select register 4 (assuming sel="11" selects register 4)
force sel "11"
run 100 ns

# Apply reset
force reset 1
run 20 ns
force reset 0
run 20 ns

# Select register 2 (assuming sel="01" selects register 2)
force sel "01"
run 100 ns

# Select register 3 (assuming sel="10" selects register 3)
force sel "10"
run 100 ns

# Allow time to observe the final state
run 50 ns


