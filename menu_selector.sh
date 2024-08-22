#!/bin/bash

# Function to display the menu and handle selection
show_menu() {
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
            /root/gam-scripts/email_deletion.sh
            ;;
        2)
            /root/gam-scripts/signout_users.sh
            ;;
        3)
            /root/gam-scripts/add_email_forwarding.sh
            ;;
        4)
            /root/gam-scripts/remove_email_forwarding.sh
            ;;
        5)
            /root/gam-scripts/add_send_as.sh
            ;;
        6)
            /root/gam-scripts/remove_send_as.sh
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose 1-7."
            read -p "Press Enter to continue..." # Pause to let user see the error
            ;;
    esac
}

# Call the function to display the menu
show_menu

