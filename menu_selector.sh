#!/bin/bash

while true; do
    clear
    echo "Google Workspace Admin Menu"
    echo "1. Delete Emails"
    echo "2. Sign Out User"
    echo "3. Add Email Forwarding"
    echo "4. Remove Email Forwarding"
    echo "5. Add Send AS Permission"
    echo "6. Remove Send AS Permission"
    echo "7. Exit"
    read -p "Choose an option: " option

    case $option in
        1)
            read -p "Enter user email: " user_email
            read -p "Enter query: " query
            ./email_deletion.sh "$user_email" "$query"
            ;;
        2)
            read -p "Enter user email: " user_email
            ./signout_users.sh "$user_email"
            ;;
        3)
            read -p "Enter user email: " user_email
            read -p "Enter forwarding email: " forward_email
            ./email_forwarding.sh "$user_email" "$forward_email" "add"
            ;;
        4)
            read -p "Enter user email: " user_email
            read -p "Enter forwarding email: " forward_email
            ./email_forwarding.sh "$user_email" "$forward_email" "remove"
            ;;
        5)
            read -p "Enter user email: " user_email
            read -p "Enter Send As email: " send_as_email
            ./send_as.sh "$user_email" "$send_as_email" "add"
            ;;
        6)
            read -p "Enter user email: " user_email
            read -p "Enter Send As email: " send_as_email
            ./send_as.sh "$user_email" "$send_as_email" "remove"
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

    read -p "Press any key to continue..." -n1 -s
done
