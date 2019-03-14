#!/usr/bin/env python

import lldb

def process(debugger, command, result, internal_dict):
    lldb.debugger.HandleCommand("""
    expr -l swift --
    func $process(_ name: String) {
        print(String(data: name, encoding: .utf8))
    }
    """.strip())
    lldb.debugger.HandleCommand('expr -l swift -- $process(' + command + ')')

def __lldb_init_module(debugger,internal_dict):
    debugger.HandleCommand("command script add -f string.process string")
    print "string command enabled."
