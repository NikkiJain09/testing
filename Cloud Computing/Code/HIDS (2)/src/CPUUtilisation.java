//To check Attack through CPU Utilisation
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;


public class CPUUtilisation 
{
    public static void main(String[] args) 
    {
        BufferedReader br = null;
        BufferedWriter bw=null;
        String line=null;
        int count=1;
        String cmd;
        String cmd1;
        cmd = "cscript \"C:\\Users\\abc\\Documents\\NetBeansProjects\\HIDS\\bgrunner.vbs\"";
        File fileDirin = new File("C:\\Users\\abc\\Desktop\\cloud\\cpuutil.txt"); 
        File fileDirout = new File("C:\\Users\\abc\\Desktop\\cloud\\cpu_outputi3.txt");
        try
        {
            br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDirin)));
            bw= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDirout,true)));
        }
        catch(FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        double average=0, val=0, average_prev=0;
        boolean flag=false;
        int time=0;
        try
        {
            line = br.readLine();
            line = br.readLine();
            line = br.readLine();
            line = br.readLine();
            while(((line = br.readLine()) != null))
            {
                line=line.toLowerCase();
                if((line.charAt(0)=='"') &&(line.charAt(0)!='\n') )
                {
                    String[] Parts = line.split(",");               
                    Parts[1]=Parts[1].substring(1,Parts[1].length()-1);
                    val=Double.parseDouble(Parts[1]);
                    count++;
                    System.out.println(Parts[1]);
                    if(count<10)
                           val+=val;
                    else
                    {
                        average=val/(count-1);
                        if(flag)
                        {
                            //taking deviation of 6 factor for infected PC
                            if(Math.abs(average/average_prev)>=6)//if(average>=(average_prev*0.8))
                            {
                                time++;
                                if(time>2)
                                {
                                    cmd1="wscript \"C:\\Users\\abc\\Documents\\NetBeansProjects\\HIDS\\notify.vbs\"";
                                    Runtime rt = Runtime.getRuntime();
                                    Process pr = rt.exec(cmd1);
                                    while(pr.isAlive());
                                }
                            }
                        }
                        count=0;
                    }
                }
                flag=true;
                average_prev=average;
            }
        }
        catch(IndexOutOfBoundsException e)
        {
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
