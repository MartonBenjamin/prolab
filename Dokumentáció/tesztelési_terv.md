# Tesztelési terv
A csapatunk három csoportból áll, <strong>frontend</strong>,<strong>backend</strong> és <strong>adatbázis</strong>. A frontend <strong>HTML</strong>, <strong>CSS</strong> és <strong>Java Script</strong>-el míg a backend <strong>RestAPI</strong>, <strong>React</strong>,<strong>NodeJS</strong>-sel dolgozik. Az adatbázis pedig <strong>MySQL</strong>-t.

Frontenden <strong>HomePage</strong>, <strong>RegisterPage</strong>, <strong>Contact</strong>, <strong>Order</strong>, <strong>LoginPage</strong> és <strong>LoginForm</strong> Backenden pedig a nagyobb komponensek az <strong>UserRegister</strong>, <strong>Login</strong>, <strong>MessageService</strong>.

A tesztelést frontend részen tesztelők végzik akik végig járják az oldalakat, funkciókat és ellenőrzik, hogy mind a megjelenés, mind pedig a gombok, mezők megfelelően működnek-e. Backenden pedig egy algoritmussal terhelni az adatbázist illetve a szervert, valamint tesztelők közreműködésével a különböző funkciókat/komponenseket. A backend teszteléséhez használatos program első sorban az <strong>Postman</strong>.</br>

| Tesztkörnyezet |
| Környezet neve és feladata | A hozzáférés módja | Konfiguráció | Kapcsolattartó személy(ek) |
| Frontend: Az oldalon található elemek kiépítése, implementálása. Az oldal felruházáa felhasználóbarát elemekkel. Valamint szerepkörök kialakításáea alkalmas design. A backendben található komponensek megjelenítése. | Böngésző | - | Vincze Flórián |
| Backend: Az oldal mögött található logika kiépítése. Adatbáziskapcsolat kiépítése.| MySql Workbench | - | Marton Benjámin |
| Adatbázis: Az oldalon keletkezett adatok megfelelő, biztonságos tárolása. | Postman | - | Marton Benjámin |

## Bevezetés
Tesztelési tervünk célja a rendszer hibáinak feltárásának felgyorsítása, illetve kiküszöbölése. Ezzel kívánjuk biztosítani, hogy minden lényeges és szükséges funkció tesztelésre kerüljön. Emellett az interaktív felületek ilyen irányú vízsgálata is elengedhetetlen. 


## Tesztadatok
•	A teszt végrehajtásához szükséges rekordok (tesztadatok) száma: -</br>
•	A tesztadatok elkészítéséért és feltöltéséért felelős személy: Vincze Flórián


## Fejlesztői teszt
A fejlesztés utolsó heteihez közeledve a fejlesztői csapat tagjai a lehető legtöbb módon átvizsgálják az oldalt. Teszt alá vetik az oldal által nyújtott lehetőségeket, funkciókat. 


## Tesztelendő elvárások

| Sorszám | Megnevezés |
|---|---|
| 1. | Belépés csak a megfelelő adatok megadásával. |
| 2. | Az oldalon való akadáylmentes navigálás. |
| 3. | Az adatok biztonságos tárolása. |
| 4. | A céggel való egyszerű kapcsolattartás az oldalon keresztül. |
| 5. | Az információk egyszerű érthető megjelenítése a felhasználók számára. |
| 6. | Az oldal probblémamentes működésének biztosítása. |
| 7. | A garázskapauk megfelelő listázása, garázskapuk státuszának módosítása. |


## Tesztelt elvárások
| Sorszám | Megnevezés |
|---|---|
| 1. | Belépés csak a megfelelő adatok megadásával. |
| 2. | - |
| 3. | Az adatok biztonságos tárolása. |
| 4. | A céggel való egyszerű kapcsolattartás az oldalon keresztül. |
| 5. | - |
| 6. | - |
| 7. | A garázskapuk megfelelő listázása, garázskapuk státuszának módosítása. |


## Elfogadási kritériumok
A teszt sikerességének kritériumai:</br>
•	Technikai, a teszt forgatókönyvben leírtak szerint.</br>
•	A projekt menedzser jóváhagyása.


## Leszállítandó dokumentumok

| Cím | Felelős személy | Szállítás gyakorisága | Szállítás módja |
| Tesztterv | Felelős személy | Szállítás gyakorisága | Szállítás módja |
| Teszt-esetek | Marton Benjámin | - | GitHub |
| Tesztjegyzőkönyvek| - | - | GitHub |
| Tesztelési jelentés | Soós Gergő | Egyszer a projekt végén | GitHub |