class ahb_test extends uvm_test;
  ahb_env env;

  `uvm_component_utils(ahb_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ahb_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    ahb_txn tx;
    phase.raise_objection(this);
    for (int i = 0; i < 5; i++) begin
      tx = ahb_txn::type_id::create("tx");
      tx.randomize();
      env.agent.seqr.start_item(tx);
      env.agent.seqr.finish_item(tx);
    end
    phase.drop_objection(this);
  endtask
endclass
