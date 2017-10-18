/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_cpu_write;
  wire [1-1:0] M_cpu_read;
  wire [8-1:0] M_cpu_address;
  wire [8-1:0] M_cpu_dout;
  reg [8-1:0] M_cpu_din;
  cpu_2 cpu (
    .clk(clk),
    .rst(rst),
    .din(M_cpu_din),
    .write(M_cpu_write),
    .read(M_cpu_read),
    .address(M_cpu_address),
    .dout(M_cpu_dout)
  );
  reg [7:0] M_led_reg_d, M_led_reg_q = 1'h0;
  wire [8-1:0] M_alu_alu;
  reg [6-1:0] M_alu_alufn;
  reg [8-1:0] M_alu_a;
  reg [8-1:0] M_alu_b;
  alu_3 alu (
    .clk(clk),
    .rst(rst),
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .alu(M_alu_alu)
  );
  
  always @* begin
    M_led_reg_d = M_led_reg_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_cpu_din = 8'bxxxxxxxx;
    io_led = io_dip;
    if (M_cpu_address == 8'h80) begin
      if (M_cpu_write) begin
        M_led_reg_d = M_cpu_dout;
      end
      if (M_cpu_read) begin
        M_cpu_din = M_led_reg_q;
      end
    end
    M_alu_alufn = io_dip[16+2+5-:6];
    M_alu_a = io_dip[8+7-:8];
    M_alu_b = io_dip[0+7-:8];
    led = {3'h0, io_button};
    led = M_led_reg_q;
    io_led[16+7-:8] = M_alu_alu;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_led_reg_q <= 1'h0;
    end else begin
      M_led_reg_q <= M_led_reg_d;
    end
  end
  
endmodule
