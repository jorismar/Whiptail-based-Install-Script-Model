#! /usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#               Author: Jorismar Barbosa Meira                          #
#               E-Mail: jorismar.barbosa@gmail.com                      #
#               Created: 20 January 2018                                #
#               Modified: 20 January 2018                               #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# ----------------------------- Variables ----------------------------- #

# Custom variables
USER_EXAMPLE="User"
PASSWORD_EXAMPLE="123456"

# Configure installation
__TITLE="INSTALLER EXAMPLE"
__MESSAGE="Installing..."
__LOG_FILE="log.txt"

# Variables to provide access to dialog entries and progress percent value.
__PROGRESS_COUNT=0
__REQUESTED_ANSWER=false
__REQUESTED_TEXT=""
__REQUESTED_PASSWORD=""

# --------------------- Custom Callback Functions --------------------- #

function your_custom_callback_1 {
    echo "Callback 1 --> Args: $1 $2 $3"
}

function your_custom_callback_2 {
    echo "Callback 2 --> Args: $1 $2 $3"
}

function your_custom_callback_3 {
    echo "Callback 3 --> Args: $1 $2 $3"
}

# ------------------------- Install Functions ------------------------- #

# ##################################################################### #
#                             DON'T CHANGE!                             #
# ##################################################################### #

# Update progress percent value
#   $1 = Percent value
function update_progress {
    __PROGRESS_COUNT=$1
    echo $__PROGRESS_COUNT
}

# Call custom functions
#   $1 = Function callback
#   $2, $3, ..., $9 = Arguments of function
function callfunc {
    ($1 $2 $3 $4 $5 $6 $7 $8 $9) >> $__LOG_FILE 2>&1
}

# Show a question dialog.
#   $1 = Message
#   $2 = Box height
#   $3 = Box width
function show_question_dialog {
    whiptail --title "$__TITLE" --yesno "$1" $2 $3 && __REQUESTED_ANSWER=true || __REQUESTED_ANSWER=false
}

# Show a message dialog.
#   $1 = Message
#   $2 = Box height
#   $3 = Box width
function show_message_dialog {
    whiptail --title "$__TITLE" --msgbox "$1" $2 $3
}

# Show a input text dialog.
#   $1 = Message
#   $2 = Box height
#   $3 = Box width
function show_input_text_dialog {
    __REQUESTED_TEXT=$(whiptail --title "$__TITLE" --inputbox "$1" $2 $3 3>&1 1>&2 2>&3)
}

# Show a input password dialog.
#   $1 = Message
#   $2 = Box height
#   $3 = Box width
function show_input_password_dialog {
    __REQUESTED_PASSWORD=$(whiptail --title "$__TITLE" --passwordbox "$1" $2 $3 3>&1 1>&2 2>&3)
}

# --------------------- Custom Functions Calling ---------------------- #

function prepare_install {
    show_question_dialog "This is an example of a Whiptail-based installation script.\n\nDo you want to continue?" 9 70

    if (! $__REQUESTED_ANSWER) then
        exit 0;
    fi

    show_input_text_dialog "Username (Use: $USER_EXAMPLE): " 7 70

    show_input_password_dialog "Password (Use: $PASSWORD_EXAMPLE): " 7 70

    if [[ $__REQUESTED_TEXT = $USER_EXAMPLE && $__REQUESTED_PASSWORD = $PASSWORD_EXAMPLE ]]; then
        show_message_dialog "Logged sucessfuly!" 7 50
    else
        show_message_dialog "Login failed!" 7 50
        exit 1;
    fi
}

function install {
    callfunc your_custom_callback_1 1 2 3
    update_progress 25
    sleep 2

    callfunc your_custom_callback_2 4 5 6
    update_progress 50
    sleep 2

    callfunc your_custom_callback_3 7 8 9
    update_progress 75
    sleep 2

    callfunc your_custom_callback_1
    update_progress 100;
    sleep 2
}

function finish_install {
    show_message_dialog "Installation Complete!" 7 50
}

# ------------------------------ Running ------------------------------ #

# Before installation
prepare_install

# Running installation
install | whiptail --title "$__TITLE" --gauge "$__MESSAGE" 7 70 0

# After installation
finish_install
