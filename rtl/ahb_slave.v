module ahb_slave (
    input         HCLK,
    input         HRESETn,
    input  [31:0] HADDR,
    input         HWRITE,
    input  [31:0] HWDATA,
    output [31:0] HRDATA,
    input         HSEL,
    input  [1:0]  HTRANS,
    output        HREADYOUT
);

  reg [31:0] mem [0:255];
  reg [31:0] rdata;

  assign HRDATA = rdata;
  assign HREADYOUT = 1'b1;

  always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn)
      rdata <= 32'd0;
    else if (HSEL && HTRANS[1]) begin
      if (HWRITE)
        mem[HADDR[9:2]] <= HWDATA;
      else
        rdata <= mem[HADDR[9:2]];
    end
  end

endmodule
