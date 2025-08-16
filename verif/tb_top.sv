`timescale 1ns / 1ps

`include "axil_pkg.sv"

module tb_top;

  import uvm_pkg::*;
  import axil_pkg::*;

  logic clk, rst;
  axil_intf #(
      .DATA_WIDTH(DATA_WIDTH),
      .ADDR_WIDTH(ADDR_WIDTH),
      .STRB_WIDTH(STRB_WIDTH)
  ) pif (
      .clk(clk),
      .rst(rst)
  );

  axil_ram_wrap #(
      .DATA_WIDTH(DATA_WIDTH),
      .ADDR_WIDTH(ADDR_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .PIPELINE_OUTPUT(PIPELINE_OUTPUT)
  ) axil_ram_dut (
      .clk(clk),
      .rst(rst),
      .axil_intf(pif)
  );

  always #5 clk = ~clk;
  initial begin
    rst = 1;
    clk = 0;
    #10;
    clk = 1;
  end

  initial begin
    run_test("axil_wr_rd_test");
    $finish();
  end

endmodule
