class axil_base_test extends uvm_test;

  `uvm_component_utils(axil_base_test)

  axil_env env;
  axil_wr_seq wr_seq;
  axil_rd_seq rd_seq;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = axil_env::type_id::create("env", this);
    wr_seq = axil_wr_seq::type_id::create("wr_seq");
    rd_seq = axil_rd_seq::type_id::create("rd_seq");
  endfunction

endclass
