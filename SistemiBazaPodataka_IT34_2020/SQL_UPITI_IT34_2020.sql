							------------------------------ IT 34/2020 ------------------------------
/*
	Script sa SQL UPITIMA
*/

USE it34g2020

/*					I SQL UPIT 
Izlistati:
	ID_vrste_usluge kao 'Šifru vrste usluge', 
	Naziv_vrste_usluge kao 'Naziv vrste usluge',
	Cenu,
	Valutu,
	Broj klijenata koji su koristili svaku vrstu usluge kao i
	'Ukupan broj korišćenja usluge'.
Sortirati po ceni rastuće.
*/
SELECT VrstaUsluge.ID_vrste_usluge as 'Šifra vrste usluge', Naziv_vrste_usluge as 'Naziv vrste usluge', Cena, Valuta,
count(ID_klijenta) as 'Broj klijenata', Brojac as 'Ukupan broj korišćenja usluge'
	FROM Projekat_IT34_2020.VrstaUsluge LEFT JOIN Projekat_IT34_2020.Akcija on (VrstaUsluge.ID_vrste_usluge = Akcija.ID_vrste_usluge)
										 LEFT JOIN Projekat_IT34_2020.Popust on (Akcija.ID_akcije = Popust.ID_akcije)
GROUP BY VrstaUsluge.ID_vrste_usluge, Naziv_vrste_usluge, Cena, Valuta, Brojac
ORDER BY Cena asc


/*					II SQL UPIT 
Izlistati:
	ID_klijenta kao 'Redni broj klijenta',
	Ime_fl i Prezime_fl kao 'Ime i prezime klijenta',
	Broj_telefona kao 'Broj telefona',
	Mesto,
	ID_zahteva kao 'Identifikacioni broj',
	Naziv_vrste_usluge za koju se zahtev podnosi kao 'Vrsta usluge'
Za zahteve klijenata (samo fizičkih lica) koji su podneti dana '2023-10-01' i čija je Aktivnost_statusa != 1.
Sortirati po mestu rastuće, a prezimenu opadajuće
*/
SELECT Klijent.ID_klijenta, Ime_fl + ' ' + Prezime_fl as 'Ime i prezime klijenta', Broj_telefona as 'Broj telefona' , Mesto, 
Zahtev.ID_zahteva as 'Identifikacioni broj zahteva', Naziv_vrste_usluge as 'Vrsta usluge'
	FROM Projekat_IT34_2020.Klijent JOIN Projekat_IT34_2020.FizickoLice on (Klijent.ID_fizickog_lica = FizickoLice.ID_fizickog_lica)
									 JOIN Projekat_IT34_2020.Zahtev on (Klijent.ID_klijenta = Zahtev.ID_klijenta)
									 JOIN Projekat_IT34_2020.SeDodeljuje on (Zahtev.ID_zahteva = SeDodeljuje.ID_zahteva)
									 JOIN Projekat_IT34_2020.Popust on (Klijent.ID_klijenta = Popust.ID_klijenta)
									 JOIN Projekat_IT34_2020.Akcija on (Popust.ID_akcije = Akcija.ID_akcije)
									 JOIN Projekat_IT34_2020.VrstaUsluge on (Akcija.ID_vrste_usluge = VrstaUsluge.ID_vrste_usluge)
WHERE Datum_podnosenja = '2023-10-01' and Aktivnost_statusa != 1
ORDER BY Mesto asc, Prezime_fl desc;

/*					III SQL UPIT 
Izlistati :
	Naziv_vrste_usluge,
	Broj_zahteva kao 'Broj zahteva',
	Broj odobrenih termina,
	Broj klijenata
Gde je broj odobrenih termina veći od 0 i sortirati rastuće prema odobrenim terminima i nazivu vrste usluge.
*/
SELECT VrstaUsluge.Naziv_vrste_usluge as 'Naziv vrste usluge',  count(Zahtev.ID_zahteva) as 'Broj zahteva', 
count(Termin.Odobren) as 'Broj odobrenih termina', count(distinct Klijent.ID_klijenta) as 'Broj klijenata'
	FROM Projekat_IT34_2020.VrstaUsluge LEFT JOIN Projekat_IT34_2020.Akcija on (VrstaUsluge.ID_vrste_usluge = Akcija.ID_vrste_usluge)
										 LEFT JOIN Projekat_IT34_2020.Popust on (Popust.ID_akcije = Akcija.ID_akcije)
										 LEFT JOIN Projekat_IT34_2020.Klijent on (Klijent.ID_klijenta = Popust.ID_klijenta)
										 LEFT JOIN Projekat_IT34_2020.Zahtev on (Zahtev.ID_klijenta = Klijent.ID_klijenta)
										 LEFT JOIN Projekat_IT34_2020.Termin on (Termin.ID_zahteva = Zahtev.ID_zahteva)
WHERE Termin.Odobren = 1
GROUP BY VrstaUsluge.ID_vrste_usluge, VrstaUsluge.Naziv_vrste_usluge
HAVING count(Termin.Odobren) > 0
ORDER BY count(Termin.Odobren) asc, Naziv_vrste_usluge asc

/*					IV SQL UPIT 
Kreirati upit koji vraća informacije o zahtevima koji su podneti u poslednja tri meseca. 
Izlistati:
	ID_zahteva kao 'Redni broj zahteva',
	Registarski_broj vozila za koje se podnosi zahtev kao 'Registarska oznaka vozila',
	'Ukupan broj termina za svaki zahtev',
	'Poslednji datum' na koji se odnosi termin kao i 'Broj odobrenih termina'.
Prikazati samo zahteve koji imaju bar jedan termin i bar jedan odobren termin. 
Sortirati u opadajućem redosledu prema broju termina.
*/
SELECT Zahtev.ID_zahteva as 'Redni broj zahteva', Registarski_broj as 'Registarska oznaka vozila', 
count(Termin.Rbr_termina) as 'Broj termina', max(Dan.Datum) as 'Poslednji datum', 
	   sum(CASE WHEN Termin.Odobren = 1 THEN 1 ELSE 0 END) as 'Broj odobrenih termina'
			FROM Projekat_IT34_2020.Zahtev LEFT JOIN Projekat_IT34_2020.Termin on (Zahtev.ID_zahteva = Termin.ID_zahteva)
											LEFT JOIN Projekat_IT34_2020.Dan on (Termin.ID_dana = Dan.ID_dana)
WHERE Zahtev.Datum_podnosenja >= DATEADD(MONTH, -3, GETDATE()) --AND Dan.Radni_dan = 0
GROUP BY Zahtev.ID_zahteva, Zahtev.Registarski_broj
HAVING count(Termin.Rbr_termina) > 0 AND sum(CASE WHEN Termin.Odobren = 1 THEN 1 ELSE 0 END) > 0
ORDER BY count(Termin.Rbr_termina) desc;


/*					V SQL UPIT
Izlistati podatke o klijentima:
	ID_klijenta kao 'Redni broj klijenta',
	Broj_telefona kao 'Broj telefona',
	Adresa,
	Mesto,
	Postanski_broj as 'Postanski broj',
	Naziv trenutno aktivnog statusa za određeni zahtev i trenutno aktuelne akcije.
Izlistati samo one klijente čiji broj telefona počinje sa 060 ili 069. 
Sortirati ih po ID_statusa_zahteva rastuće
*/
SELECT Klijent.ID_klijenta as 'Redni broj klijenta', Broj_telefona as 'Broj telefona', Adresa, Mesto, Postanski_broj as 'Poštanski broj',
Naziv_statusa as 'Trenutno aktivan status', Naziv_akcije as 'Akcija koja je trenutno u toku'
	FROM Projekat_IT34_2020.Klijent JOIN Projekat_IT34_2020.Zahtev on (Klijent.ID_klijenta = Zahtev.ID_klijenta) 
									 JOIN Projekat_IT34_2020.SeDodeljuje on (Zahtev.ID_zahteva = SeDodeljuje.ID_zahteva)
									 JOIN Projekat_IT34_2020.StatusZahteva on (StatusZahteva.ID_statusa_zahteva = SeDodeljuje.ID_statusa_zahteva)
									 JOIN Projekat_IT34_2020.Popust on (Popust.ID_klijenta = Klijent.ID_klijenta)
									 JOIN Projekat_IT34_2020.Akcija on (Akcija.ID_akcije = Popust.ID_akcije)
WHERE Klijent.Broj_telefona LIKE '%060%' OR Klijent.Broj_telefona LIKE '%069%'
ORDER BY StatusZahteva.ID_statusa_zahteva asc
