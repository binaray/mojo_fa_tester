/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
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
    input [23:0] io_dip,
    input [1:0] cs,
    output reg [2:0] cba
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [3-1:0] M_ctr_value;
  counter_2 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    io_led = io_dip;
    cba = M_ctr_value;
    io_led[16+5+2-:3] = M_ctr_value;
    io_led[0+0+1-:2] = cs;
    
    case (M_ctr_value)
      3'h0: begin
        if (cs != 2'h0) begin
          io_led[8+7-:8] = 8'hff;
        end
      end
      3'h1: begin
        if (cs != 2'h1) begin
          io_led[8+7-:8] = 8'hff;
        end
      end
      3'h2: begin
        if (cs != 2'h1) begin
          io_led[8+7-:8] = 8'hff;
        end
      end
      3'h3: begin
        if (cs != 2'h2) begin
          io_led[8+7-:8] = 8'hff;
        end
      end
      3'h4: begin
        if (cs != 2'h1) begin
          io_led[8+7-:8] = 8'hff;
        end
      end
      3'h5: begin
        if (cs != 2'h2) begin
          io_led[8+7-:8] = 8'hff;
        end
      end
      3'h6: begin
        if (cs != 2'h2) begin
          io_led[8+7-:8] = 8'hff;
        end
      end
      3'h7: begin
        if (cs != 2'h3) begin
          io_led[8+7-:8] = 8'hff;
        end
      end
    endcase
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
  end
endmodule