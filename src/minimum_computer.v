module minimum_computer (
    inout wire [15:0] a,
    inout wire [15:0] b,
    inout wire [15:0] c,
    input wire clk
);
  wire luminance;
  wire sync;

  video_generator video_generator (
      clk,
      luminance,
      sync
  );

  assign a[0] = luminance;
  assign a[1] = sync;
endmodule
