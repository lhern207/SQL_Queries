SELECT FC.bookCode, FC.title, FC.price * 1.1 AS increasedPrice
FROM FictionCopies AS FC
WHERE FC.quality = 'Excellent';

