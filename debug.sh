#!/usr/bin/env bash
sudo gdb -p $1 \
     -ex 'set unwindonsignal on' \
     -ex 'set pagination off' \
     -ex "handle SIGUSR1 SIGUSR2 nostop noprint" \
     -ex 'call (void)MemoryContextStats(TopMemoryContext)' \
     -ex 'detach' \
     -ex 'quit'
