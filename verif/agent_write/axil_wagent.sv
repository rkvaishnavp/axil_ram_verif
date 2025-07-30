class axil_wagent extends uvm_agent;

  `uvm_component_utils(axil_wagent)

  axil_wdrv drv;
  axil_wsqr sqr;
  axil_wmon mon;
  axil_wcov cov;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = axil_wdrv::type_id::create("drv", this);
    sqr = axil_wsqr::type_id::create("sqr", this);
    mon = axil_wmon::type_id::create("mon", this);
    cov = axil_wcov::type_id::create("cov", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
    mon.analysis_port.connect(cov.analysis_export);
  endfunction
endclass
