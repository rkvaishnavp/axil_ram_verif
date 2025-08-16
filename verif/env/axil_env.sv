class axil_env extends uvm_env;

  axil_ragent ragent;
  axil_wagent wagent;
  axil_sbd sbd;
  axil_vsqr vsqr;

  `uvm_component_utils(axil_env)

  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ragent = axil_ragent::type_id::create("ragent", this);
    wagent = axil_wagent::type_id::create("wagent", this);
    sbd = axil_sbd::type_id::create("sbd", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    ragent.mon.analysis_port.connect(sbd.rxp);
    wagent.mon.analysis_port.connect(sbd.wxp);
    vsqr.wsqr = wagent.sqr;
    vsqr.rsqr = ragent.sqr;
  endfunction

endclass
