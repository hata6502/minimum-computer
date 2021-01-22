module minimum_computer(input wire clock,
                        output reg [10:0] clock_counter);
    
    initial
    begin
        clock_counter = 0;
    end
    
    always @ (posedge clock)
    begin
        clock_counter <= clock_counter + 1;
    end
    /*
     process(clk) begin
     if (rising_edge(clk)) then
     case ppu_clkcnt is
     when 2032 = >
     ppu_clkcnt <= 0;
     
     case ppu_linecnt is
     when 262 = >
     ppu_linecnt <= 0;
     when others = >
     ppu_linecnt <= ppu_linecnt + 1;
     end case;
     
     when others = >
     ppu_clkcnt <= ppu_clkcnt + 1;
     end case;
     end if;
     end process;
     
     stat_vsync <= '1' when ppu_linecnt<3 else '0';
     stat_hsync <= '1' when ppu_clkcnt<150 else '0';
     
     lum <= crom_1_dot;
     */
    
endmodule
