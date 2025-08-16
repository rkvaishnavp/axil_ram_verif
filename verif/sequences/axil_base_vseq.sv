class axil_base_vseq extends uvm_sequence;

  `uvm_object_utils(axil_base_vseq)
  function new(string name = "axil_base_vseq");
    super.new(name);
  endfunction

  task body();
    `uvm_info(get_type_name(), "Starting base virtual sequence", UVM_LOW)
  endtask
endclass
