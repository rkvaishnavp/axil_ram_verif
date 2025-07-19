import os
import yaml
import subprocess
import sys
import shutil

current_dir = os.path.abspath(os.path.dirname(__file__))
TOT = os.path.abspath(os.path.join(current_dir, ".."))
os.environ["TOT"] = TOT

compilation_dir = os.path.join(current_dir, "__comp.tb")

if os.path.exists(compilation_dir):
    shutil.rmtree(compilation_dir)
os.makedirs(compilation_dir)
print(f"Compilation directory at: {compilation_dir}")

yaml_file = os.path.join(current_dir, "config.yaml")


def load_tb_config(yaml_file):
    if not os.path.isfile(yaml_file):
        print(f"Error: config.yaml file not found at {yaml_file}")
        sys.exit(1)

    with open(yaml_file, "r") as f:
        config = yaml.safe_load(f)

    verif_config = config.get("verif", {})

    files = verif_config.get("files", [])
    includes = verif_config.get("includes", [])
    defines = verif_config.get("defines", [])
    log_options = verif_config.get("log_options", [])

    return files, includes, defines, log_options


def compile_tb(files, includes, defines, log_options, vlog_cmd="vlog"):
    os.chdir(compilation_dir)

    subprocess.run("vlib work", shell=True, check=True)

    include_flags = " ".join(includes)
    define_flags = " ".join([f"+define+{d}" for d in defines])
    log_flags = " ".join(log_options)

    for relative_file in files:
        full_path = os.path.join(TOT, relative_file)
        cmd = f"{vlog_cmd} {log_flags} {define_flags} {include_flags} {full_path}"
        print(f"Compiling: {cmd}")
        result = subprocess.run(cmd, shell=True)
        if result.returncode != 0:
            print(f"Error: Compilation failed for {relative_file}")
            sys.exit(1)

    print("Testbench compilation completed successfully.")


if __name__ == "__main__":
    files, includes, defines, log_options = load_tb_config(yaml_file)

    if not files:
        print("Error: No testbench files found in config.yaml")
        sys.exit(1)

    compile_tb(files, includes, defines, log_options)
