#!/usr/bin/env python

import lldb

def process(debugger, command, result, internal_dict):
    lldb.debugger.HandleCommand('expr -l Swift -- import UIKit')
    lldb.debugger.HandleCommand("""
    expr -l swift --
    func $process(_ data: Data) {
        print(String(data: data, encoding: .utf8) ?? "data is nil")
    }
    """.strip())
    lldb.debugger.HandleCommand('expr -l swift -- $process(' + command + ')')

def __lldb_init_module(debugger,internal_dict):
    debugger.HandleCommand("command script add -f d2s.process d2s")
    print "d2s command enabled."
