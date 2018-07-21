SELECT B.title
FROM Author AS A, Book AS B, Wrote AS W
WHERE A.authorNum = W.authorNum AND B.bookCode = W.bookCode
      AND A.authorLast = 'Steinbeck' AND A.authorFirst = 'John'
      AND B.type = 'FIC';