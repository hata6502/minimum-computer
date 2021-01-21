module index_test; reg in_1, in_2; wire out; index index(in_1,
                                                         in_2,
                                                         out);
    
    initial begin
        $dumpfile("src/index.test.vcd");
        $dumpvars(0, index_test);
        
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
