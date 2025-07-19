class axil_mon extends uvm_monitor;

  `uvm_component_utils(axil_mon)

  virtual axil_intf vif;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

endclass
