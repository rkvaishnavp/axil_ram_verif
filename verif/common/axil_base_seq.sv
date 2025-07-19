class axil_base_seq extends uvm_sequence #(uvm_sequence_item);
  `uvm_object_utils(axil_base_seq)

  function new(string name = "axil_base_seq");
    super.new(name);
  endfunction

  task pre_body();
    `uvm_info(get_type_name(), "Starting AXI4-Lite Base Sequence", UVM_LOW)
  endtask
endclass
