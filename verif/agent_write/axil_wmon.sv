class axil_mon extends uvm_monitor;

  `uvm_component_utils(axil_mon)

  virtual axil_intf vif;
  uvm_analysis_port #(axil_wseq_item) axil_analysis_port;

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

  task run_phase(uvm_phase phase);
    axil_wseq_item item;
    forever begin
      @(posedge vif.clk);
      item = axil_wseq_item::type_id::create("item");

      if (vif.s_axil_wvalid && vif.s_axil_wready) begin
        item.wdata = vif.s_axil_wdata;
        item.wstrb = vif.s_axil_wstrb;
      end

      if (vif.s_axil_awvalid && vif.s_axil_awready) begin
        item.awaddr = vif.s_axil_awaddr;
        item.awprot = vif.s_axil_awprot;
      end

      if (vif.s_axil_bvalid && vif.s_axil_bready) begin
        item.bresp = vif.s_axil_bresp;
      end

      axil_analysis_port.write(item);
    end
  endtask

endclass
