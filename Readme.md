# Setup

https://github.com/lukastheiler/InteractHackathon

- Es soll ein intensiver und spassiger Tag werden 
- Jedes Team stellt am Ende vom Tag in einm 5' Pitch vor, was es gemacht hat.
- Wir bilden 3-er Teams, 1 Mac 3 Phones, 3. Beacons 3 Personen.
- Wichtig: Keine Frage ist zu blöd, stellt soviele ihr könnt!

# "Junior Hacker" Training 1

*Zwingend für alle Junior Hackers*

## 1. Interactor
Interactor Konfigurieren: einloggen, Beacons hinzufügen. 

## 2. App
Sample App [runterladen](https://developer.interactor.swisscom.ch/download-sdk-and-apps), in XCode öffnen, API Key anpassen app auf dem iPhone laufen lassen.

## 3. Play
Notifications anpassen, Events usw. 
Spielt folgende Usecases nach:
- Ich komme in eine Zone : "Hallo Pina"
- Ich verlasse eine Zone: "See you Pina"

# "Junior Hacker" Training 2 
*Optional für alle Junior Hackers, spielt mit eurer eigenen idee*

Das erste Ziel ist, eine App zu erstellen, welche zählt, wie oft ich beim Beacon vorbeigekommen bin. 

## 1. Hello Word

Ausgehend von der Sample App: 
- Main.storyboard öffnen, eine neue View hinzufügen
- In der view einen Label "Hello World" einfügen hinzufügen. 
- Wichtig: der den App "Start Pfeil" auf die neue View setzen
- Achtung: Das Layout kann manchmal mühsam sein. Quick and Dirty Abhilfe via Simulated Metrics -> Size "iPhone 4.7-inch" oder über die Constraints: 
![alt text](images/s0.png)

"Run" im Simulator. 

iPhone anhängen, Run auf iPhone (Braucht Apple ID + Credentials)

![alt text](images/s1.png)

## 2. Interaktion im XCode Projekt hinzufügen
- Button "Count" hinzufügen
- IBAction für Button erstellen
- IBoutlet für Label erstellen
- Variable "count" erstellen, +1 bei action.

Problem: beim Laden ist der counter nicht 0. Lösung z.B. über funktion.

```swift
class ViewController: UIViewController {
    
    var count=0;
    
    @IBOutlet weak var counterLabel: UILabel!
    
    func updateCounter(){
        count=count+1
        counterLabel.text="#\(count) mal gedrückt!"
    }
    
    @IBAction func countButtonPressed(sender: AnyObject) {
        updateCounter()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

```

![alt text](images/s2.png)

## 3. Interactor konfigurieren
Zone, Event, jedes mal ein push "CONTER!!", Zone auf sehr klein setzen.
Batterie rausnehmen, da sonst das SDK kein Event triggert. 
_--> Account für alle vorbanden?_
_--> Beacon für alle vorhanden?_

## 4. SDK einfügen
Wichtig: Auf dem iPhone laufen lassen, sonst gibt es Fehler!

Schritte auf der [Webseite](https://developer.interactor.swisscom.ch/developer/sdk/swift/getting-started) durchführen.
Hinweis, ich verwende immer das Interactor.framework und setze other linker flags -lc++.
Wichtig: Interactor.framework unter General/Embedded Binaries hinzufügen.

Grundrauschen erscheint auf der Konsole.

## 5. Counter anpassen

Verbinden des Appdelegates mit dem ViewController mittels: 

```swift
func eventTriggered(data: LBSEvent!) {
    self.notify(data.name)
    print("BEACON FOUND!!!"+data.name)
    NSNotificationCenter.defaultCenter().postNotificationName("count", object: nil)
}
```

Entgegennahme des Events im ViewController: 
```swift

override func viewDidLoad() {
    super.viewDidLoad()
    updateCounter()
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("updateCounter"), name:"count", object: nil);
}


deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
}

```

Beim Testen ist wichig, dass ihr jedes ca 10s wartet, zwischen dem ein und ausschalten des Beacons.

Für push notifications evt den Background mode anpassen (Bin mir grad nicht sicher, ob das wirklich gebraucht wird).
```xml
<key>UIBackgroundModes</key>
<array>
	<string>remote-notification</string>
</array>
```


## 6. Zusatzaufgaben

- Erstelle ein App-Icon mittels [https://makeappicon.com](https://makeappicon.com).
- Nehme 3 Beacons, setze die Hintergrundfarbe je nach Zone (Blau, Rot, Grün)


