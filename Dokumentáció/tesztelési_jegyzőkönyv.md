# Tesztelési jegyzőkönyv

| 1. | Tesztelési jegyzőkönyv |
|----|----|
| A tesztelési-eset leírása és célja | Belépés csak a megfelelő adatok megadásával. |
| A tesztelt folyamat/funckió leírása | teszt során megbizonyosodtunk abban, hogy az oldalra csak regisztrált személyek léphetnek be. Tehát csakis az adatbázisban eltárolt felhasználónév, jelszó párossal lehet belépni.  |
| A tesztelés előfeltételei | Az adatbázisbán eltárolt felhasználónév és jelszó páros, a weboldalon elérhető Loginform. |
| A tesztelés dátuma és időpontja | Az adatbázisbán eltárolt felhasználónév és jelszó páros, a weboldalon elérhető Loginform. |
| A tesztelés dátuma | 2020.04.30. |
| A tesztadatok típusa | Szöveges |
| A tesztet végző személy(ek) | Marton Benjámin |
| A tesztelt rendszer beállításai | Zárt rendszer, csak fejlesztők hozzáférésével. |
| A teszt-eset elvárt eredménye | Hibaüzenet nem megfelelő belépési adatok megadása illetve nem kitöltött mező esetén. Megfelelő belépési adatok megadása esetén pedig beléptetés az oldalra. |
| A tesztelés eredménye | Megfelelt megjegyzésekkel |
| Megjegyzés | A frontend hiányában csak az adatbázisból lekérdezés útján lehetett leellenőrizni. |

| 2. | Tesztelési jegyzőkönyv |
|----|----|
| A tesztelési-eset leírás és célja | Az adatok biztonságos tárolása |
| A tesztelt folyamat/funckió leírása | Biztosítani, hogy az adatok illetéktelen személy nem férhet hozzá csak az erre jogosultak. |
| A tesztelés előfeltételei | Az adattárolás megfelelő kiépítése az adatbázisban. |
| A tesztelés dátuma | 2019.11.15. |
| A tesztadatok típusa | Szöveges |
| A tesztet végző személy(ek) | Marton Benjámin |
| A tesztelt rendszer beállításai | Zárt rendszer, csak fejlesztők hozzáférésével. |
| A teszt-eset elvárt eredménye | Nem bejelentkezett illetve csak egyszerű felhasználók számára semmilyen a cégről való nem publikus  adathoz nincs hozzáférés. |
| A tesztelés eredménye | Nem megfelelt |
| Megjegyzés | A sikertelenség oka, hogy  nem volt frontend így a weboldalról történő behatolás nem volt szimulálható ilyen formában. |

| 3. | Tesztelési jegyzőkönyv |
|----|----|
| A tesztelési-eset leírás és célja | Az információk egyszerű és érthető megjelenítése a felhasználók számára |
| A tesztelt folyamat/funckió leírása | A felhasználók számára minden az oldalon megjelenített tartalom egyértelmű és tisztán érthető. |
| A tesztelés előfeltételei | Hozzáférés a backendben generálódó adatokhoz |
| A tesztelés dátuma | 2020.05.05. |
| A tesztadatok típusa | Képes |
| A tesztet végző személy(ek) | Sas-Gyarmati Norbert |
| A tesztelt rendszer beállításai | Zárt rendszer, csak fejlesztők hozzáférésével. |
| A teszt-eset elvárt eredménye | - |
| A tesztelés eredménye | Nem megfelelt |
| Megjegyzés | Frontend hiányában ezt a tesztet nem sikerült elvégezni. |

| 4. | Tesztelési jegyzőkönyv |
|----|----|
| A tesztelési-eset leírás és célja | A garázskapuk megfelelő kilistázása a weboldalon mind a felhasználók mind a dolgozók számára |
| A tesztelt folyamat/funckió leírása | A felhasználók számára csak az aktuálisan elérhető garázskapuk és alkatrészeik láthatók, míg az alkalmazottak számára minden termék és annak jelenlegi státusza is, valamint a supervisor képes módosítani az összes adatot|
| A tesztelés előfeltételei | A felhasználók számára csak az aktuálisan elérhető garázskapuk láthatók, míg a supervisor számára minden garázskapu, alkatrész és annak jelenlegi státusza is, valamint képes módosítani a termékekek státuszát.  |
| A tesztelés dátuma és időpontja | 2020.04.25. |
| A tesztadatok típusa | Képes / Szöveges |
| A tesztet végző személy(ek) | Sas-Gyarmati Norbert |
| A tesztelt rendszer beállításai | Zárt rendszer, csak fejlesztők hozzáférésével. |
| A teszt-eset elvárt eredménye | - |
| A tesztelés eredménye | Megfelelt megjegyzésekkel |
| Megjegyzés | Az adatbázis lekérdezések működtek, de a felületen keresztül nem lehetett elvégezni. |
