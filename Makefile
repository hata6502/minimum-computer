index-test: src/index.v src/index.test.v
	iverilog -o bin/index-test src/index.v src/index.test.v
