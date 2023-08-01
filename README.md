# Console-Logging

## Description
The purpose of this script is to log the console output of a program to a file. This is useful for retaining original console output for retention. It retains the exact color and formatting of the original console output.

## Installation

```bash
git clone https://github.com/Dollarhyde/Console-Logging.git
cd Console-Logging
chmod +x logging.sh
./logging.sh
```

The output will be similar to this

```bash
./logging.sh 
[*] Creating directory: /home/dollarhyde/logs
[*] Copying /home/dollarhyde/.bashrc to /home/dollarhyde/.scriptrc
[*] Adding command to /home/dollarhyde/.bashrc
[*] Creating file: /home/dollarhyde/.bash_aliases
[*] Adding alias to /home/dollarhyde/.bash_aliases
[*] Done
```

Logs can be found in `/home/$USER/logs` directory

The logs should be inspected using `cat` in order to show the original formatting. For example:

```bash
cat /home/$USER/logs/bash_20230801133532.log
```