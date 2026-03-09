--Oppgave 1 del 2
--1.Finn alle data om alle kunder. Vis kun de 20 siste fra resultatrelasjonen (tips: bruke delspørring).
SELECT * FROM KUNDE ORDER BY Kundenr DESC LIMIT 20;

--2.Finn fornavn og etternavn til alle ansatte. Vis kun de 10 første radene fra resultatrelasjonen.
SELECT Fornavn, Etternavn FROM Ansatt LIMIT 10;

--3.Finn alle unike stillinger som finnes i `Ansatt`-tabellen.
SELECT DISTINCT Stilling FROM ANSATT;

--4.Finn varenummer, betegnelse og pris for alle varer.
SELECT Vnr, betegnelse, pris FROM Vare;

--5.Finn navn og kategori-nummer for alle kategorier, men døp om kolonnene til `Kategorinavn` og `KategoriID`.
SELECT Katnr as KategoriID, Navn as Kategori.navn FROM Kategori;

--6.Finn ut hvor mange rader vil en kryssprodukt mellom kunder og ordrer ha.
SELECT COUNT(*) FROM Kunde, Ordre;

--Oppgave 2 del 2
--1.Finn alle varer som koster mellom 200 og 500 (inkludert).
SELECT * FROM Vare WHERE Pris BETWEEN 200 AND 500;

--2.Finn alle ansatte som er 'Lagermedarbeider' eller 'Innkjøper'.
SELECT * FROM Ansatt WHERE Stilling = 'Lagermedarbeider' OR Stilling = 'Innkjøper';

--3.Finn alle kunder som bor i postnummer '3199' eller '1711' og hvis fornavn starter med 'A'.
SELECT * FROM Kunde WHERE Fornavn LIKE 'A%' AND (Postnr = '3199' OR Postnr = '1711');

--4.Finn alle varer som ikke er i kategori 1 og som har mer enn 600 på lager.
SELECT * FROM vare WHERE KatNr != '1' AND Antall >= 599;

--5.Finn alle ordrer som ble sendt, men ikke betalt.
SELECT * FROM Ordre WHERE SendtDato is NOT NULL AND BetaltDato IS NULL;

--6.Finn alle ansatte hvis etternavn inneholder 'sen' (ikke case-sensitivt).
SELECT * FROM Ansatt WHERE Etternavn ILIKE '%sen%';

--Oppgave 3 del 2
--1.Finn antall kunder per postnummer.
SELECT PostNr, COUNT(*) AS antall_kunder FROM Kunde GROUP BY PostNr ORDER BY antall_kunder DESC;

--2.Finn gjennomsnittlig pris for hver kategori.
SELECT KatNr, AVG(pris) AS gjennomsnittspris FROM vare GROUP BY KatNr;

--3.Finn den dyreste varen i hver kategori.
SELECT Katnr, MAX(Pris) AS dyrestepris From vare GROUP BY KatNr;

--4.List opp alle stillinger og antall ansatte i hver stilling, sortert synkende etter antall.
SELECT Stilling, COUNT(ansatt) AS antall_ansatte FROM Ansatt GROUP BY Stilling ORDER BY antall_ansatte DESC;

--5.Finn totalt antall varer på lager for hver kategori, men vis kun kategorier med mer enn 1000 varer totalt.
SELECT KatNr, SUM(antall) AS totalt_varer FROM Vare GROUP BY KatNr HAVING SUM(antall) > 1000 ORDER BY totalt_varer DESC;

--6.Finn den eldste og yngste ansatte.
SELECT * FROM Ansatt ORDER BY fødselsdato ASC LIMIT 1;
SELECT * FROM Ansatt ORDER BY fødselsdato DESC LIMIT 1;

--Oppgave 4 del 2
--1.Finn navn på alle kunder og poststedet de bor i. Vis kun de første 20 rader fra resultatrelasjon.
SELECT K.Fornavn, K.Etternavn, P.Poststed FROM Kunde K JOIN Poststed P ON K.PostNr = P.PostNr LIMIT 20;

--2.Finn navn på alle varer og navnet på kategorien de tilhører. Vis kun de første 20 rader fra resultatrelasjon.
SELECT V.Betegnelse, K.Navn AS Kategori FROM Vare V JOIN Kategori K ON V.KatNr = K.KatNr LIMIT 20;

--3.Finn alle ordrer med kundenavn og ordredato. Vis kun de første 20 rader fra resultatrelasjon.
SELECT O.OrdreNr, O.OrdreDato, K.Fornavn, K.Etternavn FROM Ordre O JOIN Kunde K ON O.KNr = K.KNr LIMIT 20;

--4.Finn alle varer som aldri har blitt solgt (dvs. ikke finnes i `Ordrelinje`).
SELECT V.Betegnelse FROM Vare V WHERE V.VNr NOT IN (SELECT VNr FROM Ordrelinje);

--5.Finn totalt antall solgte enheter for hver vare (bruk `Ordrelinje`).
SELECT V.Betegnelse, SUM(O.Antall) AS TotaltSolgt FROM Vare V JOIN Ordrelinje O ON V.VNr = O.VNr GROUP BY V.Betegnelse;

--6.Finn navnet på alle ansatte som bor i Bø i Telemark.
SELECT A.Fornavn, A.Etternavn FROM Ansatt A JOIN Poststed P ON A.PostNr = P.PostNr WHERE P.Poststed = 'BØ I TELEMARK';
