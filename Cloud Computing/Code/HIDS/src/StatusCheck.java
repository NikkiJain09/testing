//to check Not Responding status of processes, if they are more than 2, then report to user
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/*
 *Checking for the Status: Not responding, if the count is more than 4, then report
 */

public class StatusCheck 
{
    public static void main(String[] args) 
    {
	BufferedReader br = null;
	try 
        {
            File fileDir1 = new File("C:\\Users\\abc\\Desktop\\cloud\\status_nr.txt");
            br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDir1)));
            //bw= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDirOut,true)));
        } 
        catch (FileNotFoundException ex) 
        {
            System.out.println("Sorry, File Not Found!!");
            ex.printStackTrace();
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        String line=null;
        int count=0;
        try 
        {   
            //String[] parts=new String[9];
            line=br.readLine();
            line=br.readLine();
            line=br.readLine();
            line=br.readLine(); //Currently removing System Idle Process
            while(((line = br.readLine()) != null))
            {
                line=line.toLowerCase();
                String[] Parts = line.split("\\s+");               
                //System.out.println(line);
                //System.out.println(Parts[6]);
                if(Parts[6].equals("not"))
                {
                    count++;
                }
            }
            if(count>2)
                System.out.println("Your System May be Under Attack!!");
            System.out.println("Count: "+count);
            //bw.close();
            //br.close();
        }
        catch (Exception e) 
        {
            System.out.println("Exception:" + e );
        }		
    }
}