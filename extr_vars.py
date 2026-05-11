import os 

file_path = 'vars.tex'

try: os.remove(file_path)
except FileNotFoundError: 
  pass

dir = os.path.basename(os.getcwd())

with open(file_path, "w") as f:
  f.write("\\def \\pdfurl {https://mschweikardt.github.io/ee-notes/" + dir + ".pdf}\n")
  f.write("\\def \\srcurl {https://github.com/mschweikardt/ee-notes/tree/main/notes/" + dir + "}\n")


import subprocess
date_string = subprocess.getoutput("git log -1 --pretty=\"format:%as\" main.tex")

from datetime import datetime

try: parsed_date = datetime.strptime(date_string, "%Y-%m-%d") 
except ValueError: 
  exit()

with open(file_path, "a") as f:
    f.write("\\def \\date   {" + parsed_date.strftime("%B %d, %Y") + "}")




