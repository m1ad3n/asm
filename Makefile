ASM=as
AFLAGS=-g
LD=ld
LDFLAGS=

SRCS=$(shell find ./ -name "*.s")
ELFS=$(SRCS:./src/%.s=./out/%)

all: $(ELFS)

out/%: out/%.o | out 
	@$(LD) $(LDFLAGS) -o $@ $<
	@echo -e "LD $@ \e[32mPASS\e[0m"

.PRECIOUS: out/%.o
out/%.o: src/%.s | out
	@$(ASM) $(AFLAGS) -o $@ $<
	@echo -e "AS $< \e[32mPASS\e[0m"

out:
	@mkdir $@

.PHONY: clean
clean:
	@rm -rvf out

