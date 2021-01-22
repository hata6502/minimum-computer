module minimum_computer_test; reg in_1, in_2; wire out; minimum_computer minimum_computer(in_1,
                                                                                          in_2,
                                                                                          out);
    
    initial begin
        $dumpfile("src/minimum_computer_test.vcd");
        $dumpvars(0, minimum_computer_test);
        
        in_1 = 0;
        in_2 = 0;
        
        #10;
        in_1 = 1;
        in_2 = 0;
        
        #10;
        in_1 = 0;
        in_2 = 1;
        
        #10;
        in_1 = 1;
        in_2 = 1;
        
        #10;
        $finish;
    end
    
endmodule
