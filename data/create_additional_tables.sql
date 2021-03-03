SET ECHO OFF
REM ***************************************************************************
REM ***************************** T R I V A D I S *****************************
REM ******************** ORACLE SQL ADVANCED TRAINING  ************************
REM ************************ http://www.trivadis.com **************************
REM ***************************************************************************
REM
REM Privileges..: User
REM File name...: create#additional_tables.sql
REM Description.: Install the additional objects for a training user
REM Notes.......: 
REM Dependencies: tables of the hr schema need to be installed
REM Parameters..: none
REM Requirements: 
REM
REM ***************************************************************************
REM 
REM ===========================================================================
REM removing objects
REM ===========================================================================
DROP TABLE konto                    CASCADE CONSTRAINT;
DROP TABLE projekte                 CASCADE CONSTRAINT;
DROP TABLE test_regular_expressions CASCADE CONSTRAINT;
DROP TABLE books                    CASCADE CONSTRAINT;
DROP TABLE email                    CASCADE CONSTRAINT;
DROP TABLE sorttest                 CASCADE CONSTRAINT;
DROP TABLE department_sektion       CASCADE CONSTRAINT;
DROP TABLE employees_sektion        CASCADE CONSTRAINT;


REM ================================================
PROMPT TABLE PROJEKTE

CREATE TABLE PROJEKTE (
  PRO_ABK            VARCHAR2(10) NOT NULL,
  PRO_NAME           VARCHAR2(50) NOT NULL,
  PRO_START          DATE         NOT NULL,
  PRO_ENDE           DATE         NOT NULL,
  PRO_BUDGET         NUMBER(10)   NOT NULL)
/

COMMENT ON TABLE PROJEKTE IS 'TVD: TABLE TO DEMONSTRATE TIME-DEPENDENT QUERIES'
/

REM ================================================
PROMPT TABLE test_regular_expressions
CREATE TABLE test_regular_expressions (CHAR_VALUE       VARCHAR2(2000));

REM ================================================
PROMPT TABLE EMAIL

CREATE TABLE EMAIL (ADDRESS  VARCHAR2(100) NOT NULL);


REM ================================================
PROMPT TABLE BOOKS
CREATE TABLE books (isbn_number    varchar2(30)
                   ,title          varchar2(100)
                   ,publisher      varchar2(30)
                   ,authors        varchar2(100));

COMMENT ON TABLE BOOKS IS 'TVD: TABLE TO DEMONSTRATE REGULAR EXPRESSIONS';

REM ================================================
PROMPT TABLE KONTO
CREATE TABLE KONTO (
  KUNDE             VARCHAR2(10) NOT NULL,
  SALDO             NUMBER       NOT NULL);

COMMENT ON TABLE KONTO IS 'TVD: TABLE TO SHOW LOCK CONFLICTS';

REM ================================================
PROMPT TABLE sorttest
CREATE TABLE sorttest (f1   varchar2(30));

COMMENT ON TABLE sorttest IS 'TVD: TABLE TO DEMONSTRATE CASE/ACCENT INSENSITIVE QUERIES';

REM ================================================
PROMPT TABLE department_sektion
CREATE TABLE department_sektion 
as 
WITH sektionen AS (SELECT 'A' sektion FROM dual
                   UNION ALL
                   select 'B' sektion from dual
                   UNION ALL 
                   SELECT 'C' sektion FROM dual)
SELECT d.department_id, a.sektion, d.department_name
  FROM departments d
  CROSS JOIN sektionen A
/

REM ================================================
PROMPT TABLE employees_sektion
create table employees_sektion
AS
WITH sektionen AS (SELECT 'A' sektion FROM dual
                   UNION ALL
                   select 'B' sektion from dual
                   UNION ALL 
                   SELECT 'C' sektion FROM dual)
SELECT e.employee_id, e.last_name, e.first_name, e.hire_date, e.salary, e.department_id, a.sektion 
  FROM (SELECT employee_id, last_name, first_name, hire_date, salary, department_id, ntile(3) OVER (ORDER BY hire_date) AS rn FROM employees) e
  INNER JOIN (select sektion, row_number() over (order by sektion) rn from sektionen) A ON (a.rn = e.rn)
/


REM ================================================
REM INSERT DATA FOR TABLE PROJEKTE
REM ================================================
INSERT INTO PROJEKTE (PRO_ABK, PRO_NAME, PRO_START, PRO_ENDE, PRO_BUDGET) VALUES ('P1','Projekt 1',DATE '2014-07-01',DATE '2014-12-31',12000);
INSERT INTO PROJEKTE (PRO_ABK, PRO_NAME, PRO_START, PRO_ENDE, PRO_BUDGET) VALUES ('P2','Projekt 2',DATE '2016-01-01',DATE '2016-06-30',12000);
INSERT INTO PROJEKTE (PRO_ABK, PRO_NAME, PRO_START, PRO_ENDE, PRO_BUDGET) VALUES ('P3','Projekt 3',DATE '2014-07-01',DATE '2015-06-30',12000);
INSERT INTO PROJEKTE (PRO_ABK, PRO_NAME, PRO_START, PRO_ENDE, PRO_BUDGET) VALUES ('P4','Projekt 4',DATE '2015-07-01',DATE '2016-06-30',12000);
INSERT INTO PROJEKTE (PRO_ABK, PRO_NAME, PRO_START, PRO_ENDE, PRO_BUDGET) VALUES ('P5','Projekt 5',DATE '2015-04-01',DATE '2015-09-30',12000);
INSERT INTO PROJEKTE (PRO_ABK, PRO_NAME, PRO_START, PRO_ENDE, PRO_BUDGET) VALUES ('P6','Projekt 6',DATE '2014-07-01',DATE '2016-06-30',12000);

COMMIT;

REM ================================================
REM INSERT DATA FOR TABLE KONTO
REM ================================================
INSERT INTO KONTO VALUES ('KING',1500);
INSERT INTO KONTO VALUES ('ALLEN',1500);
INSERT INTO KONTO VALUES ('FORD',1500);

COMMIT;

REM ================================================
REM INSERT DATA FOR TABLE test_regular_expressions
REM ================================================
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

COMMIT;

REM ================================================
REM INSERT DATA FOR TABLE BOOKS
REM ================================================
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

COMMIT;

REM ================================================
REM INSERT DATA FOR TABLE EMAIL
REM ================================================
INSERT INTO EMAIL VALUES ('kurt.muster@firma.com');
INSERT INTO EMAIL VALUES ('kurtmuster(at)firma.ch');
INSERT INTO EMAIL VALUES ('kurt.muster@firma@uk.ch');
INSERT INTO EMAIL VALUES ('kurt-muster@firma');
INSERT INTO EMAIL VALUES ('kurt-muster@firma.uk.com');
INSERT INTO EMAIL VALUES ('kurt-muster@firma.uk.x');
INSERT INTO EMAIL VALUES ('kurt-muster@firma.uk.business');
INSERT INTO EMAIL VALUES ('kurt$muster@firma.uk.business');
INSERT INTO EMAIL VALUES ('@firma.uk.business');

COMMIT;

REM ================================================
REM INSERT DATA FOR TABLE sorttest
REM ================================================
insert into sorttest values ('a9');
INSERT INTO sorttest VALUES ('ä8');
INSERT into sorttest VALUES ('b7');
INSERT INTO sorttest values ('à6');
INSERT INTO sorttest values ('â5');
INSERT INTO sorttest values ('á4');
INSERT INTO sorttest values ('ã3');
INSERT INTO sorttest values ('A2');
INSERT INTO sorttest values ('Ä1');

COMMIT;

REM END of script