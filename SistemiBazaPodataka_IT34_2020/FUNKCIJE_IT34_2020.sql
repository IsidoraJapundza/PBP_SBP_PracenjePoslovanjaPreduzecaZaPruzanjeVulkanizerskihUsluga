							------------------------------ IT 34/2020 ------------------------------
/*
	FUNCTION - script za kreiranje funkcija
*/

USE it34g2020

/*					I FUNKCIJA -> FN
Kreirana je funkcija FunkcijaZahtev koja za prosleđeni parametar @klijentID tipa numeric(8) vraća ukupan broj zahteva koje je taj klijent podneo.
*/
IF OBJECT_ID('Projekat_IT34_2020.FunkcijaZahtev', 'FN') IS NOT NULL
	DROP FUNCTION Projekat_IT34_2020.FunkcijaZahtev;
GO
CREATE FUNCTION Projekat_IT34_2020.FunkcijaZahtev (
	@klijentID numeric(8)
) 
RETURNS INT
AS
	BEGIN
		DECLARE @brojZahteva int;

		SELECT @brojZahteva = count(distinct Zahtev.ID_zahteva)
			FROM Projekat_IT34_2020.Klijent LEFT JOIN Projekat_IT34_2020.Zahtev on (Klijent.ID_klijenta = Zahtev.ID_klijenta)
		WHERE Klijent.ID_klijenta = @klijentID;

		RETURN @brojZahteva;
	END;
GO
-- TEST I FUNCTION 
SELECT distinct(Klijent.ID_klijenta) as 'Rbr klijenta', Mejl, Broj_telefona as 'Broj telefona', 
Projekat_IT34_2020.FunkcijaZahtev(Zahtev.ID_klijenta) as 'Broj klijentskih zahteva'
	FROM Projekat_IT34_2020.Klijent LEFT JOIN Projekat_IT34_2020.Zahtev on (Klijent.ID_klijenta = Zahtev.ID_klijenta)


/*					 II FUNKCIJA -> IF
Kreirana je funkcija FunkcijaKlijentInfo koja za prosleđeni parametar @klijentID vraća informacije o klijentu kao i njegovom tipu.
*/
IF OBJECT_ID('Projekat_IT34_2020.FunkcijaKlijentInfo', 'IF') IS NOT NULL
	DROP FUNCTION Projekat_IT34_2020.FunkcijaKlijentInfo;
GO
CREATE FUNCTION Projekat_IT34_2020.FunkcijaKlijentInfo (
	@klijentID numeric(8)
)
RETURNS TABLE
AS
RETURN (
	SELECT Klijent.ID_klijenta,
		CASE	
			WHEN Klijent.ID_fizickog_lica IS NOT NULL
				THEN  FizickoLice.Ime_fl + ' ' + FizickoLice.Prezime_fl 
				ELSE PravnoLice.Naziv
			END AS Naziv,
	Broj_telefona, Adresa, Mesto, Postanski_broj, Mejl,
		CASE
			WHEN Klijent.PIB IS NOT NULL THEN 'Pravno lice'
			ELSE 'Fizicko lice'
		END AS 'Tip klijenta'
	FROM Projekat_IT34_2020.Klijent LEFT JOIN Projekat_IT34_2020.FizickoLice on (Klijent.ID_fizickog_lica = FizickoLice.ID_fizickog_lica)
									 LEFT JOIN Projekat_IT34_2020.PravnoLice on (Klijent.PIB = PravnoLice.PIB)
	WHERE
		Klijent.ID_klijenta = @klijentID
);
GO
-- TEST II FUNCTION 
select * from Projekat_IT34_2020.FunkcijaKlijentInfo(2); 
