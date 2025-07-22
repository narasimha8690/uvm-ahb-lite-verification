class ahb_env extends uvm_env;
  ahb_agent agent;
  ahb_scoreboard sb;

  `uvm_component_utils(ahb_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = ahb_agent::type_id::create("agent", this);
    sb    = ahb_scoreboard::type_id::create("sb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    agent.mon.mon_ap.connect(sb.sb_ap);
  endfunction
endclass
