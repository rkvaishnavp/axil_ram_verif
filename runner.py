#!/usr/bin/env python3
import os
import yaml
import argparse
import shutil

def arg_parse():
    parser = argparse.ArgumentParser(
        description="Script with --rtl and --tb flags"
    )
    parser.add_argument(
        "-d", "--rtl",
        action="store_true",
        help="RTL Compilation"
    )
    parser.add_argument(
        "-v", "--tb",
        action="store_true",
        help="Testbench Compilation"
    )
    parser.add_argument(
        "-t", "--test",
        type=str,
        help="Testcase Name"
    )

    return parser.parse_args()

def main():
  args = arg_parse()

  top_dir = os.getcwd()

  if args.rtl:
    os.chdir(top_dir)
    os.chdir("./rtl")
    os.system("./run_rtl.py")

  if args.tb:
    os.chdir(top_dir)
    os.chdir("./verif")
    os.system("./run_tb.py")

  if args.test:
    os.chdir(top_dir)
    os.chdir("./regression")
    os.system(f"./run_test.py --testname {args.test}")

  if not args.rtl and not args.tb and not args.test:
    os.chdir(top_dir)
    print("No options selected (use --rtl and/or --tb and/or test)")
    exit(1)

if __name__ == "__main__":
  main()
