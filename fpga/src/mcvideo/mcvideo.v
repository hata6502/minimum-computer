module mcvideo (
    input  wire clock,
    output wire luminance,
    output wire sync
);
  parameter character_x_length = 48;
  parameter character_y_length = 32;

  wire dot;

  wire is_horizontal_area;
  wire is_vertical_area;

  wire horizontal_sync;
  wire vertical_sync;

  reg [6:0] character_table[character_x_length*character_y_length-1 : 0];

  reg [10:0] clock_counter;
  reg [8:0] line_counter;

  character_rom character_rom (
      clock,
      clock_counter[4:2],
      line_counter[2:0],
      character_table[{line_counter[7:3], clock_counter[10:5]}],
      dot
  );

  assign is_horizontal_area = clock_counter >= 384 & clock_counter < (384 + character_x_length*32);
  assign is_vertical_area = line_counter >= 12 & line_counter < (12 + 240);
  assign luminance = is_horizontal_area & is_vertical_area & dot;

  assign horizontal_sync = clock_counter < 150;
  assign vertical_sync = line_counter < 3;
  assign sync = ~(horizontal_sync ^ vertical_sync);

  initial begin
    clock_counter = 0;
    line_counter  = 0;
  end

  always @(posedge clock) begin
    // TODO: Delete
    character_table[15*character_x_length+15] <= "m";
    character_table[15*character_x_length+16] <= "i";
    character_table[15*character_x_length+17] <= "n";
    character_table[15*character_x_length+18] <= "i";
    character_table[15*character_x_length+19] <= "m";
    character_table[15*character_x_length+20] <= "u";
    character_table[15*character_x_length+21] <= "m";
    character_table[15*character_x_length+22] <= "-";
    character_table[15*character_x_length+23] <= "c";
    character_table[15*character_x_length+24] <= "o";
    character_table[15*character_x_length+25] <= "m";
    character_table[15*character_x_length+26] <= "p";
    character_table[15*character_x_length+27] <= "u";
    character_table[15*character_x_length+28] <= "t";
    character_table[15*character_x_length+29] <= "e";
    character_table[15*character_x_length+30] <= "r";

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
