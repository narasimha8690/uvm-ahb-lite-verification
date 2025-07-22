class ahb_scoreboard extends uvm_component;
  uvm_analysis_imp #(ahb_txn, ahb_scoreboard) sb_ap;

  `uvm_component_utils(ahb_scoreboard)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    sb_ap = new("sb_ap", this);
  endfunction

  function void write(ahb_txn tr);
    `uvm_info("SCOREBOARD", $sformatf("Received txn: Addr=0x%0h Data=0x%0h Write=%0b", tr.addr, tr.data, tr.write), UVM_LOW)
  endfunction
endclass
