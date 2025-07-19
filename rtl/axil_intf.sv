interface axil_intf #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 16,
    parameter STRB_WIDTH = (DATA_WIDTH / 8)
) (
    input clk,
    input rst
);

  logic [ADDR_WIDTH-1:0] s_axil_awaddr;
  logic [           2:0] s_axil_awprot;
  logic                  s_axil_awvalid;
  logic                  s_axil_awready;
  logic [DATA_WIDTH-1:0] s_axil_wdata;
  logic [STRB_WIDTH-1:0] s_axil_wstrb;
  logic                  s_axil_wvalid;
  logic                  s_axil_wready;
  logic [           1:0] s_axil_bresp;
  logic                  s_axil_bvalid;
  logic                  s_axil_bready;
  logic [ADDR_WIDTH-1:0] s_axil_araddr;
  logic [           2:0] s_axil_arprot;
  logic                  s_axil_arvalid;
  logic                  s_axil_arready;
  logic [DATA_WIDTH-1:0] s_axil_rdata;
  logic [           1:0] s_axil_rresp;
  logic                  s_axil_rvalid;
  logic                  s_axil_rready;

endinterface  //axil_intf
