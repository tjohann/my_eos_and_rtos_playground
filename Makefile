#
# my simple makefile act as something like a user interface
#

MODULES = $(shell ls -d */ | cut -f1 -d'/')
BUILD = src_qemu src_jailhouse

all::
	@echo "  +----------------------------------------------------------+"
	@echo " /                                                          /|"
	@echo "+----------------------------------------------------------+ |"
	@echo "| Usage:                                                   | |"
	@echo "| make build     -> build everthing                        | |"
	@echo "|                                                          | |"
	@echo "| make get_jailhouse -> clone jailhouse hypervisor         | |"
	@echo "|                                                          | |"
	@echo "| make clean     -> clean all dir/subdirs                  | +"
	@echo "| make distclean -> complete cleanup                       |/ "
	@echo "+----------------------------------------------------------+  "

build::
	for dir in $(BUILD); do (cd $$dir && $(MAKE) all); done

clean::
	rm -f *~ .*~
	for dir in $(MODULES); do (cd $$dir && $(MAKE) $@); done

distclean::
	rm -f *~ .*~
	for dir in $(MODULES); do (cd $$dir && $(MAKE) $@); done

get_jailhouse::
	(./scripts/get_external_git_repos.sh -r "jailhouse" -p "https")
