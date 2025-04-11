							------------------------------ IT 34/2020 ------------------------------
------------------------------ DDL - script za kreiranje i brisanje schema, sekvenci i tabela ------------------------------

USE it34g2020

-------------------- DROP TABLE --------------------
IF OBJECT_ID('Projekat_IT34_2020.Popust', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.Popust;
GO 

IF OBJECT_ID('Projekat_IT34_2020.Akcija', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.Akcija;
GO

IF OBJECT_ID('Projekat_IT34_2020.VrstaUsluge', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.VrstaUsluge;
GO

IF OBJECT_ID('Projekat_IT34_2020.SeDodeljuje', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.SeDodeljuje;
GO

IF OBJECT_ID('Projekat_IT34_2020.StatusZahteva', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.StatusZahteva;
GO

IF OBJECT_ID('Projekat_IT34_2020.Termin', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.Termin;
GO

IF OBJECT_ID('Projekat_IT34_2020.Dan', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.Dan;
GO

IF OBJECT_ID('Projekat_IT34_2020.VrstaDana', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.VrstaDana;
GO

IF OBJECT_ID('Projekat_IT34_2020.Zahtev', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.Zahtev;
GO

IF OBJECT_ID('Projekat_IT34_2020.Klijent', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.Klijent;
GO

IF OBJECT_ID('Projekat_IT34_2020.PravnoLice', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.PravnoLice;
GO

IF OBJECT_ID('Projekat_IT34_2020.FizickoLice', 'U') IS NOT NULL
	DROP TABLE Projekat_IT34_2020.FizickoLice;
GO

-------------------- DROP SEQUENCE --------------------

IF OBJECT_ID('Projekat_IT34_2020.Seq_PravnoLice', 'SO') IS NOT NULL
	DROP SEQUENCE Projekat_IT34_2020.Seq_PravnoLice;
GO

IF OBJECT_ID('Projekat_IT34_2020.Seq_FizickoLice', 'SO') IS NOT NULL
	DROP SEQUENCE Projekat_IT34_2020.Seq_FizickoLice;
GO

IF OBJECT_ID('Projekat_IT34_2020.Seq_VrstaUsluge', 'SO') IS NOT NULL
	DROP SEQUENCE Projekat_IT34_2020.Seq_VrstaUsluge;
GO

IF OBJECT_ID('Projekat_IT34_2020.Seq_Zahtev', 'SO') IS NOT NULL
	DROP SEQUENCE Projekat_IT34_2020.Seq_Zahtev;
GO


-------------------- DROP FUNCTION -------------------- 
IF OBJECT_ID('Projekat_IT34_2020.FunkcijaZahtev', 'FN') IS NOT NULL
	DROP FUNCTION Projekat_IT34_2020.FunkcijaZahtev;
GO

IF OBJECT_ID('Projekat_IT34_2020.FunkcijaKlijentInfo', 'IF') IS NOT NULL
	DROP FUNCTION Projekat_IT34_2020.FunkcijaKlijentInfo;
GO

-------------------- DROP PROCEDURE --------------------
IF OBJECT_ID('Projekat_IT34_2020.ProceduraZahtev', 'P') IS NOT NULL
	DROP PROC Projekat_IT34_2020.ProceduraZahtev;
GO

IF OBJECT_ID('Projekat_IT34_2020.ProceduraStatusAktivnosti', 'P') IS NOT NULL
	DROP PROC Projekat_IT34_2020.ProceduraStatusAktivnosti;
GO


-------------------- DROP TRIGGER --------------------
IF	OBJECT_ID('Projekat_IT34_2020.TrigerStatusZahteva', 'TR') IS NOT NULL
	DROP TRIGGER Projekat_IT34_2020.TrigerStatusZahteva;
GO

IF	OBJECT_ID('Projekat_IT34_2020.TrigerVrstaUsluge', 'TR') IS NOT NULL
	DROP TRIGGER Projekat_IT34_2020.TrigerVrstaUsluge;
GO

-------------------- DROP SCHEMA --------------------
IF SCHEMA_ID('Projekat_IT34_2020') IS NOT NULL
	DROP SCHEMA Projekat_IT34_2020;
GO

-------------------- CREATE SCHEMA --------------------
GO
CREATE SCHEMA Projekat_IT34_2020;
GO


-------------------- CREATE SEQUENCE -------------------- 
CREATE SEQUENCE Projekat_IT34_2020.Seq_PravnoLice as INT
start with 100000001
increment by 1
minvalue 1
no cycle;

CREATE SEQUENCE Projekat_IT34_2020.Seq_FizickoLice as INT
start with 1
increment by 1
minvalue 1
no cycle;

CREATE SEQUENCE Projekat_IT34_2020.Seq_VrstaUsluge as INT
start with 1
increment by 1
minvalue 1
no cycle;

CREATE SEQUENCE Projekat_IT34_2020.Seq_Zahtev as INT
start with 1
increment by 1
minvalue 1
no cycle;

-------------------- CREATE TABLE -------------------- 

CREATE TABLE Projekat_IT34_2020.PravnoLice
(
	PIB NUMERIC(9) NOT NULL,
	Naziv VARCHAR(20) NOT NULL,
	Ime_pl VARCHAR(12) NOT NULL,
	Prezime_pl VARCHAR(20) NOT NULL,
	CONSTRAINT PK_PravnoLice PRIMARY KEY (PIB),
	CONSTRAINT CHK_PravnoLice_PIB CHECK(PIB BETWEEN 100000001 AND 999999999 and len(PIB) = 9)
);


CREATE TABLE Projekat_IT34_2020.FizickoLice
(
	ID_fizickog_lica NUMERIC(8) NOT NULL,
	Ime_fl VARCHAR(12) NOT NULL,
	Prezime_fl VARCHAR(20) NOT NULL,
	JMBG_fl NUMERIC(13),
	CONSTRAINT PK_FizickoLice PRIMARY KEY (ID_fizickog_lica),
	CONSTRAINT UC_FizickoLice_JMBG_fl UNIQUE (JMBG_fl),
	CONSTRAINT CHK_FizickoLice_JMBG_fl CHECK (len(JMBG_fl) = 13),
	CONSTRAINT CHK_FizickoLice_ID_fizickog_lica CHECK (len(ID_fizickog_lica) > 0)
);

CREATE TABLE Projekat_IT34_2020.Klijent
(
	ID_klijenta NUMERIC(8) NOT NULL,
	Broj_telefona VARCHAR(14) NOT NULL,
	Adresa VARCHAR(30),
	Mesto VARCHAR(12),
	Postanski_broj NUMERIC(5), 
	Mejl VARCHAR(30),
	PIB NUMERIC(9), 
	ID_fizickog_lica NUMERIC(8), 
	CONSTRAINT PK_Klijent PRIMARY KEY (ID_klijenta),
	CONSTRAINT FK_Klijent_PravnoLice FOREIGN KEY (PIB)
		REFERENCES Projekat_IT34_2020.PravnoLice(PIB),
	CONSTRAINT FK_Klijent_FizickoLice FOREIGN KEY (ID_fizickog_lica)
		REFERENCES Projekat_IT34_2020.FizickoLice(ID_fizickog_lica),
	CONSTRAINT CHK_Klijent_ID_klijenta CHECK (len(ID_klijenta) > 0),
	CONSTRAINT CHK_Klijent_Postanski_broj CHECK (len(Postanski_broj) = 5),
	CONSTRAINT CHK_Klijent_PIB_ID_fizickog_lica CHECK ((PIB IS NULL AND ID_fizickog_lica IS NOT NULL) 
													OR (PIB IS NOT NULL AND ID_fizickog_lica IS NULL))
);


CREATE TABLE Projekat_IT34_2020.VrstaUsluge
(
	ID_vrste_usluge NUMERIC(8) NOT NULL,
	Naziv_vrste_usluge VARCHAR(30) NOT NULL,
	Cena NUMERIC(8) NOT NULL,
	Valuta VARCHAR(10) NOT NULL,
	CONSTRAINT PK_VrstaUsluge PRIMARY KEY (ID_vrste_usluge),
	CONSTRAINT CHK_VrstaUsluge_ID_vrste_usluge CHECK (len(ID_vrste_usluge) > 0),
	CONSTRAINT CHK_VrstaUsluge_Cena CHECK (len(Cena) > 0),
	CONSTRAINT UC_VrstaUsluge_Naziv_vrste_usluge UNIQUE (Naziv_vrste_usluge)
);

CREATE TABLE Projekat_IT34_2020.Akcija
(
	ID_akcije NUMERIC(8) NOT NULL,
	Naziv_akcije VARCHAR(40) NOT NULL,
	Opis VARCHAR(100) NOT NULL,
	Datum_Pocetka_Akcije Date NOT NULL, 
	Datum_Zavrsetka_Akcije Date NOT NULL, 
	ID_vrste_usluge NUMERIC(8) NOT NULL,
	Broj_usluga NUMERIC(8),
	CONSTRAINT PK_Akcija  PRIMARY KEY (ID_akcije),
	CONSTRAINT FK_Akcija_VrstaUsluge FOREIGN KEY(ID_vrste_usluge)
		REFERENCES Projekat_IT34_2020.VrstaUsluge(ID_vrste_usluge),
	CONSTRAINT CHK_Akcija_ID_akcije CHECK (len(ID_akcije) > 0),
	CONSTRAINT CHK_Akcija_Datum CHECK (Datum_Pocetka_Akcije < Datum_Zavrsetka_Akcije)
);

CREATE TABLE Projekat_IT34_2020.Popust
(
	Rbr_popusta NUMERIC(3) NOT NULL,
	Ispunjen_uslov BIT NOT NULL,
	Brojac NUMERIC(8) NOT NULL,
	ID_klijenta NUMERIC(8),
	ID_akcije NUMERIC(8),
	CONSTRAINT PK_Popust PRIMARY KEY (ID_klijenta, Rbr_popusta), 
	CONSTRAINT FK_Popust_Klijent FOREIGN KEY(ID_klijenta)
		REFERENCES Projekat_IT34_2020.Klijent(ID_klijenta),
	CONSTRAINT FK_Popust_Akcija FOREIGN KEY(ID_akcije)
		REFERENCES Projekat_IT34_2020.Akcija(ID_akcije),
	CONSTRAINT CHK_Popust_Rbr_popusta CHECK (len(Rbr_popusta) > 0),
	CONSTRAINT CHK_Popust_Brojac CHECK (len(Brojac) >= 0),
	CONSTRAINT CHK_Popust_Ispunjen_uslov CHECK (Ispunjen_uslov in (0, 1))
);

CREATE TABLE Projekat_IT34_2020.Zahtev
(
	ID_zahteva NUMERIC(8) NOT NULL,
	Registarski_broj VARCHAR(10),
	Datum_podnosenja DATE NOT NULL CONSTRAINT DFT_Zahtev_Datum_podnosenja DEFAULT(GETDATE()),
	ID_klijenta NUMERIC(8),
	CONSTRAINT PK_Zahtev PRIMARY KEY (ID_zahteva),
	CONSTRAINT FK_Zahtev_Klijent FOREIGN KEY (ID_klijenta)
		REFERENCES Projekat_IT34_2020.Klijent(ID_klijenta),
	CONSTRAINT CHK_Zahtev_ID_zahteva CHECK (len(ID_zahteva) > 0)
);

CREATE TABLE Projekat_IT34_2020.StatusZahteva
(
	ID_statusa_zahteva NUMERIC(8) NOT NULL,
	Naziv_statusa VARCHAR(12) NOT NULL,
	CONSTRAINT PK_StatusZahteva PRIMARY KEY (ID_statusa_zahteva),
	CONSTRAINT CHK_StatusZahteva_ID_statusa_zahteva CHECK (len(ID_statusa_zahteva) > 0)
);

CREATE TABLE Projekat_IT34_2020.SeDodeljuje
(
	ID_statusa_zahteva NUMERIC(8) NOT NULL,
	ID_zahteva NUMERIC(8) NOT NULL,
	Datum_od Date NOT NULL,
	Datum_do Date,
	Aktivnost_statusa BIT NOT NULL,
	CONSTRAINT PK_SeDodeljuje PRIMARY KEY(ID_zahteva, ID_statusa_zahteva),
	CONSTRAINT FK_SeDodeljuje_Zahtev FOREIGN KEY(ID_zahteva)
		REFERENCES Projekat_IT34_2020.Zahtev(ID_zahteva),
	CONSTRAINT FK_SeDodeljuje_StatusZahteva FOREIGN KEY(ID_statusa_zahteva)
		REFERENCES Projekat_IT34_2020.StatusZahteva(ID_statusa_zahteva),
	CONSTRAINT CHK_SeDodeljuje_Aktivnost_statusa CHECK (Aktivnost_statusa in (0, 1))
);

CREATE TABLE Projekat_IT34_2020.VrstaDana
(
	ID_vrste_dana NUMERIC(3) NOT NULL,
	Naziv_vrste_dana VARCHAR(25) NOT NULL,
	Radno_vreme VARCHAR(15) NOT NULL,
	CONSTRAINT PK_VrstaDana PRIMARY KEY (ID_vrste_dana),
	CONSTRAINT CHK_VrstaDana_ID_vrste_dana CHECK (len(ID_vrste_dana) > 0),
	CONSTRAINT UC_VrstaDana_Naziv_vrste_dana UNIQUE (Naziv_vrste_dana)	
);

CREATE TABLE Projekat_IT34_2020.Dan
(
	ID_dana NUMERIC(8) NOT NULL,
	Datum Date NOT NULL,
	Radni_dan BIT NOT NULL,
	ID_vrste_dana NUMERIC(3) NOT NULL,
	CONSTRAINT PK_Dan PRIMARY KEY (ID_dana),
	CONSTRAINT FK_Dan_VrstaDana FOREIGN KEY(ID_vrste_dana)
		REFERENCES Projekat_IT34_2020.VrstaDana(ID_vrste_dana),
	CONSTRAINT CHK_Dan_ID_dana CHECK (len(ID_dana) > 0),
	CONSTRAINT CHK_Dan_Radni_dan CHECK (Radni_dan in (0, 1))
);

CREATE TABLE Projekat_IT34_2020.Termin
(
	Rbr_termina NUMERIC(2) NOT NULL,
	Vreme TIME NOT NULL,
	Odobren BIT NOT NULL,
	ID_zahteva NUMERIC(8) NOT NULL,
	ID_dana NUMERIC(8) NOT NULL,
	CONSTRAINT PK_Termin PRIMARY KEY (ID_zahteva, Rbr_termina),
	CONSTRAINT FK_Termin_Zahtev FOREIGN KEY(ID_zahteva)
		REFERENCES Projekat_IT34_2020.Zahtev(ID_zahteva),
	CONSTRAINT FK_Termin_Dan FOREIGN KEY(ID_dana)
		REFERENCES Projekat_IT34_2020.Dan(ID_dana),
	CONSTRAINT CHK_Termin_Rbr_termina CHECK (len(Rbr_termina) > 0),
	CONSTRAINT CHK_Termin_Odobren CHECK (Odobren in (0, 1))
);

-------------------- ALTER SEQUENCE -------------------- 
ALTER TABLE Projekat_IT34_2020.PravnoLice
	ADD CONSTRAINT DFT_PravnoLice_PIB DEFAULT (next value for Projekat_IT34_2020.Seq_PravnoLice) for PIB;

ALTER TABLE Projekat_IT34_2020.FizickoLice
	ADD CONSTRAINT DFT_FizickoLice_ID_fizickog_lica DEFAULT (next value for Projekat_IT34_2020.Seq_FizickoLice) for ID_fizickog_lica;

ALTER TABLE Projekat_IT34_2020.VrstaUsluge
	ADD CONSTRAINT DFT_VrstaUsluge_ID_vrste_usluge DEFAULT (next value for Projekat_IT34_2020.Seq_VrstaUsluge) for ID_vrste_usluge;

ALTER TABLE Projekat_IT34_2020.Zahtev
	ADD CONSTRAINT DFT_Zahtev_ID_zahteva DEFAULT (next value for Projekat_IT34_2020.Seq_Zahtev) for ID_zahteva;