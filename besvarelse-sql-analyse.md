# Besvarelse: SQL-Analyse

## Oppgave 1: Grunnleggende Spørringer
1.  `SELECT * FROM Vare;`
2.  `SELECT VNr, Betegnelse FROM Vare;`
3.  `SELECT DISTINCT KatNr FROM Vare;`
4.  `SELECT Fornavn, Etternavn, Stilling AS Jobbtittel FROM Ansatt;`

1.  **Forklaring:** ...
Velge alle data fra tabellen Vare.

2.  **Forklaring:** ...
Velge data med kolonnene varenummer og betegnelse fra tabellen Vare.

3.  **Forklaring:** ...
Velge data uten duplikater fra kolonnen kategorinr fra tabellen Vare.

4.  **Forklaring:** ...
Velge data fra kolonnene fornavn, etternavn og jobbtittel (istedenfor stilling) fra tabellen Ansatt.


## Oppgave 2: WHERE-klausulen
1.  `SELECT * FROM Vare WHERE Pris > 500;`
2.  `SELECT * FROM Ansatt WHERE Stilling = 'Salgssjef' AND Årslønn > 600000;`
3.  `SELECT Fornavn, Etternavn FROM Kunde WHERE PostNr = '0001' OR PostNr = '0002';`
4.  `SELECT Betegnelse FROM Vare WHERE NOT KatNr = 1;

1.  **Forklaring:** ...
Velge alle data fra tabell Vare hvor pris er over 500.

2.  **Forklaring:** ...
Velge alle data fra tabell Ansatt hvor stilling er salgssjef med årslønn over 600000.

3.  **Forklaring:** ...
Velge fornavn, etternavn i tabell Kunde hvor postnr er 0001 eller 0002.

4.  **Forklaring:** ...
Velge betegnelse fra tabell Vare hvor kategorinr ikke er 1.

## Oppgave 3: Gruppering og Sortering
1.  `SELECT * FROM Vare ORDER BY Pris DESC;`
2.  `SELECT KatNr, COUNT(*) FROM Vare GROUP BY KatNr;`
3.  `SELECT Stilling, AVG(Årslønn) FROM Ansatt GROUP BY Stilling;`
4.  `SELECT KatNr, SUM(Antall) FROM Vare GROUP BY KatNr HAVING SUM(Antall) > 500;`

1.  **Forklaring:** ...
Velge alle data fra tabell varer og sorterer dem synkende etter pris.

2.  **Forklaring:** ...
Velge varene etter kategorinr og teller hvor mange varer som finnes i hvert rad i tabell vare.

3.  **Forklaring:** ...
Velge ansatte etter stilling og finner gjennomsnttlig årslønn fra tabell ansatt.

4.  **Forklaring:** ...
Velge varene etter kategorinr, summerer antall varer i hvert rad og viser kun summen som er større enn 500.  

## Oppgave 4: Spørringer mot Flere Tabeller
1.  `SELECT V.Betegnelse, K.Navn FROM Vare V JOIN Kategori K ON V.KatNr = K.KatNr;`
2.  `SELECT O.OrdreNr, K.Fornavn, K.Etternavn FROM Ordre O LEFT JOIN Kunde K ON O.KNr = K.KNr;`
3.  `SELECT A1.Fornavn, A2.Fornavn FROM Ansatt A1, Ansatt A2 WHERE A1.PostNr = A2.PostNr AND A1.AnsNr < A2.AnsNr;`
4.  `SELECT V.Betegnelse FROM Vare V WHERE V.VNr NOT IN (SELECT VNr FROM Ordrelinje);`

1.  **Forklaring:** ...
Velge varer sammen med navnet på kategori som kobles til kategorinr.

2.  **Forklaring:** ...
Velge alle ordre sammen med navnet til kundene, selvom kundens navn mangler. 

3.  **Forklaring:** ...
Velge to ansatte som bor i samme postnummer, men tar ikke med duplikater. 

4.  **Forklaring:** ...
Velge varer som ikke har blitt bestilt ved å sjekke om varenr ikke finnes i ordrelinje.

## Oppgave 5: NULL-verdier og Aggregeringsfunksjoner

Forklar hva følgende SQL-spørringer gjør, og hvorfor resultatene blir som de blir. Vær spesielt oppmerksom på hvordan `NULL` påvirker resultatet.

1.  **Spørring:**
    ```sql
    SELECT COUNT(*), COUNT(Bonus) FROM Ansatt;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*
Velge alle rader i tabell ansatt, og teller rader der bonus både er NULL og ikke.

2.  **Spørring:**
    ```sql
    SELECT AVG(Bonus) FROM Ansatt;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*
Velger å beregne gjennomsnitt av bonus i tabell ansatt som kun har bonus-verdi, dvs. NULL-verdier tas ikke med.

3.  **Spørring:**
    ```sql
    SELECT Fornavn, Etternavn, COALESCE(Bonus, 0) AS JustertBonus FROM Ansatt;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*
Viser navn i tabell ansatt med bonus hvor man erstatter NULL med verdi 0 som gjør at alle får tallverdi, selv om bonus mangler.

4.  **Spørring:**
    ```sql
    SELECT Stilling, SUM(Årslønn + Bonus) FROM Ansatt GROUP BY Stilling;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*
Velger å gruppere alle ansatte etter stilling, og summerer årslønn og bonus. Hvis bonus er NULL, blir resultatet NULL, ellers 
blir NULL-verdier ignorert.

## Oppgave 6: Tre-verdi Logikk (TRUE, FALSE, UNKNOWN)

SQLs logikk er ikke bare `TRUE` eller `FALSE`. Når `NULL` er involvert, får vi en tredje tilstand: `UNKNOWN`. Denne oppgaven utforsker hvordan dette påvirker `WHERE`-klausuler.

### Del 1: Forklar SQL-spørringene

Forklar resultatet av følgende SQL-spørringer. Hvorfor returnerer de det de gjør?

1.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = TRUE;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*
Velger å telle alle ordrer der ErBetalt er sann. NULL blir ignorert.

2.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = FALSE;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*
Velger å telle alle ordrer der ErBetalt er usann. NULL-verdier blir også ignorert.

3.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = TRUE OR ErBetalt = FALSE;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*
Velger å telle alle ordrer med verdi, og ikke NULL der ErBetalt er enten sann eller usann.

4.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt IS UNKNOWN;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*
Velger å telle alle ordrer der ErBetalt er NULL, altså om det er hverken sann eller usann.