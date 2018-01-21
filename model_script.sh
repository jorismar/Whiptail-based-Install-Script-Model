#! /usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#               Author: Jorismar Barbosa Meira                          #
#               E-Mail: jorismar.barbosa@gmail.com                      #
#               Created: 20 January 2018                                #
#               Modified: 20 January 2018                               #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# ----------------------------- Variables ----------------------------- #

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #
#                         PUT YOUR VARIABLES HERE                       #
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< #

# Configure installation
__TITLE="Title"
__MESSAGE="Installing..."
__LOG_FILE="log.txt"

# Variables to provide access to dialog entries and progress percent value.
__PROGRESS_COUNT=0
__REQUESTED_ANSWER=false
__REQUESTED_TEXT=""
__REQUESTED_PASSWORD=""

# --------------------- Custom Callback Functions --------------------- #


# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #
#                PUT YOUR CUSTOM CALLBACK FUNCTIONS HERE                #
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< #


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

    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #
    #    PUT YOUR DIALOGUES TO BE DISPLAYED BEFORE INSTALLATION HERE.   #
    # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< #

}

function install {

    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #
    #  PUT YOUR CUSTOM FUNCTIONS CALLING AND THE UPDATE PROGRESS HERE.  #
    # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< #

    # ################################################################# #
    #                             WARNING!                              #
    #               DON'T CALL DIALOGUES FUNCTIONS HERE!!!              #
    # ################################################################# #

}

function finish_install {

    # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #
    #     PUT YOUR DIALOGUES TO BE DISPLAYED AFTER INSTALLATION HERE.   #
    # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< #

}

# ------------------------------ Running ------------------------------ #

# Below installation
prepare_install

# Running installation
install | whiptail --title "$__TITLE" --gauge "$__MESSAGE" 7 70 0

# After installation
finish_install
