class axil_env extends uvm_env;

  axil_ragent ragent;
  axil_wagent wagent;
  axil_sbd sbd;
  axil_mon mon;

  `uvm_component_utils(axil_env)

  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ragent = axil_ragent::type_id::create("ragent", this);
    wagent = axil_wagent::type_id::create("wagent", this);
    sbd = axil_sbd::type_id::create("sbd", this);
    mon = axil_mon::type_id::create("mon", this);
  endfunction

endclass
