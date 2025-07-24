class axil_wseq_item extends uvm_sequence_item;

  // Write Address
  rand bit [ADDR_WIDTH-1:0] awaddr;
  rand bit [           2:0] arprot;

  // Write Data
  rand bit [DATA_WIDTH-1:0] wdata  [$];
  rand bit [STRB_WIDTH-1:0] wstrb  [$];

  // Write Response
  bit      [           1:0] bresp;

  `uvm_object_utils_begin(axil_wseq_item)
    `uvm_field_int(awaddr, UVM_ALL_ON)
    `uvm_field_int(awprot, UVM_ALL_ON)
    `uvm_field_int(wdata, UVM_ALL_ON)
    `uvm_field_int(wstrb, UVM_ALL_ON)
    `uvm_field_int(bresp, UVM_ALL_ON | UVM_NOPACK)
  `uvm_object_utils_end

  function new(string name = "axil_wseq_item");
    super.new(name);
  endfunction

endclass
