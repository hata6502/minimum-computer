/* verilator lint_off STMTDLY */

module mcvideo_test (
    output wire luminance,
    output wire sync
);
  reg clock;

  mcvideo mcvideo (
      clock,
      luminance,
      sync
  );

  initial begin
    clock = 0;

    repeat (2032 * 31) begin
      #10;
      clock = 1;

      #10;
      clock = 0;
    end

    $dumpfile("src/mcvideo/mcvideo_test.vcd");
    $dumpvars(1);

    // Vertical drawing area start
    repeat (2032 * 2) begin
      #10;
      clock = 1;

      #10;
      clock = 0;
    end

    // drawing line
    repeat (2032 * 1) begin
      #10;
      clock = 1;

      #10;
      clock = 0;
    end

    $dumpoff();

    repeat (2032 * 197) begin
      #10;
      clock = 1;

      #10;
      clock = 0;
    end

    $dumpon();

    // Vertical drawing area end
    repeat (2032 * 2) begin
      #10;
      clock = 1;

      #10;
      clock = 0;
    end

    $dumpoff();

    repeat (2032 * 28) begin
      #10;
      clock = 1;

      #10;
      clock = 0;
    end

    $dumpon();

    // Vertical sync
    repeat (2032 * 5) begin
      #10;
      clock = 1;

      #10;
      clock = 0;
    end

    #10;
    $finish;
  end
endmodule
