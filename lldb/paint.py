#!/usr/bin/env python

import lldb

def process(debugger, command, result, internal_dict):
    lldb.debugger.HandleCommand('expr -l Swift -- import UIKit')
    command_string="""
    expr -l swift --
    func $process(_ address: Int) {
        let view = unsafeBitCast(address, to: UIView.self);
        view.layer.borderColor = UIColor.red.cgColor;
        view.layer.borderWidth = 5;
        CATransaction.flush()
    }
    """
    lldb.debugger.HandleCommand(" ".join(command_string.splitlines()))    
    lldb.debugger.HandleCommand('expr -l swift -- $process(' + command + ')')

def __lldb_init_module(debugger,internal_dict):
    debugger.HandleCommand("command script add -f paint.process paint")
    print "paint command enabled."
