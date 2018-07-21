/*There query is much simpler if we know 'PE' is the publisher code for Penguin USA.
However, I will assume we don't know that fact about the database. */

SELECT B.title
FROM Book AS B
WHERE B.publisherCode IN (SELECT P.publisherCode
			  FROM Publisher AS P
			  WHERE P.publisherName = 'Penguin USA');