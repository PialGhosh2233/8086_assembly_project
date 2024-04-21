This project involves creating a simple banking system simulation using assembly language (specifically for the x86 architecture). The program is designed to run on DOS and utilizes DOS interrupts, primarily INT 21H, for basic input/output operations.

Key features of this banking system include:

Role Selection: Users can choose between two roles at the start of the program: a general user (customer) or a bank employee.

Authentication: Both users and employees are required to enter an ID and a password. The system checks these credentials against predefined lists to authenticate the individuals.

User Functions: 
Authenticated users have the options to:
Withdraw money, after checking if the account balance is sufficient.
Check their current account balance.
Exit to the main menu to possibly re-login or switch roles.
Employee Functions: Authenticated bank employees can:
Access the account balance of any user by entering the user’s ID.

Error Handling: The system includes basic error handling for incorrect ID or password entries, offering the user or employee options to try again or exit.

Session Management: At various points, users and employees are asked if they want to continue their current session or return to the main menu, enabling repeated operations without restarting the program.
This project illustrates fundamental programming concepts in assembly such as loops, conditionals, subroutines, and basic memory management, while also showcasing how to manage user input and display outputs. It serves as a basic model for understanding how low-level interactions can be handled in software design.
