#!/usr/bin/env python3
#
# Petit P4 Tools - p4-download
#
# Description:
#   Download all files from the specified depot directory.
#
# Usage:
#   $ ./p4-download.py //depot/path output_dir
#
# Author:
#   Masatoshi OHTA (2014-06-02)
#
import os
import re
import subprocess
import sys

COMMAND_FSTAT = 'p4 fstat -T "depotFile" '
COMMAND_DIRS = 'p4 dirs '
COMMAND_PRINT = 'p4 print -o '

def print_usage():
    print('Usage: {} <depot_path> <output_dir>'.format(sys.argv[0]))
    print(' e.g.) {} //your/project project'.format(sys.argv[0]))
    sys.exit(1)

def make_depot_basepath(path):
    if path[-2:] == '/*':
        return path[:-2]
    elif path[-1] == '/':
        return path[:-1]
    return path

# [util]
def command(*args):
    com = ' '.join(args)
    pipe = subprocess.Popen(com, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    for line in pipe.stdout:
        line = line.decode('utf-8').rstrip()
        yield line
    pipe.wait()  # wait until the child process ends

def p4_dirs(basepath):
    cmd = COMMAND_DIRS + basepath + '/*'
    for line in command(cmd):
        yield line

def p4_files(basepath):
    cmd = COMMAND_FSTAT + basepath + '/*'
    for line in command(cmd):
        match = re.match(r'\.\.\. depotFile (.+)', line)
        if match:
            yield match.group(1)

def p4_save(dep_path, local_path):
    for line in command(COMMAND_PRINT, local_path, dep_path):
        pass

def download_files(basepath, search_path, out_dir):
    # Create an output directory
    relative_dir = out_dir + search_path[len(basepath):]
    try:
        os.mkdir(relative_dir)
    except FileExistsError as e:
        print(e)
        sys.exit(1)

    # Output files
    for x in p4_files(search_path):
        local_path = relative_dir + '/' + os.path.basename(x)
        p4_save(x, local_path)
        print(local_path)

    # Search files recursively
    for x in p4_dirs(search_path):
        download_files(basepath, x, out_dir)

if __name__ == '__main__':
    try: dep_path, out_dir = sys.argv[1:3]
    except ValueError: print_usage()

    basepath = make_depot_basepath(dep_path)
    print('Retrieving ... ' + basepath)
    download_files(basepath, basepath, out_dir)

