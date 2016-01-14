//Run 1
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

public class Amusement 
{
    public static void main(String[] args) 
    {
        int r_n;
        double r_x, r_y;
        int count=0;
        BufferedReader br = null,br1 = null;
        BufferedWriter bw = null;
        String line=null,paste=null;
		
        try 
        {
            File fileDirin = new File("C:\\Users\\abc\\Desktop\\Data Mining\\Rideno;x_loc;y_loc.txt");
            File fileDirin1 = new File("C:\\Users\\abc\\Desktop\\Data Mining\\complaint_no;Ride_no.txt");
            File fileDirOut = new File("C:\\Users\\abc\\Desktop\\Data Mining\\graph.txt");
            try 
            {
                    br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDirin), "UTF8"));                    
                    br1= new BufferedReader(new InputStreamReader(new FileInputStream(fileDirin1), "UTF8"));                                       
                    bw= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDirOut,true), "UTF8"));
            } 
            catch (UnsupportedEncodingException e) 
            {
                    e.printStackTrace();
            }
	} 
        catch (FileNotFoundException e) 
        {
            e.printStackTrace();
        }	
        
        try 
        {    
            //Operation on: Ride File
            while(((line= br.readLine()) != null))
            {         	
            	String[] uParts = line.split(";");
                r_n=Integer.parseInt(uParts[0].trim());
                r_x=Double.parseDouble(uParts[1].trim());
                r_y=Double.parseDouble(uParts[2].trim());
                paste=r_x+";"+r_y;
		bw.write(paste);
                bw.newLine();
                count++;
            }
            int var=-1;
            //Operation on: Complaint File
            while(((line= br1.readLine()) != null))
            {         	
            	String[] uParts = line.split(";");
                r_n=Integer.parseInt(uParts[0].trim());
                r_x=Double.parseDouble(uParts[1].trim());
                r_y=Double.parseDouble(uParts[2].trim());
                r_x=r_x+(Math.random()*var);
                r_y=r_y+(Math.random()*var);
                paste=r_x+";"+r_y;
                var*=-1;
		bw.write(paste);
                bw.newLine();
                count++;
            }
            br.close();
            br1.close();
            bw.close();
        }
        catch (Exception e) 
        {
            System.out.println("Exception:" + e );
        }
        
        System.out.println("Count: "+count);
    }    
}
