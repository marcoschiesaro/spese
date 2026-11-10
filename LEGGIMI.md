# Spese del mese: guida di installazione

I nomi dei menu di Supabase e GitHub possono cambiare leggermente nel tempo.

## 1. Database (Supabase, gratis)
1. Crea un account su supabase.com e un nuovo progetto (regione in Europa).
2. Vai su **SQL Editor**, incolla il contenuto di `setup.sql` e premi **Run**.
3. Vai su **Authentication**, nelle impostazioni dell'email disattiva **Confirm email** (così crei l'account senza conferma via posta).
4. Vai su **Project Settings → API** e copia **Project URL** e la chiave **anon public**.
   Non usare mai la chiave `service_role`.

## 2. Collega l'app
Apri `index.html` con un editor di testo, cerca `INCOLLA` e sostituisci i due valori con quelli copiati al punto 4.

## 3. Pubblica su GitHub
1. Crea un repository pubblico chiamato `spese`.
2. **Add file → Upload files** e trascina i file estratti dallo zip (non lo zip): `index.html`, `manifest.webmanifest`, `sw.js` e le tre icone `.png`. Conferma con **Commit**.
3. **Settings → Pages → Deploy from a branch**, ramo `main`, cartella `/ (root)`.
4. Dopo uno o due minuti l'app è su `https://TUONOME.github.io/spese/`.

## 4. Primo avvio
1. Apri l'indirizzo, tocca **Crea account** con la tua email e una password.
2. Su Supabase, in Authentication, disattiva le nuove registrazioni (**Allow new users to sign up**) così nessun altro può creare un account.
3. iPhone: Safari → Condividi → **Aggiungi alla schermata Home**. Mac: Safari → File → **Aggiungi al Dock**.
4. Fai l'accesso una volta su ogni dispositivo.

## 5. Portare i dati dalla versione attuale
Nella versione su Claude: **Backup e ripristino → Copia backup**. Nella nuova app: **Backup e ripristino**, incolla il testo e tocca **Ripristina**.

## 6. Manutenzione
- Ogni mese l'app ti ricorda di scaricare un backup: salvalo in iCloud Drive.
- Un progetto Supabase gratuito va in pausa dopo circa una settimana senza attività. Se succede, apri la dashboard e premi **Resume project**: i dati restano.
- La chiave `anon` è pubblica per progetto: la sicurezza dei dati dipende dalle regole di `setup.sql`, quindi non modificarle.
