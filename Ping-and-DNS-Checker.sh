#!/bin/bash

# Output CSV file
output_file="network_check_results.csv"

# CSV header
echo "IP Address,Ping Status,DNS Name,DNS Status" > "$output_file"

# Function to check ping and nslookup
check_ip() {
    ip=$1
    
    # Check ping
    if ping -c 1 -W 2 "$ip" &> /dev/null; then
        ping_status="Reachable"
    else
        ping_status="Unreachable"
    fi
    
    # Perform nslookup
    nslookup_result=$(nslookup "$ip" 2>&1)
    if echo "$nslookup_result" | grep -q "name ="; then
        dns_name=$(echo "$nslookup_result" | awk '/name =/ {print $NF}' | sed 's/\.$//')
        dns_status="Valid"
    else
        dns_name="N/A"
        dns_status="Invalid"
    fi
    
    # Append result to CSV
    echo "$ip,$ping_status,$dns_name,$dns_status" >> "$output_file"
}

# Main script
echo "Enter IP addresses (one per line, press Ctrl+D when finished):"
while IFS= read -r ip; do
    check_ip "$ip"
done

echo "Results have been saved to $output_file"
