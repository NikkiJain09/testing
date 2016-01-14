//Just a program to read and write files
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class Monitor 
{
    public static void main(String[] args) 
    {     
        BufferedWriter bw = null;
	BufferedReader br = null;
	try 
        {
            File fileDir1 = new File("C:\\Users\\abc\\Desktop\\list.txt");
            File fileDirOut = new File("C:\\Users\\abc\\Desktop\\list(1).txt");
            br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDir1)));
            bw= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDirOut,true)));
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        String line=null;
        try 
        {        
            int count=1;
            while(((line = br.readLine()) != null))
            {
                line = br.readLine();
                System.out.println("Line: "+count+":    "+line);
                count++;
                bw.write(line);
                bw.newLine();
                bw.flush();
            }
            bw.close();
            br.close();
        }
        catch (Exception e) 
        {
            System.out.println("Exception:" + e );
        }		
    }
}