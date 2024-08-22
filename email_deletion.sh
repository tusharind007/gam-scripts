#!/bin/bash

# Full path to GAM executable
GAM=/root/bin/gamadv-xtd3/gam

# Function to check if GAM command was successful
check_gam_status() {
    if [ $? -ne 0 ]; then
        echo "Error: GAM command failed."
        exit 1
    fi
}

# Function to delete emails for a single user
delete_for_single_user() {
    read -p "Enter the user email address: " user_email
    # Check if the email address is empty
    if [ -z "$user_email" ]; then
        echo "Error: Email address cannot be empty."
        exit 1
    fi

    # Simple validation for email address
    if ! [[ "$user_email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Error: Invalid email address format."
        exit 1
    fi
    
    read -p "Enter the message ID: " message_id
    # Check if the message ID is empty
    if [ -z "$message_id" ]; then
        echo "Error: Message ID cannot be empty."
        exit 1
    fi

    echo "Deleting email with message ID '$message_id' for user '$user_email'..."
    $GAM user "$user_email" delete messages query "rfc822msgid:$message_id" doit
    check_gam_status
    echo "Deletion command executed for user $user_email."
}

# Function to delete emails for all users
delete_for_all_users() {
    read -p "Enter the message ID: " message_id
    # Check if the message ID is empty
    if [ -z "$message_id" ]; then
        echo "Error: Message ID cannot be empty."
        exit 1
    fi

    echo "Deleting email with message ID '$message_id' for all users..."
    $GAM all users delete messages query "rfc822msgid:$message_id" doit
    check_gam_status
    echo "Deletion command executed for all users."
}

# Main script logic
echo "Email Deletion Options:"
echo "1) Delete Email For Single User"
echo "2) Delete Email For All Users"
read -p "Choose an option (1 or 2): " option

case $option in
    1)
        delete_for_single_user
        ;;
    2)
        delete_for_all_users
        ;;
    *)
        echo "Error: Invalid option. Please choose 1 or 2."
        exit 1
        ;;
esac

