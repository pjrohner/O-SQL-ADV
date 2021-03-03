/*
** =================================================================
** Script  : create#projekte.sql
** Kunde   : TVD 
** Project : Kurse
** -----------------------------------------------------------------
** Projekt-Tabelle Tabellen
** =================================================================
*/
/*
** =================================================================
** Script  : create#projekte.sql
** Kunde   : TVD 
** Project : Kurse
** -----------------------------------------------------------------
** Projekt-Tabelle Tabellen
** =================================================================
*/

drop table projekte cascade constraints;

CREATE TABLE PROJEKTE (
  PRO_ABK            VARCHAR2(10) NOT NULL,
  PRO_NAME           VARCHAR2(50) NOT NULL,
  PRO_START          DATE         NOT NULL,
  PRO_ENDE           DATE         NOT NULL,
  PRO_BUDGET         NUMBER(10)   NOT NULL)
/

COMMENT ON TABLE PROJEKTE IS 'TVD: TABLE TO DEMONSTRATE TIME-DEPENDENT QUERIES'
/

ALTER SESSION SET NLS_LANGUAGE=AMERICAN;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';

INSERT INTO PROJEKTE VALUES ('P1','Projekt 1','01.07.'||(extract(year from sysdate)-1),'31.12.'||(extract(year from sysdate)-1),12000);
INSERT INTO PROJEKTE VALUES ('P2','Projekt 2','01.01.'||(extract(year from sysdate)+1),'30.06.'||(extract(year from sysdate)+1),12000);
INSERT INTO PROJEKTE VALUES ('P3','Projekt 3','01.07.'||(extract(year from sysdate)-1),'30.06.'||extract(year from sysdate),12000);
INSERT INTO PROJEKTE VALUES ('P4','Projekt 4','01.07.'||extract(year from sysdate),'30.06.'||(extract(year from sysdate)+1),12000);
INSERT INTO PROJEKTE VALUES ('P5','Projekt 5','01.04.'||extract(year from sysdate),'30.09.'||extract(year from sysdate),12000);
INSERT INTO PROJEKTE VALUES ('P6','Projekt 6','01.07.'||(extract(year from sysdate)-1),'30.06.'||(extract(year from sysdate)+1),12000);

commit;