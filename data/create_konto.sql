/*
** =================================================================
** Script  : create#konto.sql
** Kunde   : TVD 
** Project : Kurse
** -----------------------------------------------------------------
** Konto-Tabelle Tabellen
** =================================================================
*/

DROP TABLE konto      CASCADE CONSTRAINT;

CREATE TABLE KONTO (
  KUNDE             VARCHAR2(10) NOT NULL,
  SALDO             NUMBER       NOT NULL);

COMMENT ON TABLE KONTO IS 'TVD: TABLE TO SHOW LOCK CONFLICTS';

INSERT INTO KONTO VALUES ('KING',1500);
INSERT INTO KONTO VALUES ('ALLEN',1500);
INSERT INTO KONTO VALUES ('FORD',1500);

