class axil_rmon extends uvm_monitor;

  `uvm_component_utils(axil_rmon)

  virtual axil_intf vif;
  axil_rcov cov;

  uvm_analysis_port #(axil_rseq_item) axil_analysis_port;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    axil_analysis_port = new("axil_analysis_port", this);

    if (!uvm_config_db#(virtual axil_intf)::get(this, "", "vif", vif)) begin
      `uvm_error(get_type_name(), "AXIL Interface Not Found")
    end
  endfunction

endclass
