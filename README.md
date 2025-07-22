# AHB-Lite UVM Testbench

This project demonstrates a complete UVM testbench for a simple AHB-Lite slave. It includes all UVM components and supports both read and write transactions.

## ✅ Components

- **RTL:** AHB-Lite slave module (write/read)
- **UVM TB:**
  - `interface`, `transaction`, `driver`, `monitor`, `scoreboard`
  - `agent`, `env`, `test`, and `top module`

## 🛠 How to Run

Use VCS or Questa:
```sh
vcs -full64 -sverilog -ntb_opts uvm +incdir+tb +incdir+rtl -f run.f
./simv
