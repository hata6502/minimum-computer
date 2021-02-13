/* verilator lint_off STMTDLY */

module character_rom_test (
    output wire dot
);
  reg clock;
  reg [2:0] x;
  reg [2:0] y;
  reg [6:0] character;

  character_rom character_rom (
      clock,
      x,
      y,
      character,
      dot
  );

  initial begin
    $dumpfile("src/video_generator/character_rom_test.vcd");
    $dumpvars(1);

    clock = 0;

    x = 0;
    y = 0;
    character = 65;

    repeat (8) begin
      repeat (8) begin
        #10;
        clock = 1;

        #10;
        clock = 0;
        x = x + 1;
      end

      y = y + 1;
    end

    #10;
    $finish;
  end
endmodule
