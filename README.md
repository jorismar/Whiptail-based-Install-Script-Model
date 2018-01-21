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
4. To update the progress bar percentage, call the **update_progress** function anywhere in code, except within your custom functions and **never invoke dialog functions within the install or custom functions.** The following example update progress bar to 45%.
```
update_progress 45
```

5. Implement the **finish_install** function to display any desired end user information or to request some additional information.

If you need to change installation order on add a new functionality, edit the code on end of file at your own risk. =P
