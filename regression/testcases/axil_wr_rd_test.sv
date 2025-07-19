class axil_wr_rd_test extends axil_base_test;
  `uvm_component_utils(axil_wr_rd_test)

  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("WRITE_READ_TEST", "Starting write-read sequences...", UVM_MEDIUM)
    fork
      wr_seq.start(env.wagent.wsqr);
      rd_seq.start(env.ragent.rsqr);
    join
    phase.drop_objection(this);
  endtask
endclass
