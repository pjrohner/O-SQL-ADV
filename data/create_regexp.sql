/*
** =================================================================
** Script  : create#regexp.sql
** Kunde   : TVD 
** Project : Kurse
** -----------------------------------------------------------------
** Regular Expression-Tabelle Tabellen
** =================================================================
*/

DROP TABLE test_regular_expressions      CASCADE CONSTRAINT;

CREATE TABLE test_regular_expressions (
   CHAR_VALUE       VARCHAR2(2000));


drop table books;
drop table email;


-- =================================================================
PROMPT CREATING TABLE BOOKS
-- =================================================================

CREATE TABLE books (isbn_number    varchar2(30)
                   ,title          varchar2(100)
                   ,publisher      varchar2(30)
                   ,authors        varchar2(100));

COMMENT ON TABLE BOOKS IS 'TVD: TABLE TO DEMONSTRATE REGULAR EXPRESSIONS';

insert into test_regular_expressions VALUES ('MEIER');
insert into test_regular_expressions VALUES ('MEYER');
insert into test_regular_expressions VALUES ('MAIER');
insert into test_regular_expressions VALUES ('MAYER');
insert into test_regular_expressions VALUES ('Meier');
insert into test_regular_expressions VALUES ('Meyer');
insert into test_regular_expressions VALUES ('Maier');
insert into test_regular_expressions VALUES ('Mayer');
insert into test_regular_expressions VALUES ('MEIER-HUBER');
insert into test_regular_expressions VALUES ('MÜLLER');
insert into test_regular_expressions VALUES ('HUBER');


INSERT INTO books values ('1-59059-636-6','Cost-Based ORACLE Fundamentals','Apress','Jonathan Lewis');
INSERT INTO books values ('XF-978-1-59059-917-4','not a isbn','XXX',NULL);
INSERT INTO books values ('978-1-59059-917-4ululu','not a isbn','XXX',NULL);
INSERT INTO books values ('ZZ-978-1-59059-917-4bala','not a isbn','XXX',NULL);
INSERT INTO books values ('978-1-59059-917-4','Troubleshooting ORACLE Performance','Apress','Chris Antognini');
INSERT INTO books values ('978-1-59059-827-X','Pro ORACLE Application Express','Apress','John Scott / Scott Spendolini');
INSERT INTO books values ('978-3-446-41703-8','Business Communication Architecture Blueprint','Hanser','Trivads');
INSERT INTO books values ('978-3-446-41098-5','Praktische Anwendungsentwicklung mit ORACLE Forms','Hanser','Perry Pakull');
INSERT INTO books values ('1-56592-674-9',q'{ORACLE PL/SQL Developer's Workbook}',q'{O'Reilly}','Steven Feuerstein');
INSERT INTO books values ('1-56592-438-X','ORACLE Scripts',q'{O'Reilly}','Brian Lomasky');
INSERT INTO books values ('3-89842-374-3','UML projektorientiert','Galileo Computing','Patrick Grässle');


-- =================================================================
PROMPT CREATING TABLE EMAIL
-- =================================================================

CREATE TABLE EMAIL (
   ADDRESS  VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE EMAIL IS 'TVD: TABLE TO DEMONSTRATE REGULAR EXPRESSIONS';

INSERT INTO EMAIL VALUES ('kurt.muster@firma.com');
INSERT INTO EMAIL VALUES ('kurtmuster(at)firma.ch');
INSERT INTO EMAIL VALUES ('kurt.muster@firma@uk.ch');
INSERT INTO EMAIL VALUES ('kurt-muster@firma');
INSERT INTO EMAIL VALUES ('kurt-muster@firma.uk.com');
INSERT INTO EMAIL VALUES ('kurt-muster@firma.uk.x');
INSERT INTO EMAIL VALUES ('kurt-muster@firma.uk.business');
INSERT INTO EMAIL VALUES ('kurt$muster@firma.uk.business');
INSERT INTO EMAIL VALUES ('@firma.uk.business');

commit;


