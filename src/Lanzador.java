import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Lanzador {
	
    public static void main(String[] args) {
       
        try{
            parser parser_obj = new parser(new analex(new FileReader(args[0])));
            try{
                parser_obj.parse();
            } catch(Exception e) {
                e.printStackTrace();
            }
            finally{
                System.out.println("Analisis sintactico finalizado.");
            }
        } catch(FileNotFoundException ex) {
                Logger.getLogger(Lanzador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
