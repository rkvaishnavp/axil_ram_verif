`uvm_analysis_imp_decl(_write)
`uvm_analysis_imp_decl(_read)

class axil_sbd extends uvm_scoreboard;

  uvm_analysis_imp_write #(axil_wseq_item, axi_sbd) imp_write;
  uvm_analysis_imp_read #(axil_rseq_item, axi_sbd) imp_read;

  uvm_tlm_fifo #(axil_wseq_item) write_fifo;
  uvm_tlm_fifo #(axil_rseq_item) read_fifo;

  axil_wseq_item w_tx;
  axil_rseq_item r_tx;

  `uvm_component_utils(axil_sbd)

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    imp_write  = new("imp_write", this);
    imp_read   = new("imp_read", this);
    write_fifo = new("write_fifo", this);
    read_fifo  = new("read_fifo", this);
  endfunction

endclass
