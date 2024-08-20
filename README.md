# Network Check Script

This Bash script performs a network check on a list of IP addresses. For each IP address, it verifies its reachability using `ping` and performs a DNS lookup using `nslookup`. The results are saved in a CSV file.

## Features

- Checks the reachability of IP addresses via `ping`.
- Performs DNS lookup for each IP address using `nslookup`.
- Saves the results in a CSV file with the following columns:
  - IP Address
  - Ping Status (Reachable/Unreachable)
  - DNS Name (if found)
  - DNS Status (Valid/Invalid)

## Prerequisites

- Bash shell
- `ping` command
- `nslookup` command

These tools are commonly available on Unix-like operating systems. Ensure they are installed on your system.


## Make the Script Executable
chmod +x Ping-and-DNS-Checker.sh

## Run the Script
$ ./network_check.sh
Enter IP addresses (one per line, press Ctrl+D when finished):
8.8.8.8
1.1.1.1
192.168.1.1
<Ctrl+D>
Results have been saved to network_check_results.csv


