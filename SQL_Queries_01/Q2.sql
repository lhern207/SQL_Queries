SELECT title
FROM Book
WHERE type = 'PSY'
UNION
SELECT title
FROM Book
WHERE publisherCode = 'JP';