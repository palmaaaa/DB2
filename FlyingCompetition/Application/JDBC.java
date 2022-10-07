import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class JDBC {
    private static JDBC conn;
    private static Connection connection;
    private static Statement statement;

    public static String line = "==========================================";
    public static String inputText = line+"\nInserisci l'opzione da selezionare:";
    public static String menuDisplay = String.format("1. Inserisci/modifica dati nel database\n2. Esegui query");
    public static String dataManagementString = String.format(line+"\nInserisci/modifica dati nel database\n" +
            "1. Log In Pilota\n" +
            "2. Iscrivi un un nuovo pilota\n" +
            "3. Log In Produttore\n" +
            "4. Iscrivi un nuovo produttore\n" +
            "5. Log In Direttore di Gara\n" +
            "6. Iscrivi un nuovo direttore di gara\n" +
            "0. Esci\n"+inputText);

    public static String querySelectorString = String.format(line+line+"\n\t\t\t\t\t\t\t\t\t\tQuery\n\n" +
            "1. Calcolare il numero di Km totali fatti da un pilota nell\'arco di un anno\n\n" +
            "2. Visualizzare il totale delle iscrizioni per ogni competizione sportiva ed il budget raggiunto grazie\n\t al pagamento delle quote di iscrizione ed il numero degli sponsor della competizione\n\n" +
            "3. Trovare per ogni pilota i dati del mezzo con il quale ha effettuato piu' km\n\n" +
            "4. Ottenere la classifica della gara cross country X-Alps tenutasi nell'anno Y e visualizzare per \n\togni pilota il mezzo con il quale si e' iscritto alla competizione e il tempo impiegato\n\n"+
            "5. \n\n"+
            "6. \n\n"+
            "7. \n\n"+
            "8. \n\n"+
            "9. \n\n"+
            "10. \n\n"+
            "11. \n\n"+
            "12. \n\n"+
            "13. \n\n"+
            "14. \n\n"+
            "15. \n\n"+

            "0. Esci\n"+line+inputText);

    /**
     * Crea una connessione con il db
     */
    private JDBC()
        {
            try {
                this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fly_competition", "root", "1234");
                this.statement = connection.createStatement();

            }
            catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Errore nel costruttore Generatore");
            }
        }

        public static JDBC startConnection() {
            if (statement == null)
                conn = new JDBC();
            return conn;
        }

    /*
    ================================================================================================================
                                                    QUERY
    ================================================================================================================
     */

    public static void query1(){
        try {

            System.out.println("Inserire il codice fiscale del pilota e l'anno del quale si vuole conoscere la performance");
            System.out.print("Codice fiscale: "); String cf =  new Scanner(System.in).nextLine();
            System.out.print("Anno: "); String anno =  new Scanner(System.in).nextLine();

            ResultSet res = statement.executeQuery(String.format(
                    "SELECT P.cf, Year(T.data) as anno,  sum(T.km_percorsi) as kmPercorsi " +
                            "FROM traccia T, pilota_dati_da_gara P " +
                            "WHERE P.cf = '%s' AND P.cf = T.cf_pilota AND year(Data) = '%s'" +
                            "GROUP BY P.cf, Year(T.data) ",cf,anno));

            String stmp = "I km totali effettuati nel "+anno+ "da "+ cf +" sono: ";
            int j = 0;
            while (res.next()){
                j++;
                stmp+= res.getString(3);
            }

            res.close();
            if(j==0){ System.out.println("Non ci sono dati per l'anno/pilota indicato");
            }else{ System.out.println(stmp);}

            TimeUnit.SECONDS.sleep(4);

        }catch (Exception e){
            e.printStackTrace();
        }


    }
    public static void query2(){}
    public static void query3(){ // Aggiungi il join
        try {
            ResultSet res = statement.executeQuery(
                        "SELECT soprannome, modello ,km_effettuati " +
                            "FROM km_per_mezzo " +
                            "JOIN produzione ON numero_seriale_mezzo = mezzo " +
                            "JOIN pilota_dati_da_gara ON cf = cf_pilota");

            String stmp = "";
            while (res.next()){
                for (int i=1; i<4; i++) stmp+= res.getString(i)+"\t";
                stmp+="\n";
            }

            res.close();
            System.out.println("\nNick\tMezzo\tKm");
            System.out.println(stmp);
            TimeUnit.SECONDS.sleep(4);

        }catch (Exception e){
            e.printStackTrace();
        }



    }
    public static void query4(){
        System.out.println("Inserire l'anno dell' X-Alps del quale visualizzare la classifca");
        String anno = new Scanner(System.in).nextLine();

        try {
            statement.executeQuery(""); //Inserire la query
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void query5(){}
    public static void query6(){}
    public static void query7(){}
    public static void query8(){}
    public static void query9(){}
    public static void query10(){}
    public static void query11(){}
    public static void query12(){}
    public static void query13(){}
    public static void query14(){}
    public static void query15(){}

    /*
    ================================================================================================================
    ================================================================================================================
     */

    /*
    ================================================================================================================
                                                    Manage DB By User
    ================================================================================================================
     */

    public static String pilot_options =
            "1. Visualizza mezzi posseduti\n" +
            "2. Modifica nickname\n" +
            "3. Visualizza tracce\n" +
            "4. Elimina traccia \n" +
            "5. Iscriviti ad una competizione \n" +
            "0. Esci\n"+line;

    public static void get_tracks(String cf) {
        try {
            ResultSet res2 = statement.executeQuery(String.format
                    ("SELECT * FROM traccia WHERE cf_pilota = '%s'", cf));

            if (res2.next()) {
                res2.close();
                ResultSet res = statement.executeQuery(String.format
                        ("SELECT * FROM traccia WHERE cf_pilota = '%s'", cf));

                String temp = "";
                while(res.next()){
                    for(int i=1; i<=10; i++) temp+= res.getString(i)+"\t";
                }
                System.out.println("\t\t\t\t\tData\t Partenza\t\t Km\t\t Arrivo\t Partenza  Media   Arrivo Tipo  Mezzo");
                System.out.println(temp);
                res.close();

            } else {
                System.out.println("Non ci sono tracce pubblicate per questo pilota");
            }

            TimeUnit.SECONDS.sleep(3);
            spazio();

        } catch (SQLException e) {
            e.printStackTrace();

        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public static void update_nickname(String cf){
        System.out.println("Inserisci il nuovo nickname");
        String new_nickname = new Scanner(System.in).nextLine();

        try {
            System.out.println(cf);
            statement.executeUpdate(String.format(
                    "UPDATE fly_competition.pilota_dati_da_gara SET soprannome = '%s' WHERE cf = '$s'",
                    new_nickname,cf));

            System.out.println("Nickname aggiornato!");
            TimeUnit.SECONDS.sleep(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void get_mezzi(String cf, String soprannome){

        try {
            ResultSet res  = statement.executeQuery(String.format(
                    "SELECT num_seriale_mezzo,modello FROM possesso JOIN produzione " +
                            "ON num_seriale_mezzo = numero_seriale_mezzo WHERE cf_pilota = '%s'"
                    , cf));

            String mezzi = String.format("%s possiede: ",soprannome);
            while(res.next())  mezzi +=  res.getString(2)+" [Seriale:"+res.getString(1)+"],";

            System.out.println(mezzi.substring(0,mezzi.length()-1));
            TimeUnit.SECONDS.sleep(3);
            res.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void delete_track(String cf){

        try {
            System.out.println("Inserire data (formato: anno.mese.giorno) e ora d'inizio (ora:minuto:secondo) della traccia da eliminare");
            System.out.print("Data: "); String data = new Scanner(System.in).nextLine(); System.out.println();
            System.out.print("Ora: "); String ora = new Scanner(System.in).nextLine(); System.out.println();

            statement.executeUpdate(String.format(
                    "DELETE FROM traccia WHERE cf_pilota='%s' AND data='%s' AND ora_partenza='%s'",cf,data,ora));

            System.out.println("Traccia eliminata!");
            TimeUnit.SECONDS.sleep(3);

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public static void subscribe_comp(String cf){
        System.out.println("Competizioni aperte: ");

        try {
            ResultSet res = statement.executeQuery("SELECT nome,edizione FROM competizione");
            String comp  = "";
            while(res.next()){ comp+= res.getString(1)+ " [Edizione:"+res.getString(2)+"]\n";}
            System.out.println(comp);

            System.out.println("Inserisci nome ed edizione del campionato al quale vuoi iscriverti");
            System.out.print("Nome competizione: "); String nome = new Scanner(System.in).nextLine();
            System.out.print("Edizione: "); String edizione = new Scanner(System.in).nextLine();
            System.out.print("Mezzo (seriale): "); String seriale_mezzo = new Scanner(System.in).nextLine();

            statement.execute(String.format(
                    "INSERT INTO iscrizione VALUES('%s','%s','%s','%s')",cf,nome,edizione,seriale_mezzo));

            System.out.println("Iscrizione effettuata!");
            TimeUnit.SECONDS.sleep(3);

        } catch (SQLException e) {
            System.out.println("Non e' possibile iscrivere un pilota minorenne!");
            try {TimeUnit.SECONDS.sleep(3);
            } catch (InterruptedException ex) {}
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void log_pilot(){
        System.out.println("\nInserisci il tuo nickname");
        String soprannome =  new Scanner(System.in).nextLine();

        try {
            ResultSet res = statement.executeQuery(String.format
                    ("SELECT * FROM pilota_dati_da_gara WHERE soprannome = '%s'",soprannome));
        if (res.next()){
                String cf_pilot = res.getString(1);

                while(true) {
                    System.out.println("\n" + pilot_options);
                    switch (new Scanner(System.in).nextInt()) {
                        case 1:
                            get_mezzi(cf_pilot, soprannome);
                            break;
                        case 2:
                            update_nickname(cf_pilot);
                            break;
                        case 3:
                            get_tracks(cf_pilot);
                            break;
                        case 4:
                            delete_track(cf_pilot);
                            break;
                        case 5:
                            subscribe_comp(cf_pilot);
                            break;
                        default:
                            return;
                    }
                }
        }else{
            System.out.println("Le credenziali inserite non sono corrette");
            TimeUnit.SECONDS.sleep(1);
            spazio();
        }
        res.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
    public static void register_pilot() {
        System.out.println("Inserire il codice fiscale");
        String cf = new Scanner(System.in).nextLine();
        System.out.println("Inserire il numero seriale del brevetto (8 cifre)");
        String brevetto = new Scanner(System.in).nextLine();
        System.out.println("Inserire il nome");
        String nome = new Scanner(System.in).nextLine();
        System.out.println("Inserire il cognome");
        String cognome = new Scanner(System.in).nextLine();
        System.out.println("Inserire l'email");
        String email = new Scanner(System.in).nextLine();
        System.out.println("Inserire il nickname");
        String nickname = new Scanner(System.in).nextLine();
        System.out.println("Inserire la data di nascita (Anno.mese.giorno)");
        String data_nascita = new Scanner(System.in).nextLine();
        //System.out.println(cf +" " +brevetto+" " +nickname+" " +nome+" " +cognome+" " +data_nascita+" " +email);

        try {
            statement.executeUpdate(String.format("INSERT INTO pilota_dati_da_gara VALUES('%s','%s','%s','%s')",
                    cf,brevetto,nickname,email));
            statement.executeUpdate(String.format("INSERT INTO pilota_dati_anagrafici VALUES('%s','%s','%s','%s')",
                    cf,nome,cognome,data_nascita));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("Utente registrato!");

        try{ TimeUnit.SECONDS.sleep(1);
        }catch(Exception e){}

    }

    public static String producer_options =
            "1. Visualizza i mezzi in produzione\n" +
            "2. Produci un nuovo mezzo\n" +
            "3. Sponsorizza un pilota\n" +
            "0. Esci\n"+line;


    public static void mezzi_in_prod(String piva){

        try {
            ResultSet res = statement.executeQuery(String.format(
                    "SELECT modello FROM modello_produttore WHERE produttore = '%s'",piva));

            String mezzi = "";
            while(res.next()){  mezzi+= res.getString(1)+","; }
            res.close();

            ResultSet res2 = statement.executeQuery(String.format(
                    "SELECT nome FROM produttore WHERE piva = '%s'",piva));

            String nomeProd = "";
            while(res2.next()){ nomeProd+= res2.getString(1); }

            System.out.println(nomeProd+" ha in produzione: "+mezzi.substring(0,mezzi.length()-1));
            TimeUnit.SECONDS.sleep(3);
            spazio();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void produci_mezzo(String piva){
        System.out.println("Inserisci il modello che vuoi produrre");
        String modello = new Scanner(System.in).nextLine();
        String seriale = "125";

        try {
            statement.execute(String.format(
                    "INSERT INTO produzione VALUES ('%s','%s','%s')",seriale,piva,modello));

            statement.execute(String.format(
                    "INSERT INTO mezzo VALUES ('%s','%s')",seriale,modello));

            System.out.println("Hai prodotto un nuovo mezzo: "+modello+" con seriale: "+seriale);
            TimeUnit.SECONDS.sleep(3);
            spazio();

        } catch (SQLException e) {
           e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void log_producer(){
        System.out.println("\nInserisci la P.Iva del produttore");
        String piva = new Scanner(System.in).nextLine();

        try {
            ResultSet res = statement.executeQuery(String.format
                    ("SELECT * FROM produttore WHERE piva = '%s'",piva));
            if (res.next()){

                System.out.println("\n"+producer_options);
                switch (new Scanner(System.in).nextInt()){
                    case 1:  mezzi_in_prod(piva); break;
                    case 2:  produci_mezzo(piva); break;
                    case 3:  sponsor_pilota(piva); break;
                    default: return;
                }
            }else{
                System.out.println("Le credenziali inserite non sono corrette");
            }
            res.close();
            TimeUnit.SECONDS.sleep(3);
            spazio();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
    public static void register_producer(){

        try {
        System.out.println("Inserire il nome del produttore");
        String nome = new Scanner(System.in).nextLine();
        System.out.println("Inserire la Partita IVA");
        String piva = new Scanner(System.in).nextLine();
        System.out.println("Inserire l'indirizzo della sede");
        String indirizzo = new Scanner(System.in).nextLine();

            statement.executeUpdate(String.format("INSERT INTO produttore VALUES('%s','%s','%s')",
                    piva,indirizzo,nome));

            statement.executeUpdate(String.format("INSERT INTO sponsor VALUES('%s','%s')",
                    piva,nome));

            System.out.println("Produttore registrato!");
            TimeUnit.SECONDS.sleep(2);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void sponsor_pilota(String piva){

        try {
            System.out.println("Inserisci il codice fiscale del pilota da sponsorizzare");
            String cf_pilota = new Scanner(System.in).nextLine();

            ResultSet res = statement.executeQuery(String.format("SELECT nome,cognome FROM pilota_dati_anagrafici WHERE cf = '%s'",
                    cf_pilota));

            String pilot_info ="";
            int j = 0;
            while(res.next()) {
                j++;
                pilot_info+= res.getString(1)+ " "+res.getString(2); }


            res = statement.executeQuery(String.format("SELECT soprannome FROM pilota_dati_da_gara WHERE cf = '%s'",
                    cf_pilota));

            String soprannome = "";
            while (res.next()){ soprannome+=" ["+res.getString(1)+"]"; }

            if(j!=0){
                statement.execute(String.format("INSERT INTO spon_pilota VALUES('%s','%s')",
                        piva,cf_pilota));
                System.out.println("Ora stai sponsorizzando: "+pilot_info+soprannome);
            }else{
                System.out.println("Codice fiscale errato!");
            }

            TimeUnit.SECONDS.sleep(2);
            res.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }


    public static void register_director(){

        try {
            System.out.println("Inserire il codice fiscale del direttore di gara");
            String cf = new Scanner(System.in).nextLine();
            System.out.println("Inserire il nome");
            String nome = new Scanner(System.in).nextLine();
            System.out.println("Inserire il cognome");
            String cognome = new Scanner(System.in).nextLine();
            System.out.println("Inserire gli anni di esperienza");
            String esperienza = new Scanner(System.in).nextLine();

            statement.executeUpdate(String.format("INSERT INTO direttore_di_gara VALUES('%s','%s','%s','%s')",
                    cf,nome,cognome,esperienza));

            System.out.println("Direttore di Gara registrato!");
            TimeUnit.SECONDS.sleep(2);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static String director_options =
            "1. Visualizza tutte le gare in un determinato anno\n" +
            "2. Dirigi una nuova gara\n" +
            "0. Esci\n"+line;
    public static void log_director(){
        System.out.println("\nInserisci il codice fiscale del direttore di gara");
        String cf = new Scanner(System.in).nextLine();

        try {
            ResultSet res = statement.executeQuery(String.format
                    ("SELECT * FROM direttore_di_gara WHERE cf = '%s'",cf));
            if (res.next()){

                System.out.println("\n"+director_options);
                switch (new Scanner(System.in).nextInt()){
                    case 1: get_directed_races(cf); break;
                    case 2: direct_race(cf); break;
                    default: return;
                }
            }else{
                System.out.println("Le credenziali inserite non sono corrette");
            }
            res.close();
            TimeUnit.SECONDS.sleep(3);
            spazio();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }

    public static void get_directed_races(String cf){
        System.out.println("\nInserisci l'anno del quale vuoi sapere le gare dirette");
        String anno = new Scanner(System.in).nextLine();

        try {
            ResultSet res = statement.executeQuery(String.format
                    ("SELECT nome_competizione,edizione_competizione FROM direzione WHERE cf_direttore = '%s' AND edizione_competizione = '%s'"
                            ,cf,anno));

            String gare = "";
            while (res.next()){ gare+= res.getString(1)+" "+res.getString(2)+"\n"; }
            System.out.println("Nel "+ anno+" hai diretto:\n"+gare);
            res.close();
            TimeUnit.SECONDS.sleep(3);
            spazio();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void direct_race(String cf){
        System.out.println("\nInserisci nome ed edizione della competizione da dirigere");
        System.out.print("Nome competizione: "); String nome = new Scanner(System.in).nextLine();
        System.out.print("Edizione: "); String edizione = new Scanner(System.in).nextLine();

        try {
           statement.execute(String.format
                    ("INSERT INTO direzione VALUES('%s','%s','%s')"
                            ,cf,nome,edizione));


            System.out.println("Ora sei il direttore di: "+nome+" "+edizione);
            TimeUnit.SECONDS.sleep(3);
            spazio();

        } catch (SQLException e) {
            System.out.println("Non puoi dirigere questa gara!");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    /*
    ================================================================================================================
    ================================================================================================================
     */

    public static void spazio(){ System.out.println("\n".repeat(50)); }
    public static void menu(int optionSelected){ if (optionSelected == 2){ querySelector(); }else{ dataManagement();} }

    public static void dataManagement(){
        spazio();
        System.out.print(dataManagementString);
        switch (new Scanner(System.in).nextInt()){
            case 1: log_pilot(); break;
            case 2: register_pilot(); break;
            case 3: log_producer(); break;
            case 4: register_producer(); break;
            case 5: log_director(); break;
            case 6: register_director(); break;
            default: spazio(); return;
        }
    }

    public static void querySelector(){
        spazio();
        System.out.print(querySelectorString);
        switch (new Scanner(System.in).nextInt()){
            case 1: query1(); break;
            case 2: query2(); break;
            case 3: query3(); break;
            case 4: query4(); break;
            case 5: query5(); break;
            case 6: query6(); break;
            case 7: query7(); break;
            case 8: query8(); break;
            case 9: query9(); break;
            case 10: query10(); break;
            case 11: query11(); break;
            case 12: query12(); break;
            case 13: query13(); break;
            case 14: query14(); break;
            case 15: query15(); break;
            default : spazio(); return;
        }
    }


    public static void main(String[] args) {
        startConnection();
        while(true){
            System.out.println(line+"\n\tBenvenuto su Fly Competition\n");
            System.out.println(menuDisplay);
            Scanner userInput = new Scanner(System.in);
            System.out.print(inputText);
            menu(userInput.nextInt());
        }
    }

}
