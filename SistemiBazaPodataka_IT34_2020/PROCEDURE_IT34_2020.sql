							------------------------------ IT 34/2020 ------------------------------
/*
	PROCEDURE - script za kreiranje procedura
*/

USE it34g2020

/*					I PROCEDURA
Procedura koja za prosleđen datum podnošenja zahteva (Datum_podnosenja) ispisuje podatke o klijentima, konkretno o fizičkim licima, koji su podneli 
zahtev i to u formi:
	Datuma:  <Datum_podnosenja> postoje sledeći zahtevi:
	Rbr: <rbr>, ID klijenta: <ID_klijenta>, ime i prezime: <Ime_fl> <Prezime_fl>, čiji je broj telefona: <Broj_telefona>, iz <Mesto> podnosi zahtev sa 
	brojem: <ID_zahteva>.
	Ukupno zahteva: <ukupnoZahteva>
U slučaju da prosleđen datum ne postoji ispisuje odgovarajuću poruku:
	Ne postoji prosleđen datum!
*/
IF OBJECT_ID('Projekat_IT34_2020.ProceduraZahtev', 'P') IS NOT NULL
	DROP PROC Projekat_IT34_2020.ProceduraZahtev;
GO
CREATE PROC Projekat_IT34_2020.ProceduraZahtev(
	@datum as date
) 
AS
BEGIN
	DECLARE 
		@idKlijenta as int,
		@imePrezime as varchar(20),
		@brojTelefona as varchar(12),
		@mesto as varchar(20),
		@brojZahteva as int,
		@ukupnoZahteva as int,
		@rbr as int;

	SET @ukupnoZahteva = (SELECT count(*) FROM Projekat_IT34_2020.Zahtev WHERE Datum_podnosenja = @datum)

	IF @datum NOT IN (SELECT Datum_podnosenja FROM Projekat_IT34_2020.Zahtev)
		BEGIN
			PRINT 'Ne postoji prosleđen datum!'
		END
	ELSE
		BEGIN
			PRINT 'Datuma: ' + cast(@datum as varchar(12)) + ' postoje sledeći zahtevi: '
					
			DECLARE zahtev_cursor CURSOR FOR
				SELECT Klijent.ID_klijenta, Ime_fl + ' ' + Prezime_fl as 'Ime i prezime', Broj_telefona as 'Broj telefona', Mesto, Zahtev.ID_zahteva
					FROM Projekat_IT34_2020.Klijent JOIN Projekat_IT34_2020.FizickoLice on (Klijent.ID_fizickog_lica = FizickoLice.ID_fizickog_lica)
													 JOIN Projekat_IT34_2020.Zahtev on (Klijent.ID_klijenta = Zahtev.ID_klijenta)
				WHERE Datum_podnosenja = @datum;
			OPEN zahtev_cursor
				SET @rbr = 1;
			FETCH NEXT FROM zahtev_cursor INTO @idKlijenta, @imePrezime, @brojTelefona, @mesto, @brojZahteva
			WHILE @@FETCH_STATUS = 0
				BEGIN
					PRINT 'Rbr: ' + cast(@rbr as varchar(2)) + ', ID klijenta: ' + cast(@idKlijenta as varchar(2)) + ', ime i prezime: ' +
					@imePrezime + ' čiji je broj telefona: ' + @brojTelefona + ' iz ' + @mesto + ' podnosi zahtev sa brojem: ' + 
					cast(@brojZahteva as varchar(3)) + '.';
					FETCH NEXT FROM zahtev_cursor INTO @idKlijenta, @imePrezime, @brojTelefona, @mesto, @brojZahteva								
					SET @rbr += 1
				END
			CLOSE zahtev_cursor
			DEALLOCATE zahtev_cursor		

			PRINT 'Ukupno zahteva: ' + cast(@ukupnoZahteva as varchar(2))
			PRINT ' '
		END
END;
GO
-- TEST I PROCEDURE
exec Projekat_IT34_2020.ProceduraZahtev '2023-02-01'  
exec Projekat_IT34_2020.ProceduraZahtev '2025-02-01' 


/*					II PROCEDURA
Kreirana procedura ProceduraStatusAktivnosti izvlači neaktivne zahteve iz tabele zahtev i prikazuje određene detalje kao što su: identifikacioni
broj zahteva, 
datum njegovog podnošenja i status zahteva. Neaktivni zahtevi su oni čiji je datum zavšetka poznat.
Za svaki zahtev ispisuje se sledeće:
	Identifikacioni broj zahteva: <ID_zahteva>
	Datum: <Datum_podnosenja>
	Status zahteva: <Naziv_statusa>
*/
IF OBJECT_ID('Projekat_IT34_2020.ProceduraStatusAktivnosti', 'P') IS NOT NULL
	DROP PROC Projekat_IT34_2020.ProceduraStatusAktivnosti;
GO
CREATE PROCEDURE Projekat_IT34_2020.ProceduraStatusAktivnosti
AS
BEGIN
	DECLARE 
		@zahtevID numeric(8),
		@zahtevDatum date,
		@zahtevStatus varchar(12);
	
	DECLARE status_cursor CURSOR FOR
		SELECT Zahtev.ID_zahteva, Datum_podnosenja, Naziv_statusa
			FROM Projekat_IT34_2020.Zahtev INNER JOIN Projekat_IT34_2020.SeDodeljuje on (Zahtev.ID_zahteva = SeDodeljuje.ID_zahteva)
											INNER JOIN Projekat_IT34_2020.StatusZahteva on (SeDodeljuje.ID_statusa_zahteva = StatusZahteva.ID_statusa_zahteva)
		WHERE SeDodeljuje.Datum_do IS NOT NULL;
	OPEN status_cursor
	FETCH NEXT FROM status_cursor INTO @zahtevID, @zahtevDatum, @zahtevStatus
	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT 'Identifikacioni broj zahteva: ' + cast(@zahtevID as varchar(8))
			PRINT 'Datum: ' + cast(@zahtevDatum as varchar(12))
			PRINT 'Status zahteva: ' + @zahtevStatus
			PRINT ' '
			FETCH NEXT FROM status_cursor INTO @zahtevID, @zahtevDatum, @zahtevStatus
		END
	CLOSE status_cursor
	DEALLOCATE status_cursor
END;
GO

-- TEST II PROCEDURE
exec Projekat_IT34_2020.ProceduraStatusAktivnosti;