#!/usr/bin/env bash
qemu-system-arm -M versatilepb -kernel main.bin -nographic -serial /dev/null
