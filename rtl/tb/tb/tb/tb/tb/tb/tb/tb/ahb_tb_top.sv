module ahb_tb_top;
  logic HCLK, HRESETn;
  ahb_if ahb_if_i(HCLK, HRESETn);

  // Clock generation
  initial HCLK = 0;
  always #5 HCLK = ~HCLK;

  // Reset logic
  initial begin
    HRESETn = 0;
    #20 HRESETn = 1;
  end

  // DUT instantiation
  ahb_slave dut (
    .HCLK(HCLK),
    .HRESETn(HRESETn),
    .HADDR(ahb_if_i.HADDR),
    .HWRITE(ahb_if_i.HWRITE),
    .HWDATA(ahb_if_i.HWDATA),
    .HRDATA(ahb_if_i.HRDATA),
    .HSEL(ahb_if_i.HSEL),
    .HTRANS(ahb_if_i.HTRANS),
    .HREADYOUT(ahb_if_i.HREADYOUT)
  );

  // UVM config & run
  initial begin
    uvm_config_db#(virtual ahb_if)::set(null, "*", "vif", ahb_if_i);
    run_test("ahb_test");
  end
endmodule
