#! /usr/bin/env python2

from subprocess import check_output

def getPass(passPath):
    return check_output("/home/vincent/.local/bin/getPass.sh " + passPath, shell=True).strip("\n")
