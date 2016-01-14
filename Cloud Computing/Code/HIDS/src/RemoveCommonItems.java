//To find common/startup process in systems--->Using this we can remove common items n look for malicious activities in other

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class RemoveCommonItems 
{
    public static void main(String[] args) 
    {     
        BufferedWriter bw = null;
	BufferedReader br = null;
        BufferedReader br1 = null;
	try 
        {
            File fileDir1 = new File("C:\\Users\\abc\\Desktop\\feature.txt");
            File fileDirOut = new File("C:\\Users\\abc\\Desktop\\list(3).txt");
            br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDir1)));
            bw= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDirOut,true)));
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        String line=null, line1=null;
        Set<String> set = new HashSet<String>();
        int count=0;
        try 
        {   
            while(((line = br.readLine()) != null))
            {
                line=line.trim().toLowerCase();
                //System.out.println("Line_out: "+line);
                br1= new BufferedReader(new InputStreamReader(new FileInputStream(new File("C:\\Users\\abc\\Desktop\\feature(1).txt"))));
                while(((line1 = br1.readLine()) != null))
                {                    
                    line1=line1.trim().toLowerCase();
                    //System.out.println(line1+"--"+line);
                    count++;
                    if(line1.equals(line))
                    {
                        System.out.println("Line: "+line);
                        set.add(line);
                    }
                }
            }
            Iterator iterator = set.iterator();
            while(iterator.hasNext())
            {
                bw.write((String)iterator.next());
                bw.newLine();
                bw.flush();                
            }
            System.out.println("Count: "+count);
            bw.close();
            br.close();
        }
        catch (Exception e) 
        {
            System.out.println("Exception:" + e );
        }		
    }
}