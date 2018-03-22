#! /usr/bin/env python2

from subprocess import check_output

def getPass(account):
    return check_output("qubes-gpg-client-wrapper --quiet --decrypt ~/.mutt/" + account + "_pass.pgp", shell=True).strip("\n")
