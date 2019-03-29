#!/usr/bin/env python

import lldb

def process(debugger, command, result, internal_dict):
    lldb.debugger.HandleCommand('expr -l Swift -- import UIKit')    
    command_string="""
    expr -l swift --
    func $process(_ data: Data) {
        print(String(data: data, encoding: .utf8) ?? "data is nil")
    }
    """
    lldb.debugger.HandleCommand(" ".join(command_string.splitlines()))
    lldb.debugger.HandleCommand('expr -l swift -- $process(' + command + ')')

def __lldb_init_module(debugger,internal_dict):
    description = 'Convert Data to String with UTF8 encoding'

    debugger.HandleCommand('command script add --help "{help}" -f d2s.process d2s'.format(help=description))
    print("d2s command enabled.")

