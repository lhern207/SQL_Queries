--Lester Hernandez Alfonso
--ID# 4017986
--Assignment-4    Problem 1   COP-4710
--Affirmation of Originality:  I affirm that this program is entirely my own work and none of it is the work of any other person.


CREATE OR REPLACE FUNCTION uspGetPubStatsLH (pubcode publisher.publishercode%TYPE)
RETURNS text AS $$

DECLARE
	eachrecord       text;                --Variable holds one record at a time
	booktitle	 book.title%TYPE;
	bcode 		 book.bookcode%TYPE;
	notapplies 	 text := 'N/A';       --Displays N/A when not applicable      
	maxonhand 	 text;
	totalonhand 	 text;
BEGIN
	--The name of the publisher
	SELECT publishername INTO eachrecord
	FROM PUBLISHER
	WHERE publishercode = pubcode;
	
	IF (eachrecord IS null)
	THEN
		RAISE NOTICE 'No publisher exists for the given code(%)',pcode;
		RETURN(-1);
	END IF;
	
	--The number of distinct authors who have written book(s)for this publisher.
	SELECT eachrecord || '  NoumberOfAuthors: ' || COUNT(DISTINCT authornum) INTO eachrecord
	FROM BOOK AS B, WROTE AS W
	WHERE publishercode = pubcode AND B.bookcode = W.bookcode;

	--The number of different books published by this publisher.
	SELECT eachrecord || '  NumberOfBooks: ' || COUNT(*) INTO eachrecord
	FROM BOOK
	WHERE publishercode = pubcode;

	--The title of the book published by this publisher,that has the highest number of onHand values collectively in all branches of Henry Books.
	CREATE TABLE book_onhand AS
	SELECT bookcode, SUM(onhand) AS sum_onhand
	FROM INVENTORY I,BRANCH B
	WHERE I.branchnum = B.branchnum
	GROUP BY bookcode;

	
	CREATE TABLE pubbook_onhand AS
	SELECT bookcode, sum_onhand
	FROM book_onhand
	WHERE bookcode IN  (SELECT bookcode
			    FROM BOOK
			    WHERE publishercode = pubcode)
	GROUP BY bookcode, sum_onhand;

	
	SELECT bookcode INTO bcode
	FROM pubbook_onhand
	WHERE sum_onhand = (SELECT MAX(sum_onhand)
		            FROM pubbook_onhand);

				
	SELECT title INTO booktitle
	FROM BOOK
	WHERE bookcode = bcode;

	--The number of onHand values for the above book.
	SELECT sum_onhand INTO maxonhand
	FROM pubbook_onhand
	WHERE bookcode IN (SELECT bookcode
			   FROM BOOK
			   WHERE title = booktitle);


	--The cumulative sum of onHand values from all branches for all books published by this publisher.
	SELECT sum_onhand INTO totalonhand
	FROM book_onhand bh,BOOK B
	WHERE publishercode = pubcode AND bh.bookcode = B.bookcode;
	
	IF (booktitle IS NULL)
	THEN 
		SELECT notapplies INTO booktitle;
		SELECT notapplies INTO maxonhand;
		SELECT notapplies INTO totalonhand;
	END IF;

	
	SELECT eachrecord || '   onHandBook: ' || booktitle INTO eachrecord || '   onHandValue: ' || maxonhand || '   totalBooksOnHand: ' || totalonhand;


	DROP TABLE book_onhand;
	DROP TABLE pubbook_onhand;
	
RETURN eachrecord;
END;
$$ language plpgsql;


--Various statistics for all publishers in the database
CREATE OR REPLACE FUNCTION uspGetAllPubStatsLH()
RETURNS SETOF text as $$

DECLARE
	pubcode publisher%rowtype;
	pubstat text;

BEGIN
	FOR pubcode IN SELECT* FROM PUBLISHER
	LOOP
		SELECT 'PublisherName: ' || uspGetPubStatsLH (pubcode.publishercode)
INTO pubstat;
		RETURN NEXT pubstat;
	END LOOP;
RETURN;
END;

$$ language plpgsql;

SELECT uspGetAllPubStatsLH();
	
