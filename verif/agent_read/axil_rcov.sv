class axil_rcov extends uvm_subscriber #(axil_rseq_item);
  `uvm_component_utils(axil_rcov)

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction
endclass
