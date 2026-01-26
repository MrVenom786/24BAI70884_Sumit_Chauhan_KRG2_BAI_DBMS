create table BOOKS (
	ID INT PRIMARY KEY,
	NAME VARCHAR(20) NOT NULL,
	AUTHOR_NAME VARCHAR(20) NOT NULL
);

insert into BOOKS 
values(1, 'Aditya', 'Ansh');

alter table BOOKS
add count INT check(count>=1);

select * from BOOKS;

update BOOKS
set COUNT=3
where ID=1;

create table LIBRARY_VISITOR_USER (
	USER_ID INT PRIMARY KEY,
	USER_NAME VARCHAR(20),
	AGE INT CHECK(AGE>=17) NOT NULL,
	EMAIL VARCHAR(20) UNIQUE NOT NULL
);

insert into LIBRARY_VISITOR_USER 
values(101, 'Sumit Chauhan', 17, 'a@gmail.com');

alter table LIBRARY_VISITOR_USER
drop column EMAIL;

alter table LIBRARY_VISITOR_USER
add column EMAIL VARCHAR(30) UNIQUE;

update LIBRARY_VISITOR_USER
set EMAIL='a@gmail.com';

select * from LIBRARY_VISITOR_USER;

create table BOOK_ISSUE (
	BOOK_ISSUE_ID INT PRIMARY KEY,
	BOOK_ID INT REFERENCES BOOKS(ID) NOT NULL,
	USER_ID INT REFERENCES LIBRARY_VISITOR_USER(USER_ID) NOT NULL,
	BOOK_ISSUE DATE NOT NULL
);

insert into BOOK_ISSUE
values(5552, 1, 101, '2026-01-09');

select * from BOOK_ISSUE;

create role LIBRARIAN_1
with LOGIN PASSWORD 'password123';

grant select, insert, delete, update on BOOKS to LIBRARIAN_1;
grant select, insert, delete, update on BOOKS_ISSUE to LIBRARIAN_1;
grant select, insert, delete, update on LIBRARY_VISITOR_USER to LIBRARIAN_1;

revoke select, insert, delete, update on BOOKS from LIBRARIAN_1;