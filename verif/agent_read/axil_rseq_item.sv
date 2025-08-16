class axil_rseq_item extends uvm_sequence_item;

  // Read Address
  rand bit [ADDR_WIDTH-1:0] araddr;
  rand bit [           2:0] arprot;

  // Read Response
  bit      [DATA_WIDTH-1:0] rdata;
  bit      [           1:0] rresp;

  `uvm_object_utils_begin(axil_rseq_item)
    `uvm_field_int(araddr, UVM_ALL_ON)
    `uvm_field_int(arprot, UVM_ALL_ON)
    `uvm_field_int(rdata, UVM_ALL_ON | UVM_NOPACK)
    `uvm_field_int(rresp, UVM_ALL_ON | UVM_NOPACK)
  `uvm_object_utils_end

  function new(string name = "axil_rseq_item");
    super.new(name);
  endfunction

endclass
