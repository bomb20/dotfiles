#!/usr/bin/env bash

mount -o bind,users "/home/.snapshots/$1/snapshot" /home/.mnt
