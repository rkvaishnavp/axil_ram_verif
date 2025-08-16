class axil_vsqr extends uvm_sequencer;
  `uvm_component_utils(axil_vsqr)

  axil_wsqr wsqr;
  axil_rsqr rsqr;

  function new(string name = "axil_vsqr", uvm_component parent = null);
    super.new(name, parent);
  endfunction

endclass
