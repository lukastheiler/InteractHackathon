# Hackathon aufgaben

Das erste Ziel ist, eine App zu erstellen, welche zählt, wie oft ich beim Beacon vorbeigekommen bin. 

## 1. Hello Word

Xcode starten, Projekt hinzufügen, Umgebung erklären. 

Hello World label hinzufügen. Run im Simulator. 

iPhone anhängen, Run auf iPhone (Braucht Apple ID + Credentials)
_--> Frage:  Wer hat den Account ?_

![alt text](images/s1.png =250x)

## 2. Interaktion hinzufügen
Button "Count" hinzufügen
IBAction für Button erstellen
IBoutlet für Label erstellen
Variable "count" erstellen, +1 bei action.
Problem: beim laden ist der counter nicht 0. Lösung über funktion.

![alt text](images/s2.png =250x)

## 3. Interactor konfigurieren
Einloggen, Beacon hinzufügen. 
Zone, Event, jedes mal ein push "CONTER!!", Zone auf sehr klein setzen.
Batterie rausnehmen, da sonst das SDK kein Event triggert. 
_--> Account für alle vorbanden?_
_--> Beacon für alle vorhanden?_

## 4. SDK einfügen
Wichtig: Auf dem iPhone laufen lassen, sonst gibt es Fehler!

Schritte auf der [Webseite](https://developer.interactor.swisscom.ch/developer/sdk/swift/getting-started) durchführen.
(Hinweis: Interactor.framework verwenden, Other linker flags -lc++).
Wichtig: Interactor.framework unter General/Embedded Binaries hinzufügen.

--> Grundrauschen erscheint auf der Konsole.

## 5. Counter anpassen


## Zusatzaufgaben
- Erstelle ein App-Icon mittels [https://makeappicon.com](https://makeappicon.com).




