#!/bin/bash
# use testnet settings,  if you need mainnet,  use ~/.bytncore/bytnd.pid file instead
bytn_pid=$(<~/.bytncore/testnet3/bytnd.pid)
sudo gdb -batch -ex "source debug.gdb" bytnd ${bytn_pid}
