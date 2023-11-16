import os 
import subprocess


for file_name in os.listdir('./'):
    if ".mmd" in file_name:
        print("Converting", file_name)
        output = file_name.replace("mmd", "png")
        cmd = f"mmdc --input {file_name} --output {output}"
        subprocess.run(cmd, shell=True)
