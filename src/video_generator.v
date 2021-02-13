module video_generator (
    input  wire clock,
    output wire luminance,
    output wire sync
);
  wire is_horizontal_area;
  wire is_vertical_area;

  wire horizontal_sync;
  wire vertical_sync;

  reg [10:0] clock_counter;
  reg [8:0] line_counter;

  assign is_horizontal_area = clock_counter >= 384 & clock_counter < (384 + 48 * 32);
  assign is_vertical_area   = line_counter >= 12 & line_counter < (12 + 240);
  assign luminance          = is_horizontal_area & is_vertical_area & clock_counter[5];

  assign horizontal_sync    = clock_counter < 150;
  assign vertical_sync      = line_counter < 3;
  assign sync               = ~(horizontal_sync ^ vertical_sync);

  initial begin
    clock_counter = 0;
    line_counter  = 0;
  end

  always @(posedge clock) begin
    if (clock_counter < 2031) begin
      clock_counter <= clock_counter + 1;
    end else begin
      if (line_counter < 261) begin
        line_counter <= line_counter + 1;
      end else begin
        line_counter <= 0;
      end

      clock_counter <= 0;
    end
  end
  /*
     
     lum <= crom_1_dot;
     */

endmodule
