/*
** =================================================================
** Script  : create#sorttest.sql
** Kunde   : TVD 
** Project : Kurse
** -----------------------------------------------------------------
** Sorttest-Tabelle Tabellen
** =================================================================
*/

DROP TABLE sorttest      CASCADE CONSTRAINT;

CREATE TABLE sorttest (f1   varchar2(30));

COMMENT ON TABLE sorttest IS 'TVD: TABLE TO DEMONSTRATE CASE/ACCENT INSENSITIVE QUERIES';


insert into sorttest values ('a9');
INSERT INTO sorttest VALUES ('ä8');
INSERT into sorttest VALUES ('b7');
INSERT INTO sorttest values ('à6');
INSERT INTO sorttest values ('â5');
INSERT INTO sorttest values ('á4');
INSERT INTO sorttest values ('ã3');
INSERT INTO sorttest values ('A2');
INSERT INTO sorttest values ('Ä1');

commit;

