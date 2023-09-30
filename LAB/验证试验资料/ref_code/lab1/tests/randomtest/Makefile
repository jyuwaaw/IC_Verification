include ../Makefile.common

VCS_CUSTOMOPTS := -debug_all -sverilog  
VCS_OPTS := $(VCS_DEFOPTS) $(VCS_CUSTOMOPTS)

VCOM_OPTS := +acc

PWD= $(shell pwd)
PRJDIR = $(PWD)/../..
SRCDIR = $(PRJDIR)/rtl
SIMDIR = $(PRJDIR)/sim

SRCS =$(SRCDIR)/fa.v $(SRCDIR)/add4.v
FSRC = design.f
SIMENVSRC :=
TESTSRC := randomtest_add4.v
vcs_compile_src:
	@echo CMD: vcs $(VCS_OPTS) $(SRCS) $(SIMENVSRC) $(TESTSRC)
	vcs $(VCS_OPTS) $(SRCS) $(SIMENV) $(TESTSRC)

vcs_compile_fsrc:
	@echo CMD: vcs $(VCS_OPTS) -f $(FSRC) $(SIMENVSRC) $(TESTSRC)
	vcs $(VCS_OPTS) -f $(FSRC) $(SIMENVSRC) $(TESTSRC)
vcs_run_gui:
	#@echo CMD: vcs -RI $(VCS_OPTS) $(SRCS) $(SIMENVSRC) $(TESTSRC)
	#vcs -RI $(VCS_OPTS) $(SRCS) $(SIMENV) $(TESTSRC)
	#@echo CMD: vcs -gui $(VCS_OPTS) $(SRCS) $(SIMENVSRC) $(TESTSRC)
	vcs -gui $(VCS_OPTS) $(SRCS) $(SIMENV) $(TESTSRC)
	./simv -gui=dve
vsim_run:
	vlib work
	vlog -work work $(VCOM_OPTS)  -f $(FSRC) $(SIMENVSRC) $(TESTSRC)
	vsim -c work.randomtest_add4 -do "run -all"
