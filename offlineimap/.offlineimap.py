#! /usr/bin/env python2

from subprocess import check_output

def getPass(passPath):
    return check_output("pass " + passPath, shell=True).strip("\n")
