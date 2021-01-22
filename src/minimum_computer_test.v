/* verilator lint_off STMTDLY */

module minimum_computer_test(output wire [10:0] clock_counter);
    reg clock; minimum_computer minimum_computer(clock,
    clock_counter);
    
    initial begin
        $dumpfile("src/minimum_computer_test.vcd");
        $dumpvars(0);
        
        repeat(4096) begin
            #10;
            clock = 1;
            
            #10;
            clock = 0;
        end
        
        #10;
        $finish;
    end
    
endmodule
