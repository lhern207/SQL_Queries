The purpose of this assignment is to master the design of stored procedures. 
Use the script files HenryPSQL and HenryInventory to create the Henry Book Store database in PostgreSQL. 

Write a user defined stored procedure (uspGetAllPubStatsFML, where F, M, and L refer to your first, 
middle and last name initials) using plpgSQL on the Henry Book Store database. 
Essentially, it outputs various statistics (mentioned below) for all publishers in the database. 
This stored procedure will call another stored procedure named (uspGetPubStatsFML) that accepts a 
publisher code as input and generates the desired statistics only if the given publisher code exists 
(Notify the user if the publisher code does not exist). The information output is:

•   The name of the publisher. 
•   The number of distinct authors who have written book(s) for this publisher. 
•   The number of different books published by this publisher. 
•   The title of the book published by this publisher that has the highest number of onHand values 
    collectively in all branches of Henry Books.
•   The number of onHand values for the above book.
•   The cumulative sum of onHand values from all branches for all books published by this publisher. 
