# Whiptail-based Install Script Model

This is a installing script model that provide a easy way to implement a basic user interface to bash environment using the whiptail feature.

## Implementation

To implement your custom script using this model, watch out and follow the marked areas.

1. Implement your functions with your commands in the demarcated area _Custom Callback Functions_

2. Implement the **prepare_install** function to prepare your installation by calling the dialog functions to request all the necessary information from the user for your installation.

3. Implement the **install** function to run your installation, use the **callfunc** function to call your custom functions according to the following example:

```
callfunc your_custom_function arg1 arg2 arg3 ... arg8
```

4. To update the progress bar percentage, call the **update_progress** function anywhere in code, except within your custom functions and **never invoke dialog functions within the install or custom functions.** To access the current progress value use the variable **$\_\_PROGRESS\_COUNT**. The following example shown how to update the progress bar to 45%.

```
update_progress 45
```

5. Implement the **finish_install** function to display any desired end user information or to request some additional information.

For more information, check out the sample script on the examples folder. If you need to change the installation order or add a new feature, edit the code at the end of the file at your own risk. =P

## Dialogues Functions

The dialog functions have three arguments, where the first is the message to be displayed, the second is the height of the window box and the third is the width. The following examples shown how to use the dialogues functions.

* Information dialog 
```
show_message_dialog "Message" 7 50
```

* Question dialog (Answer is accessed by the variable **$\_\_REQUESTED\_ANSWER** and the values can be true or false).
```
show_question_dialog "Message" 7 50
```

* Input text dialog (The entered text is accessed by the variable **$\_\_REQUESTED\_TEXT**).
```
show_input_text_dialog "Message" 7 50
```

* Input password dialog (The entered password text is accessed by the variable **$\_\_REQUESTED\_PASSWORD**).
```
show_input_password_dialog "Message" 7 50
```
