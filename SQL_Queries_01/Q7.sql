SELECT P.publisherName, Count(*) AS publishedBooks
FROM Publisher AS P, Book AS B
WHERE P.publisherCode = B.publisherCode
GROUP BY P.publisherName
HAVING Count(*) >= 2;