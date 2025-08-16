#!/usr/bin/env python3
import os
import yaml
import subprocess
import sys
import shutil

current_dir = os.path.abspath(os.path.dirname(__file__))
TOT = os.path.abspath(os.path.join(current_dir, ".."))
os.environ["TOT"] = TOT

compilation_dir = os.path.join(current_dir, "__comp.rtl")
if os.path.exists(compilation_dir):
    shutil.rmtree(compilation_dir)
    os.makedirs(compilation_dir)
else:
    os.makedirs(compilation_dir)
print(f"Compilation directory at: {compilation_dir}")

yaml_file = os.path.join(current_dir, "config.yaml")


def load_rtl_files(yaml_file):
    with open(yaml_file, "r") as f:
        config = yaml.safe_load(f)
    return config.get("rtl", [])


def compile_rtl(files, vlog_cmd="vlog"):
    os.chdir(compilation_dir)

    subprocess.run("vlib work", shell=True, check=True)

    for relative_file in files:
        full_path = os.path.join(TOT, relative_file)
        cmd = f"{vlog_cmd} {full_path}"
        print(f"Compiling: {cmd}")
        result = subprocess.run(cmd, shell=True)
        if result.returncode != 0:
            print(f"Compilation failed for: {relative_file}")
            sys.exit(1)

    print("Compilation completed successfully.")


if __name__ == "__main__":
    rtl_files = load_rtl_files(yaml_file)
    if not rtl_files:
        print("No RTL files found in YAML.")
        sys.exit(1)

    compile_rtl(rtl_files)
