SELECT BK.title, A.authorFirst, A.authorLast
FROM Copy AS C, Branch AS BR, Book AS BK, Author AS A, Wrote AS W
WHERE C.branchNum = BR.branchNum AND C.bookCode = BK.bookCode
      AND BK.bookCode = W.bookCode AND W.authorNum = A.authorNum
      AND BR.branchName = 'Henry on the Hill' AND C.quality = 'Excellent'
ORDER BY BK.title;