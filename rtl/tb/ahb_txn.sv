class ahb_txn extends uvm_sequence_item;
  rand bit [31:0] addr, data;
  rand bit write;

  `uvm_object_utils(ahb_txn)

  function new(string name="ahb_txn");
    super.new(name);
  endfunction

  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field_int("addr", addr, $bits(addr));
    printer.print_field_int("data", data, $bits(data));
    printer.print_field_int("write", write, 1);
  endfunction
endclass
