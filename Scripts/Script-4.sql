SELECT * FROM RENT;

SELECT M.*, B.*, R.*, (CASE WHEN R.RENT_DATE+3 < R.RETURN_DATE THEN 'Y' WHEN R.RENT_DATE+3 >= R.RETURN_DATE THEN 'N' ELSE '반납하지 않음' END) AS is_Delay FROM MEMBER M, BOOK B, RENT R WHERE M.MEMBER_NO = R.MEMBER_NO AND B.BOOK_NO = R.BOOK_NO