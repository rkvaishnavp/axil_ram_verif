module axil_ram_wrap #(
    // Width of data bus in bits
    parameter DATA_WIDTH = 32,
    // Width of address bus in bits
    parameter ADDR_WIDTH = 16,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH / 8),
    // Extra pipeline register on output
    parameter PIPELINE_OUTPUT = 0
) (
    input logic clk,
    input logic rst,

    axil_intf pif
);

  axil_ram #(
      .DATA_WIDTH(DATA_WIDTH),
      .ADDR_WIDTH(ADDR_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .PIPELINE_OUTPUT(PIPELINE_OUTPUT)
  ) mem_0 (
      
      // Clock and Reset
      .clk(clk),
      .rst(rst),

      // Write Address Channel
      .s_axil_awaddr (pif.s_axil_awaddr),
      .s_axil_awprot (pif.s_axil_awprot),
      .s_axil_awvalid(pif.s_axil_awvalid),
      .s_axil_awready(pif.s_axil_awready),

      // Write Data Channel
      .s_axil_wdata  (pif.s_axil_wdata),
      .s_axil_wstrb  (pif.s_axil_wstrb),
      .s_axil_wvalid (pif.s_axil_wvalid),
      .s_axil_wready (pif.s_axil_wready),

      // Write Response Channel
      .s_axil_bresp  (pif.s_axil_bresp),
      .s_axil_bvalid (pif.s_axil_bvalid),
      .s_axil_bready (pif.s_axil_bready),

      // Read Address Channel
      .s_axil_araddr (pif.s_axil_araddr),
      .s_axil_arprot (pif.s_axil_arprot),
      .s_axil_arvalid(pif.s_axil_arvalid),
      .s_axil_arready(pif.s_axil_arready),

      // Read Data Channel
      .s_axil_rdata  (pif.s_axil_rdata),
      .s_axil_rresp  (pif.s_axil_rresp),
      .s_axil_rvalid (pif.s_axil_rvalid),
      .s_axil_rready (pif.s_axil_rready)
  );

endmodule
