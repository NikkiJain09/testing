//To check for the memory utilisation of a process
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;


public class MemoryUsage 
{
    public static void main(String[] args) 
    {
	BufferedReader br = null;
        BufferedWriter bw=null;
        File fileDir1 = new File("C:\\Users\\abc\\Desktop\\cloud\\status_nr.txt");
        File fileDir2 = new File("C:\\Users\\abc\\Desktop\\cloud\\memory.txt");
	try 
        {
            br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDir1)));
            bw= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDir2,true)));
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
        int sum=0;
        
        try 
        {   
            line=br.readLine();
            line=br.readLine();
            line=br.readLine();
            line=br.readLine(); //Currently removing System Idle Process
            while(((line = br.readLine()) != null))
            {
                line=line.toLowerCase();
                String[] Parts = line.split("\\s+");               
                Parts[4]=Parts[4].replaceAll(",", "");
                Parts[4]=Parts[4].trim();
                
                sum+=Double.parseDouble(Parts[4]);
                System.out.println(sum);
            }
            System.out.println("Final Sum: "+sum);
            br.close();
        }
        catch (Exception e) 
        {
            System.out.println("Exception:" + e );
        }
        //Process Taking x% of Memory
        try 
        {
            br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDir1)));
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
        line=null;
        double process=0;
        try 
        {   
            line=br.readLine();
            line=br.readLine();
            line=br.readLine();
            line=br.readLine(); //Currently removing System Idle Process
            while(((line = br.readLine()) != null))
            {
                line=line.toLowerCase();
                String[] Parts = line.split("\\s+");               
                Parts[4]=Parts[4].replaceAll(",", "");
                Parts[4]=Parts[4].trim();
                process=Double.parseDouble(Parts[4]);  //Packets Sent
                bw.write("Process Name: "+Parts[0]+", Process Id: "+Parts[1]+", Memory used: "+process);
                bw.newLine();
                bw.flush();
                if((process/sum)>=0.2)
                    System.out.println("Process: "+Parts[0]+" is taking more than 20% of Memory Resource, Kill the process if its not you!");
            }
            //System.out.println("Final Sum: "+sum);
            br.close();
            bw.close();
        }
        catch (Exception e) 
        {
            System.out.println("Exception:" + e );
        }
    }
}
