The SQL statements comprising the DDL for Henry Books Database are given to you in two files. 
For that database, answer the following queries. Create the files Q1 to Q10 in PostgreSQL. 
Do follow the restrictions stated for individual queries.

1. List the title of each book published by Penguin USA. 
   You are allowed to use only 1 table in any FROM clause.

2. List the title of each book that has the type PSY or whose publisher code is JP. 
   You are allowed to use only one condition term in any WHERE clause; i.e., 
   don't use AND/OR boolean operations.

3. List the title of each book that has the type CMP, HIS, or SCI. 
   You are allowed to use only one condition term in any WHERE clause.

4. List the title of each book written by John Steinbeck and that has the type FIC.

5. For each book, list the title (sorted alphabetically), publisher code, 
   type and author names (in the order listed on the cover).

6. How many book copies have a price that is greater than $20 and less than $25?

7. For each publisher, list the publisher name and the number of books published by it, 
   only if the publisher publishes at least 2 books.

8. For each book copy available at the Henry on the Hill branch whose quality is Excellent, 
   list the book's title (sorted alphabetically) and author names (in the order listed on the cover).

9. Create a new table named FictionCopies using the data in the bookCode, title, branchNum, copyNum, 
   quality, and price columns for those books that have the type FIC. You should do this in two steps: 
   9A) Create the table, and 9B) populate it with the said data.

10. Ray Henry is considering increasing the price of all copies of fiction books whose quality is 
    Excellent by 10%. To determine the new prices, list the bookCode, title, and increased price of 
    every book in Excellent condition in the FictionCopies table. You are not allowed to modify the 
    prices in the table, just show them.
