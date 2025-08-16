class axil_wr_seq extends uvm_sequence #(axil_wseq_item);

  `uvm_object_utils(axil_wr_seq)

  function new(string name = "axil_wr_seq");
    super.new(name);
  endfunction

endclass
