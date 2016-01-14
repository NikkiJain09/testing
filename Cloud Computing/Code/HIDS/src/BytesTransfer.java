//To check for the bytes sent in the interval of 10minutes, if the no of packets sent increased by 3 times, then report
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;


public class BytesTransfer 
{
    public static void main(String[] args) 
    {
        BufferedReader br = null;
        BufferedReader br1 = null;
        BufferedWriter bw=null;
        String line=null;
        int count=1;
        File fileDirin = new File("C:\\Users\\abc\\Desktop\\cloud\\bytes_transfer.txt"); 
        File fileDirin1 = new File("C:\\Users\\abc\\Desktop\\cloud\\bytes_transfer_prev.txt"); 
        File fileDirout = new File("C:\\Users\\abc\\Desktop\\cloud\\bytes_transfer_prev.txt"); 
       while(true)
       {
        String cmd, cmd1;
        cmd = "cscript \"C:\\Users\\abc\\Documents\\NetBeansProjects\\Random\\hide.vbs\"";
        Runtime r = Runtime.getRuntime();
        Process p;
            try {
                p = r.exec(cmd);
                while(p.isAlive());
            } catch (IOException ex) {
                Logger.getLogger(BytesTransfer.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        try
        {
            bw= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDirout,true))); //No appending is required
            br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDirin)));
            br1= new BufferedReader(new InputStreamReader(new FileInputStream(fileDirin1)));
        }
        catch(FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        double val=0, val_prev=0;
        try
        {
            if(((line=br1.readLine())!=null))
            {
                val_prev=Double.parseDouble(line);
                br1.close();
            }
            else
            {
                bw.write("0");
                bw.newLine();
                bw.flush();
            }
            line = br.readLine();
            line = br.readLine();
            line = br.readLine();
            line = br.readLine();
            line = br.readLine();
            line = br.readLine();
            if(((line = br.readLine())!=null))
            {
                String[] Parts = line.split("\\s+");     
                Parts[2]=Parts[2].trim();
                //val=Double.parseDouble(Parts[1]);   //Packets received
                val=Double.parseDouble(Parts[2]);  //Packets Sent
                System.out.println("Val: "+val);
                count++;
                if(count!=1)
                {
                    try
                    {
                        if((val/val_prev)>=1.1) //RESEARCH PART
                        {
                            cmd1="wscript \"C:\\Users\\abc\\Documents\\NetBeansProjects\\Random\\notify.vbs\"";
                            Runtime rt = Runtime.getRuntime();
                            Process pr = rt.exec(cmd1);
                            while(pr.isAlive());
                            //System.out.println("There may be an attack going on");
                        }
                    }
                    catch(ArithmeticException e)
                    {
                        System.out.println("Exception Caught: "+e);
                    }
                }
                System.out.println("Prev val: "+val_prev);
                //bw= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDirout,false))); //No appending is required
                PrintWriter pw = new PrintWriter(fileDirin1);
                pw.print("");
                pw.close();
                bw.write(""+val);
                bw.newLine();
                bw.flush();
                bw.close();
            }
            br.close();
        }
        catch(IndexOutOfBoundsException e)
        {
            e.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }   } 
}
