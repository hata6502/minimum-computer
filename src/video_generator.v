module video_generator (
    input  wire clock,
    output wire luminance,
    output wire sync
);
  wire [7:0] character_data[7:0];
  wire [7:0] character_line_data;
  wire dot;

  wire is_horizontal_area;
  wire is_vertical_area;

  wire horizontal_sync;
  wire vertical_sync;

  reg [10:0] clock_counter;
  reg [8:0] line_counter;

  assign character_data[0]   = 'b00010010;
  assign character_data[1]   = 'b00101010;
  assign character_data[2]   = 'b01000100;
  assign character_data[3]   = 'b10000010;
  assign character_data[4]   = 'b11111110;
  assign character_data[5]   = 'b10000010;
  assign character_data[6]   = 'b10000010;
  assign character_data[7]   = 'b00000000;
  assign character_line_data = character_data[line_counter[2:0]];
  assign dot                 = character_line_data[7-clock_counter[4:2]];

  assign is_horizontal_area  = clock_counter >= 384 & clock_counter < (384 + 48 * 32);
  assign is_vertical_area    = line_counter >= 12 & line_counter < (12 + 240);
  assign luminance           = is_horizontal_area & is_vertical_area & dot;

  assign horizontal_sync     = clock_counter < 150;
  assign vertical_sync       = line_counter < 3;
  assign sync                = ~(horizontal_sync ^ vertical_sync);

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
