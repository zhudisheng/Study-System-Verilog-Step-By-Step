TB_FILE_LIST  =  filelist.list

all: clean comp run

COMP = vcs -sverilog -full64 +v2k -debug_acc+all -debug_region+cell+encrypt -fsdb -cpp g++-7 -cc gcc-7 -LDFLAGS -Wl,--no-as-needed 

SIMV = ./simv

comp:
	$(COMP) -f $(TB_FILE_LIST) 
run:
	$(SIMV) -l simv.log
clean:
	rm -rf AN.DB DVEfiles csrc *.simv *.simv.daidir ucli.key 64
	rm -rf *.log* *.vpd *.fsdb *.vdb novas* *verdi*
	rm -rf simv*

