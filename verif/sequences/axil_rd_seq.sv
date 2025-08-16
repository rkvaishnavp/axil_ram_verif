class axil_rd_seq extends uvm_sequence #(axil_rseq_item);

  `uvm_object_utils(axil_rd_seq)

  function new(string name = "axil_rd_seq");
    super.new(name);
  endfunction

endclass
