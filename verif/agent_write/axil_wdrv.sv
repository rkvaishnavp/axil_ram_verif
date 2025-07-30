class axil_wdrv extends uvm_driver #(axil_wseq_item);

  `uvm_component_utils(axil_wdrv)
  virtual axil_intf vif;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual axil_intf)::get(this, "", "vif", vif)) begin
      `uvm_error(get_type_name(), "AXIL_WDRV Error: Cannot Get AXIL Interface")
    end
  endfunction

  task run_phase(uvm_phase phase);
    axil_wseq_item wobj;
    super.run_phase(phase);

    forever begin
      `uvm_info(get_type_name(), "Waiting for Sequencer to push data", UVM_MEDIUM)
      seq_item_port.get_next_item(wobj);
      drive(wobj);
      seq_item_port.item_done();
    end
  endtask

  virtual task drive(axil_wseq_item wobj);
  endtask
endclass
