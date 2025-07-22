interface ahb_if (input logic HCLK, input logic HRESETn);
  logic [31:0] HADDR;
  logic HWRITE;
  logic [31:0] HWDATA;
  logic [31:0] HRDATA;
  logic HSEL;
  logic [1:0] HTRANS;
  logic HREADYOUT;
endinterface
