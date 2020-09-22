#
# make all a little bit simpler
#

SRC:= main

all:  $(SRC).s $(SRC).elf $(SRC).bin debug_infos

$(SRC).elf::
	arm-none-eabi-as -mimplicit-it=always -o  $(SRC).o $(SRC).s
	arm-none-eabi-ld -T main.ld -o  $(SRC).elf  $(SRC).o

$(SRC).bin: $(SRC).elf
	arm-none-eabi-objcopy -O binary  $(SRC).elf  $(SRC).bin

debug_infos: nm_$(SRC) readelf_$(SRC) objdump_$(SRC)

nm_main: $(SRC).elf
	arm-none-eabi-nm  $(SRC).elf > nm_$(SRC).txt

readelf_main:  $(SRC).elf
	arm-none-eabi-readelf -a $(SRC).elf > readelf_$(SRC).txt

objdump_main: $(SRC).elf
	arm-none-eabi-objdump -d $(SRC).elf > objdump_$(SRC).txt

clean::
	rm -f *~
	rm -f *.o
	rm -f *.elf
	rm -f *.bin

distclean: clean
