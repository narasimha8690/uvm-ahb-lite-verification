class ahb_agent extends uvm_agent;
  ahb_driver drv;
  ahb_monitor mon;
  uvm_sequencer #(ahb_txn) seqr;

  `uvm_component_utils(ahb_agent)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqr = uvm_sequencer #(ahb_txn)::type_id::create("seqr", this);
    drv  = ahb_driver::type_id::create("drv", this);
    mon  = ahb_monitor::type_id::create("mon", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass
