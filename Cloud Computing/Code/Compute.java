import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.ExecutionException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Compute 
{
    public static void main(String[] args) throws InterruptedException 
    {
        BufferedReader br = null;
        FileWriter bw1=null;
        String line=null;
        int count=0, sum=0, av=0, avprev=0;
        int flag=0;
        String cmd;
        cmd="cscript \"E:\\Java_Programs\\compute\\bgrunner.vbs\"";
        while(true)
        {      
            count=0;
            try
            {
                Runtime r = Runtime.getRuntime();
                Process p = r.exec(cmd);
                while(p.isAlive());
                File fileDirin = new File("E:\\Java_Programs\\compute\\output.txt"); 
                try
                {
                    br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDirin), "UTF8"));
                }
                catch (UnsupportedEncodingException e) 
                {
                    e.printStackTrace();
                }
                catch (IOException ex)
                {
                    Logger.getLogger(Compute.class.getName()).log(Level.SEVERE, null, ex);
                }	
        
            try 
            {
                while(((line= br.readLine()) != null))
                {     
                    av+=Integer.parseInt(line.trim());
                    count++;
                }   	            
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            try
            {
                br.close();
                sum=av;
                av=av/count;
                line=""+av;
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
//          System.out.print(sum);
//          System.out.print("       "+count);
//          System.out.println("           Average: "+av);
            }
            catch(IOException e)
            {     
                System.err.println("Error loading script : "+e.toString());
            }
            if(flag==0)
            {
                avprev = av;
                flag++;
            }
            else
            {
                try
                {
                    avprev+=1;
                    if(av>avprev)
                    {
                        String cmd1;
                        cmd1="wscript \"E:\\Java_Programs\\compute\\notify.vbs\"";
                        Runtime rt = Runtime.getRuntime();
                        Process pr = rt.exec(cmd1);
                        while(pr.isAlive());
                    }
                }
                catch(IOException e)
                {     
                    System.err.println("Error loading script : "+e.toString());
                }
            }
        }
    }
}