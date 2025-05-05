#!/usr/bin/env bash
lldb -p $1 -o "pro hand -s false  SIGUSR1 SIGUSR2 " -o 'call MemoryContextStats(TopMemoryContext)' -o 'quit'
