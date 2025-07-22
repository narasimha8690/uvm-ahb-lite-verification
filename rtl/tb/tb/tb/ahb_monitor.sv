class ahb_monitor extends uvm_monitor;
  virtual ahb_if vif;
  uvm_analysis_port #(ahb_txn) mon_ap;

  `uvm_component_utils(ahb_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    mon_ap = new("mon_ap", this);
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.HCLK);
      if (vif.HSEL && vif.HTRANS[1]) begin
        ahb_txn tr = new();
        tr.addr = vif.HADDR;
        tr.write = vif.HWRITE;
        tr.data = vif.HWRITE ? vif.HWDATA : vif.HRDATA;
        mon_ap.write(tr);
      end
    end
  endtask
endclass
