/* 도서 */
CREATE TABLE BOOK (
	BOOK_NO CHAR(4) NOT NULL, /* 도서 코드 */
	BOOK_NAME VARCHAR2(20), /* 도서 이름 */
	AUTHOR VARCHAR2(20), /* 저자 */
	PUBLISHER VARCHAR2(20), /* 출판사 */
	PRICE NUMBER(6), /* 가격 */
	is_rent NUMBER(1), /* 대여가능여부 */
	TOTAL_COUNT NUMBER DEFAULT 0 /* 총 대여횟수 */
);

COMMENT ON TABLE BOOK IS '도서';

COMMENT ON COLUMN BOOK.BOOK_NO IS '도서 코드';

COMMENT ON COLUMN BOOK.BOOK_NAME IS '도서 이름';

COMMENT ON COLUMN BOOK.AUTHOR IS '저자';

COMMENT ON COLUMN BOOK.PUBLISHER IS '출판사';

COMMENT ON COLUMN BOOK.PRICE IS '가격';

COMMENT ON COLUMN BOOK.is_rent IS '대여가능여부';

COMMENT ON COLUMN BOOK.TOTAL_COUNT IS '총 대여횟수';

CREATE UNIQUE INDEX BOOK_BOOKNO_PK
	ON BOOK (
		BOOK_NO ASC
	);

CREATE UNIQUE INDEX UIX_BOOK
	ON BOOK (
		BOOK_NAME ASC
	);

ALTER TABLE BOOK
	ADD
		CONSTRAINT BOOK_BOOKNO_PK
		PRIMARY KEY (
			BOOK_NO
		);

ALTER TABLE BOOK
	ADD
		CONSTRAINT BOOK_BOOKNAME_UK
		UNIQUE (
			BOOK_NAME
		);

/* 회원 */
CREATE TABLE MEMBER (
	MEMBER_NO CHAR(4) NOT NULL, /* 회원 코드 */
	MEMBER_NAME VARCHAR2(20), /* 회원 이름 */
	TEL VARCHAR2(13), /* 전화번호 */
	TOTAL_RENT NUMBER DEFAULT 0 /* 총 대여권수 */
);

COMMENT ON TABLE MEMBER IS '회원';

COMMENT ON COLUMN MEMBER.MEMBER_NO IS '회원 코드';

COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원 이름';

COMMENT ON COLUMN MEMBER.TEL IS '전화번호';

COMMENT ON COLUMN MEMBER.TOTAL_RENT IS '총 대여권수';

CREATE UNIQUE INDEX MEMBER_MEMBERNAME_PK
	ON MEMBER (
		MEMBER_NO ASC
	);

CREATE UNIQUE INDEX UIX_MEMBER
	ON MEMBER (
		MEMBER_NAME ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT MEMBER_MEMBERNAME_PK
		PRIMARY KEY (
			MEMBER_NO
		);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT MEMBER_MEMBERNAME_UK
		UNIQUE (
			MEMBER_NAME
		);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT CK_MEMBER
		CHECK (<지정 되지 않음>);

/* 출납 */
CREATE TABLE RENT (
	idx NUMBER NOT NULL, /* 목차 */
	MEMBER_NO CHAR(4) NOT NULL, /* 회원 코드 */
	BOOK_NO CHAR(4) NOT NULL, /* 도서 코드 */
	RENT_DATE DATE, /* 대여일 */
	RETURN_DATE DATE /* 반납일 */
);

COMMENT ON TABLE RENT IS '출납';

COMMENT ON COLUMN RENT.idx IS '목차';

COMMENT ON COLUMN RENT.MEMBER_NO IS '회원 코드';

COMMENT ON COLUMN RENT.BOOK_NO IS '도서 코드';

COMMENT ON COLUMN RENT.RENT_DATE IS '대여일';

COMMENT ON COLUMN RENT.RETURN_DATE IS '반납일';

CREATE UNIQUE INDEX PK_RENT
	ON RENT (
		idx ASC
	);

ALTER TABLE RENT
	ADD
		CONSTRAINT PK_RENT
		PRIMARY KEY (
			idx
		);

ALTER TABLE RENT
	ADD
		CONSTRAINT FK_BOOK_TO_RENT
		FOREIGN KEY (
			BOOK_NO
		)
		REFERENCES BOOK (
			BOOK_NO
		);

ALTER TABLE RENT
	ADD
		CONSTRAINT FK_MEMBER_TO_RENT
		FOREIGN KEY (
			MEMBER_NO
		)
		REFERENCES MEMBER (
			MEMBER_NO
		);
/*-- MEMBERDTO 테이블 삭제
DROP TABLE MEMBER;*/
