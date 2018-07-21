CREATE TABLE FictionCopies
( bookCode CHAR(4),
title CHAR(40),
branchNum DECIMAL(2,0),
copyNum DECIMAL(2,0),
quality CHAR(20),
price DECIMAL(8,2) );

INSERT INTO FictionCopies
SELECT BK.bookCode, BK.title, BR.branchNum, C.copyNum, C.quality, C.price
FROM Book AS BK, Branch AS BR, Copy AS C
WHERE BK.bookCode = C.bookCode AND C.branchNum = BR.branchNum
      AND BK.type = 'FIC';