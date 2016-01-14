
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;


public class Cluster 
{
    public static void main(String[] args) 
    {
        int rides_count=12;
        double[] r_x=new double[rides_count];
        double[] r_y=new double[rides_count];
        double dist,val;
        int count=0,r=0;
        double gr_x, gr_y;
        BufferedReader br = null;
        BufferedReader br1 = null;
        String line=null;
        String[] cluster=new String[rides_count];
        for(int i=0;i<rides_count; i++)
            cluster[i]="";
	//List cluster[rides_count]= new ArrayList();
        try 
        {
            File fileDirin = new File("C:\\Users\\abc\\Desktop\\Data Mining\\graph.txt");
            File fileDirin1 = new File("C:\\Users\\abc\\Desktop\\Data Mining\\Rideno;x_loc;y_loc.txt");
            try 
            {
                    br= new BufferedReader(new InputStreamReader(new FileInputStream(fileDirin), "UTF8"));        
                    br1= new BufferedReader(new InputStreamReader(new FileInputStream(fileDirin1), "UTF8"));        
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
        {    count=0;
            //Operation on: Ride File
            while(((line= br1.readLine()) != null))
            {     
            	String[] uParts = line.split(";");
                r_x[count]=Double.parseDouble(uParts[1].trim());
                r_y[count]=Double.parseDouble(uParts[2].trim());
                count++;
            }   	            
            //Operation on: Graph File
            while(((line= br.readLine()) != null))
            {        
                val=0;
                dist=10000;
            	String[] uParts = line.split(";");
                gr_x=Double.parseDouble(uParts[0].trim());
                gr_y=Double.parseDouble(uParts[1].trim());
                for(int i=0; i<rides_count; i++)
                {
                    val=Math.sqrt(Math.pow((r_x[i]-gr_x),2)+Math.pow((r_y[i]-gr_y),2));
                    System.out.println("val: "+val+", dist: "+dist);
                    if(val<dist)
                    {
                        dist=val;
                        r=i;
                    }     
                }
                cluster[r]+="R";
            }
            
            br.close();
            br1.close();
        }
        catch (Exception e) 
        {
            System.out.println("Exception:" + e );
        }
        for(int i=0; i<rides_count; i++)
            System.out.println("Cluster["+i+"]: "+cluster[i]);
        System.out.println("Count: "+count);

    }
}
