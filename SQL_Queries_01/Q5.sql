SELECT		B.title, B.publisherCode, B.type, A.authorFirst, A.authorLast
FROM		Book AS B, Author AS A, Wrote AS W 
WHERE		B.bookCode = W.bookCode AND A.authorNum = W.authorNum
ORDER BY 	B.title;
