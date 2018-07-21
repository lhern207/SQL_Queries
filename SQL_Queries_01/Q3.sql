SELECT title
FROM Book
WHERE type = 'CMP'
UNION
SELECT title
FROM Book
WHERE type = 'HIS'
UNION
SELECT title
FROM Book
WHERE type = 'SCI';