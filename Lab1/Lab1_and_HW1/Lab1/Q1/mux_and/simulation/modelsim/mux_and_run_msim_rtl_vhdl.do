transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/cs254/Documents/mux_and/mux_and.vhdl}

vcom -93 -work work {/home/cs254/Documents/mux_and/TestBench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  TestBench

add wave *
view structure
view signals
run -all
