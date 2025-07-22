class ahb_driver extends uvm_driver #(ahb_txn);
  virtual ahb_if vif;

  `uvm_component_utils(ahb_driver)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual ahb_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Interface not set")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      ahb_txn tr;
      seq_item_port.get_next_item(tr);

      vif.HADDR   <= tr.addr;
      vif.HWRITE  <= tr.write;
      vif.HTRANS  <= 2'b10;
      vif.HSEL    <= 1'b1;
      vif.HWDATA  <= tr.data;
      @(posedge vif.HCLK);
      vif.HSEL    <= 0;
      vif.HTRANS  <= 2'b00;

      seq_item_port.item_done();
    end
  endtask
endclass
