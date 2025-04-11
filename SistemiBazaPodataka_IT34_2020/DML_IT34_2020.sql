							------------------------------ IT 34/2020 ------------------------------
/*
	DML - script za insert (unos) podataka
*/

USE it34g2020

-------------------- SELECT CHECK --------------------
/*SELECT * FROM Projekat_IT34_2020.PravnoLice
SELECT * FROM Projekat_IT34_2020.FizickoLice
SELECT * FROM Projekat_IT34_2020.Klijent
SELECT * FROM Projekat_IT34_2020.VrstaUsluge
SELECT * FROM Projekat_IT34_2020.Akcija
SELECT * FROM Projekat_IT34_2020.Popust
SELECT * FROM Projekat_IT34_2020.Zahtev
SELECT * FROM Projekat_IT34_2020.StatusZahteva
SELECT * FROM Projekat_IT34_2020.SeDodeljuje
SELECT * FROM Projekat_IT34_2020.VrstaDana
SELECT * FROM Projekat_IT34_2020.Dan
SELECT * FROM Projekat_IT34_2020.Termin*/

-------------------- DELETE FROM TABLE --------------------

/*DELETE FROM Projekat_IT34_2020.PravnoLice
DELETE FROM Projekat_IT34_2020.FizickoLice
DELETE FROM Projekat_IT34_2020.Klijent
DELETE FROM Projekat_IT34_2020.VrstaUsluge
DELETE FROM Projekat_IT34_2020.Akcija
DELETE FROM Projekat_IT34_2020.Popust
DELETE FROM Projekat_IT34_2020.Zahtev
DELETE FROM Projekat_IT34_2020.StatusZahteva
DELETE FROM Projekat_IT34_2020.SeDodeljuje
DELETE FROM Projekat_IT34_2020.VrstaDana
DELETE FROM Projekat_IT34_2020.Dan
DELETE FROM Projekat_IT34_2020.Termin*/

-------------------- INSERT INTO TABLE --------------------

-- Projekat_IT34_2020.PravnoLice --
INSERT INTO Projekat_IT34_2020.PravnoLice (PIB, Naziv, Ime_pl, Prezime_pl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_PravnoLice,
		'Levi9',
		'Luka',
		'Luković'
	)

INSERT INTO Projekat_IT34_2020.PravnoLice (PIB, Naziv, Ime_pl, Prezime_pl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_PravnoLice,
		'Valcon',
		'Vanja',
		'Vekić'
	)

INSERT INTO Projekat_IT34_2020.PravnoLice (PIB, Naziv, Ime_pl, Prezime_pl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_PravnoLice,
		'Heliant',
		'Helena',
		'Has'
	)

INSERT INTO Projekat_IT34_2020.PravnoLice (PIB, Naziv, Ime_pl, Prezime_pl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_PravnoLice,
		'D Express',
		'Danilo',
		'Danilović'
	)

INSERT INTO Projekat_IT34_2020.PravnoLice (PIB, Naziv, Ime_pl, Prezime_pl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_PravnoLice,
		'Aqua',
		'Ana',
		'Aničić'
	)

SELECT * FROM Projekat_IT34_2020.PravnoLice

-- Projekat_IT34_2020.FizickoLice --

INSERT INTO Projekat_IT34_2020.FizickoLice (ID_fizickog_lica, Ime_fl, Prezime_fl, JMBG_fl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_FizickoLice,
		'Aleksa',
		'Aleksić',
		1203995123586
	)

INSERT INTO Projekat_IT34_2020.FizickoLice (ID_fizickog_lica, Ime_fl, Prezime_fl, JMBG_fl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_FizickoLice,
		'Bojan',
		'Bojanić',
		2502978842025
	)

INSERT INTO Projekat_IT34_2020.FizickoLice (ID_fizickog_lica, Ime_fl, Prezime_fl, JMBG_fl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_FizickoLice,
		'Vera',
		'Verić',
		1610001850236
	)

INSERT INTO Projekat_IT34_2020.FizickoLice (ID_fizickog_lica, Ime_fl, Prezime_fl, JMBG_fl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_FizickoLice,
		'Dragana',
		'Dragić',
		06029925812355 -- zasto mora 14?
	)

INSERT INTO Projekat_IT34_2020.FizickoLice (ID_fizickog_lica, Ime_fl, Prezime_fl, JMBG_fl)
	VALUES (
		next value for Projekat_IT34_2020.Seq_FizickoLice,
		'Marko',
		'Marković',
		2612987785256
	)

SELECT * FROM Projekat_IT34_2020.FizickoLice

-- Projekat_IT34_2020.Klijent --

INSERT INTO Projekat_IT34_2020.Klijent (ID_klijenta, Broj_telefona, Adresa, Mesto, Postanski_broj, Mejl, PIB, ID_fizickog_lica)
	VALUES (
		1,
		'0600464776',
		'Adi Endrea 1/4',
		'Temerin',
		21235,
		'markovic@gmail.com',
		null,
		5
	)

INSERT INTO Projekat_IT34_2020.Klijent (ID_klijenta, Broj_telefona, Adresa, Mesto, Postanski_broj, Mejl, PIB, ID_fizickog_lica)
	VALUES (
		2,
		'0607523564',
		'Pavla Papa',
		'Novi Sad',
		21000,
		'lukovic@gmail.com',
		100000001,
		null
	)

INSERT INTO Projekat_IT34_2020.Klijent (ID_klijenta, Broj_telefona, Adresa, Mesto, Postanski_broj, Mejl, PIB, ID_fizickog_lica)
	VALUES (
		3,
		'069452758',
		'Partizanska 29',
		'Bački Jarak',
		21234,
		'bojanic@gmail.com',
		null,
		2
	)

INSERT INTO Projekat_IT34_2020.Klijent (ID_klijenta, Broj_telefona, Adresa, Mesto, Postanski_broj, Mejl, PIB, ID_fizickog_lica)
	VALUES (
		4,
		'068245789',
		'Bulevar Oslobođenja 118',
		'Novi Sad',
		21000,
		'hashelena@heliant.com',
		100000003,
		null
	)

INSERT INTO Projekat_IT34_2020.Klijent (ID_klijenta, Broj_telefona, Adresa, Mesto, Postanski_broj, Mejl, PIB, ID_fizickog_lica)
	VALUES (
		5,
		'025486259',
		'Glavna 159',
		'Ruma',
		22400,
		'aleksic@gmail.com',
		null,
		1
	)

SELECT * FROM Projekat_IT34_2020.Klijent

-- Projekat_IT34_2020.VrstaUsluge --

INSERT INTO Projekat_IT34_2020.VrstaUsluge (ID_vrste_usluge, Naziv_vrste_usluge, Cena, Valuta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_VrstaUsluge,
		'Zamena pneumatika',
		2000,
		'RSD'
	)

INSERT INTO Projekat_IT34_2020.VrstaUsluge (ID_vrste_usluge, Naziv_vrste_usluge, Cena, Valuta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_VrstaUsluge,
		'Provera pritiska',
		1200,
		'RSD'
	)

INSERT INTO Projekat_IT34_2020.VrstaUsluge (ID_vrste_usluge, Naziv_vrste_usluge, Cena, Valuta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_VrstaUsluge,
		'Krpljenje pneumatika',
		1500,
		'RSD'
	)

INSERT INTO Projekat_IT34_2020.VrstaUsluge (ID_vrste_usluge, Naziv_vrste_usluge, Cena, Valuta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_VrstaUsluge,
		'Skladištenje pneumatika',
		500,
		'RSD'
	)

INSERT INTO Projekat_IT34_2020.VrstaUsluge (ID_vrste_usluge, Naziv_vrste_usluge, Cena, Valuta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_VrstaUsluge,
		'Balansiranje pneumatika',
		3500,
		'RSD'
	)

SELECT * FROM Projekat_IT34_2020.VrstaUsluge

-- Projekat_IT34_2020.Akcija --

INSERT INTO Projekat_IT34_2020.Akcija (ID_akcije, Naziv_akcije, Opis, ID_vrste_usluge, Broj_usluga, Datum_Pocetka_Akcije, Datum_Zavrsetka_Akcije)
	VALUES (
		1,
		'Četiri za tri',
		'Za svaki 4. pneumatik gratis krpljenje!',
		3,
		3,
		convert(date, '2023-06-01', 23),
		convert(date, '2023-06-15', 23)
	)

INSERT INTO Projekat_IT34_2020.Akcija (ID_akcije, Naziv_akcije, Opis, ID_vrste_usluge, Broj_usluga, Datum_Pocetka_Akcije, Datum_Zavrsetka_Akcije)
	VALUES (
		2,
		'Besplatno pranje',
		'Nakon promena svih pneumatika ostvaruje se popust od 5% na pranje!',
		4,
		1,
		convert(date, '2023-07-01', 23),
		convert(date, '2023-07-15', 23)
	)

INSERT INTO Projekat_IT34_2020.Akcija (ID_akcije, Naziv_akcije, Opis, ID_vrste_usluge, Broj_usluga, Datum_Pocetka_Akcije, Datum_Zavrsetka_Akcije)
	VALUES (
		3,
		'Krpljenje za minut!',
		'Svako 10. krpljenje pneumatika gratis',
		3,
		10,
		convert(date, '2023-08-01', 23),
		convert(date, '2023-08-15', 23)
	)

INSERT INTO Projekat_IT34_2020.Akcija (ID_akcije, Naziv_akcije, Opis, ID_vrste_usluge, Broj_usluga, Datum_Pocetka_Akcije, Datum_Zavrsetka_Akcije)
	VALUES (
		4,
		'Tri u jedan',
		'Krpljenje, zamena i balans pneumatika za 5000.',
		1,
		7,
		convert(date, '2023-09-01', 23),
		convert(date, '2023-09-15', 23)
	)

INSERT INTO Projekat_IT34_2020.Akcija (ID_akcije, Naziv_akcije, Opis, ID_vrste_usluge, Broj_usluga, Datum_Pocetka_Akcije, Datum_Zavrsetka_Akcije)
	VALUES (
		5,
		'Dva u jedan',
		'Provera pritiska i zamena pneumatika za 2000.',
		2,
		1,
		convert(date, '2023-10-01', 23),
		convert(date, '2023-10-15', 23)
	)

INSERT INTO Projekat_IT34_2020.Akcija (ID_akcije, Naziv_akcije, Opis, ID_vrste_usluge, Broj_usluga, Datum_Pocetka_Akcije, Datum_Zavrsetka_Akcije)
	VALUES (
		6,
		'Tri u jedan',
		'Provera pritiska i zamena pneumatika za 2000.',
		2,
		1,
		convert(date, '2023-05-01', 23),
		convert(date, '2023-07-15', 23)
	)

SELECT * FROM Projekat_IT34_2020.Akcija

-- Projekat_IT34_2020.Popust --

INSERT INTO Projekat_IT34_2020.Popust (Rbr_popusta, Ispunjen_uslov, Brojac, ID_klijenta, ID_akcije)
	VALUES (
		1,
		0,
		1,
		1,
		3
	)

INSERT INTO Projekat_IT34_2020.Popust (Rbr_popusta, Ispunjen_uslov, Brojac, ID_klijenta, ID_akcije)
	VALUES (
		2,
		1,
		0,
		2,
		4
	)

INSERT INTO Projekat_IT34_2020.Popust (Rbr_popusta, Ispunjen_uslov, Brojac, ID_klijenta, ID_akcije)
	VALUES (
		3,
		1,
		3,
		3,
		5
	)

INSERT INTO Projekat_IT34_2020.Popust (Rbr_popusta, Ispunjen_uslov, Brojac, ID_klijenta, ID_akcije)
	VALUES (
		4,
		0,
		2,
		4,
		1
	)

INSERT INTO Projekat_IT34_2020.Popust (Rbr_popusta, Ispunjen_uslov, Brojac, ID_klijenta, ID_akcije)
	VALUES (
		5,
		1,
		3,
		5,
		2
	)

SELECT * FROM Projekat_IT34_2020.Popust

-- Projekat_IT34_2020.Zahtev --

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'NS 465 MF',
		convert(date, '2023-10-01', 23),
		1
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'BG 4568 KK',
		convert(date, '2022-05-01', 23),
		2
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'BG 4568 KK',
		convert(date, '2022-05-01', 23)
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'NS 444 MK',
		convert(date, '2022-05-01', 23),
		3
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'NI 298 MJ',
		convert(date, '2023-07-01', 23),
		4
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'NS 767 JJ',
		convert(date, '2021-02-01', 23),
		5
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'NS 786 JJ',
		convert(date, '2021-05-29', 23),
		5
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'NS 767 JJ',
		convert(date, '2021-05-20', 23),
		5
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'NS 767 JJ',
		convert(date, '2021-05-23', 23),
		5
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'BG 489 MM',
		convert(date, '2023-02-01', 23),
		3
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'BG 4568 LL',
		convert(date, '2023-02-01', 23),
		1
	)

INSERT INTO Projekat_IT34_2020.Zahtev (ID_zahteva, Registarski_broj, Datum_podnosenja, ID_klijenta)
	VALUES (
		next value for Projekat_IT34_2020.Seq_Zahtev,
		'KG 4568 KK',
		convert(date, '2023-02-01', 23),
		1
	)
SELECT * FROM Projekat_IT34_2020.Zahtev

-- Projekat_IT34_2020.StatusZahteva --

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		1,
		'Novi'
	)

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		2,
		'U toku'
	)

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		3,
		'Završen'
	)

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		4,
		'Odbačen'
	)

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		5,
		'Na čekanju'
	)

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		6,
		'Poništen'
	)

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		7,
		'Prihvaćen'
	)

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		8,
		'Na čekanju'
	)

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		9,
		'Nije rešeno'
	)

INSERT INTO Projekat_IT34_2020.StatusZahteva (ID_statusa_zahteva, Naziv_statusa)
	VALUES (
		10,
		'Zatvoren'
	)

SELECT * FROM Projekat_IT34_2020.StatusZahteva

-- Projekat_IT34_2020.SeDodeljuje --

INSERT INTO Projekat_IT34_2020.SeDodeljuje (ID_statusa_zahteva, ID_zahteva, Datum_od, Datum_do, Aktivnost_statusa)
	VALUES (
		1,
		2,
		convert(date, '2023-10-01', 23),
		'',
		1
	)

INSERT INTO Projekat_IT34_2020.SeDodeljuje (ID_statusa_zahteva, ID_zahteva, Datum_od, Datum_do, Aktivnost_statusa)
	VALUES (
		3,
		1,
		convert(date, '2023-02-01', 23),
		convert(date, '2023-02-07', 23),
		0
	)

INSERT INTO Projekat_IT34_2020.SeDodeljuje (ID_statusa_zahteva, ID_zahteva, Datum_od, Datum_do, Aktivnost_statusa)
	VALUES (
		5,
		3,
		convert(date, '2022-05-01', 23),
		'',
		1
	)

INSERT INTO Projekat_IT34_2020.SeDodeljuje (ID_statusa_zahteva, ID_zahteva, Datum_od, Datum_do, Aktivnost_statusa)
	VALUES (
		7,
		4,
		convert(date, '2023-07-01', 23),
		convert(date, '2023-08-01', 23),
		0
	)

INSERT INTO Projekat_IT34_2020.SeDodeljuje (ID_statusa_zahteva, ID_zahteva, Datum_od, Datum_do, Aktivnost_statusa)
	VALUES (
		9,
		5,
		convert(date, '2021-02-01', 23),
		convert(date, '2023-02-15', 23),
		1
	)

SELECT * FROM Projekat_IT34_2020.SeDodeljuje

-- Projekat_IT34_2020.VrstaDana --

INSERT INTO Projekat_IT34_2020.VrstaDana (ID_vrste_dana, Naziv_vrste_dana, Radno_vreme)
	VALUES (
		1,
		'Radni dan',
		'08 - 20 časova'
	)

INSERT INTO Projekat_IT34_2020.VrstaDana (ID_vrste_dana, Naziv_vrste_dana, Radno_vreme)
	VALUES (
		2,
		'Subota',
		'08 - 15 časova'
	)

INSERT INTO Projekat_IT34_2020.VrstaDana (ID_vrste_dana, Naziv_vrste_dana, Radno_vreme)
	VALUES (
		3,
		'Nedelja',
		' / '
	)

INSERT INTO Projekat_IT34_2020.VrstaDana (ID_vrste_dana, Naziv_vrste_dana, Radno_vreme)
	VALUES (
		4,
		'Radni praznici',
		'08 - 15 časova'
	)

INSERT INTO Projekat_IT34_2020.VrstaDana (ID_vrste_dana, Naziv_vrste_dana, Radno_vreme)
	VALUES (
		5,
		'Neradni praznici',
		' / '
	)

INSERT INTO Projekat_IT34_2020.VrstaDana (ID_vrste_dana, Naziv_vrste_dana, Radno_vreme)
	VALUES (
		6,
		'Godišnji odmor',
		' / '
	)

SELECT *  FROM Projekat_IT34_2020.VrstaDana

-- Projekat_IT34_2020.Dan --

INSERT INTO Projekat_IT34_2020.Dan (ID_dana, Datum, Radni_dan, ID_vrste_dana)
	VALUES (
		1,
		convert(date, '2023-05-30', 23),
		1,
		1
	)

INSERT INTO Projekat_IT34_2020.Dan (ID_dana, Datum, Radni_dan, ID_vrste_dana)
	VALUES (
		2,
		convert(date, '2023-02-15', 23),
		0,
		5
	)

INSERT INTO Projekat_IT34_2020.Dan (ID_dana, Datum, Radni_dan, ID_vrste_dana)
	VALUES (
		3,
		convert(date, '2023-06-04', 23),
		0,
		3
	)

INSERT INTO Projekat_IT34_2020.Dan (ID_dana, Datum, Radni_dan, ID_vrste_dana)
	VALUES (
		4,
		convert(date, '2023-06-13', 23),
		1,
		1
	)

INSERT INTO Projekat_IT34_2020.Dan (ID_dana, Datum, Radni_dan, ID_vrste_dana)
	VALUES (
		5,
		convert(date, '2021-06-10', 23),
		1,
		2
	)

INSERT INTO Projekat_IT34_2020.Dan (ID_dana, Datum, Radni_dan, ID_vrste_dana)
	VALUES (
		6,
		convert(date, '2023-05-30', 23),
		1,
		2
	)

INSERT INTO Projekat_IT34_2020.Dan (ID_dana, Datum, Radni_dan, ID_vrste_dana)
	VALUES (
		7,
		convert(date, '2023-05-29', 23),
		1,
		2
	)

SELECT * FROM Projekat_IT34_2020.Dan

-- Projekat_IT34_2020.Termin --

INSERT INTO Projekat_IT34_2020.Termin (Rbr_termina, Vreme, Odobren, ID_zahteva, ID_dana)
	VALUES (
		1,
		convert(varchar, '14:00:00', 108),
		1,
		1,
		2
	)

INSERT INTO Projekat_IT34_2020.Termin (Rbr_termina, Vreme, Odobren, ID_zahteva, ID_dana)
	VALUES (
		2,
		convert(varchar, '08:30:00', 108),
		1,
		2,
		1
	)

INSERT INTO Projekat_IT34_2020.Termin (Rbr_termina, Vreme, Odobren, ID_zahteva, ID_dana)
	VALUES (
		3,
		convert(varchar, '10:00:00', 108),
		1,
		3,
		1
	)

INSERT INTO Projekat_IT34_2020.Termin (Rbr_termina, Vreme, Odobren, ID_zahteva, ID_dana)
	VALUES (
		4,
		convert(varchar, '09:45:00', 108),
		0,
		4,
		3
	)

INSERT INTO Projekat_IT34_2020.Termin (Rbr_termina, Vreme, Odobren, ID_zahteva, ID_dana)
	VALUES (
		5,
		CONVERT(VARCHAR, '13:20:00', 108),
		1,
		5,
		4
	)

INSERT INTO Projekat_IT34_2020.Termin (Rbr_termina, Vreme, Odobren, ID_zahteva, ID_dana)
	VALUES (
		6,
		convert(varchar, '10:00:00', 108),
		1,
		1,
		2
	)

INSERT INTO Projekat_IT34_2020.Termin (Rbr_termina, Vreme, Odobren, ID_zahteva, ID_dana)
	VALUES (
		7,
		convert(varchar, '12:00:00', 108),
		0,
		1,
		2
	)

INSERT INTO Projekat_IT34_2020.Termin (Rbr_termina, Vreme, Odobren, ID_zahteva, ID_dana)
	VALUES (
		8,
		convert(varchar, '14:00:00', 108),
		1,
		1,
		2
	)

SELECT * FROM Projekat_IT34_2020.Termin