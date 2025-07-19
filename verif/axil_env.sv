class axil_env extends uvm_env;

  axil_ragent ragent;
  axil_wagent wagent;
  axil_sbd sbd;

  `uvm_component_utils(axil_env)

  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction

endclass
