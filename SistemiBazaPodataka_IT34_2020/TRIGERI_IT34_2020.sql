							------------------------------ IT 34/2020 ------------------------------
/*
	Script za kreiranje TRIGERA
*/

USE it34g2020

/*					I TRIGER
Omogućiti da se prilikom unosa novog statusa zahteva za određeni zahtev datum prestanka važenja
prethodnog bude postavljen na datum kada je dodeljen novi i da se aktuelnog starog stavi na 0,
a aktuelnost novog na 1.
*/
IF OBJECT_ID('Projekat_IT34_2020.TrigerStatusZahteva', 'TR') IS NOT NULL
	DROP TRIGGER Projekat_IT34_2020.TrigerStatusZahteva;
GO
CREATE TRIGGER Projekat_IT34_2020.TrigerStatusZahteva ON Projekat_IT34_2020.SeDodeljuje INSTEAD OF INSERT
AS
BEGIN
	-- Ažuriraj postojeći red, postavi datum_prestanka_vazenja na datum_dodele_veterinarskog_broja
	UPDATE Projekat_IT34_2020.SeDodeljuje
	SET Datum_do = (SELECT Datum_od FROM inserted), Aktivnost_statusa = 0
	WHERE Aktivnost_statusa = 1 AND ID_statusa_zahteva = (SELECT ID_statusa_zahteva FROM inserted)

	INSERT INTO Projekat_IT34_2020.SeDodeljuje (ID_statusa_zahteva, ID_zahteva, Datum_od, Datum_do, Aktivnost_statusa)
	SELECT ID_statusa_zahteva, ID_zahteva, Datum_od, NULL, 1
		FROM inserted;
END;
GO

select * from Projekat_IT34_2020.SeDodeljuje

-- Provera trigera
INSERT INTO Projekat_IT34_2020.SeDodeljuje(ID_statusa_zahteva, ID_zahteva, Datum_od, Datum_do, Aktivnost_statusa)
VALUES (1, 3, '2023-06-01', null, 1);
INSERT INTO Projekat_IT34_2020.SeDodeljuje(ID_statusa_zahteva, ID_zahteva, Datum_od, Datum_do, Aktivnost_statusa)
VALUES (3, 5, '2021-03-03', null, 1);

select* from Projekat_IT34_2020.SeDodeljuje
select* from Projekat_IT34_2020.StatusZahteva
select* from Projekat_IT34_2020.Zahtev
select* from Projekat_IT34_2020.SeDodeljuje

/*					II TRIGGER
2. Napisati triger koji implementira poslovno pravilo: ako se unese akcije cena se smanjuje za 10%.*/
IF OBJECT_ID('Projekat_IT34_2020.TrigerVrstaUsluge', 'tr') is not null
	DROP TRIGGER Projekat_IT34_2020.TrigerVrstaUsluge
GO
CREATE TRIGGER Projekat_IT34_2020.TrigerVrstaUsluge ON Projekat_IT34_2020.VrstaUsluge AFTER INSERT
AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN;
	SET NOCOUNT ON
	
	DECLARE @trenutnaCena as int
	DECLARE	@novaCena as int
	DECLARE	@id as int

	SET @id = (SELECT ID_vrste_usluge FROM inserted);
	SET @trenutnaCena = (SELECT Cena FROM Projekat_IT34_2020.VrstaUsluge WHERE ID_vrste_usluge = @id)
	SET @novaCena = @trenutnaCena * 0.9

	PRINT 'Stara cena = ' + cast(@trenutnaCena as varchar) + ' RSD.'
	PRINT 'Nova cena = ' + cast(@novaCena as varchar) + ' RSD.'

	UPDATE VrstaUsluge
	SET Cena = @novaCena
	WHERE ID_vrste_usluge = (SELECT ID_vrste_usluge FROM inserted)

END;
GO
-- Provera trigera
SELECT * FROM Projekat_IT34_2020.VrstaUsluge
INSERT INTO Projekat_IT34_2020.VrstaUsluge(ID_vrste_usluge, Naziv_vrste_usluge, Cena, Valuta)
	VALUES (6, 'Provera trigera', 565, 'RSD')
SELECT * FROM Projekat_IT34_2020.VrstaUsluge
