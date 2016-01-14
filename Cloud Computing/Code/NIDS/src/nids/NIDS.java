/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nids;
import com.gsbanalyzer.GSBAnalyzer;
import com.gsbanalyzer.gsb.models.GSBInfectedUrl;
import com.gsbcrawler.GSBCrawler;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;


public class NIDS {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        // TODO code application logic here
        /*key= ABQIAAAA_1cEGJUqVcMNlrQImNjdMxSztxuA-keoR3hW0vj51akthlWaZQ */
        String line;
    String eline;
         try
  {
    BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\SONY\\Desktop\\abc.txt"));
  
        
        GSBCrawler gsbCrawler = new GSBCrawler("ABQIAAAA_1cEGJUqVcMNlrQImNjdMxSztxuA-keoR3hW0vj51akthlWaZQ", "", "YOUR_PATH", "jdbc:mysql://localhost/gsb", "root", "nishtha");
        int timeToWait = gsbCrawler.updateDB();
        System.out.println(timeToWait+" to wait before next update");
        
       // List<String> domainsToCheck = new ArrayList<String>();
        //domainsToCheck.add("bbnp.com");
        
        while ((line = reader.readLine()) != null)
    {
    //System.out.println(line);
      String delims = "[/]+";
      String[] tokens = line.split(delims);
      if((tokens.length)>1)
      {
      eline=tokens[1];
      delims= "[.]+";
      String list2[]= eline.split(delims,2);
      if (list2.length>1)
      {
      eline=list2[1];
      //System.out.println(eline);
      List<String> domainsToCheck = new ArrayList<String>();
      domainsToCheck.add(eline);
      //System.out.println(eline+"\n");
        GSBAnalyzer gsbWrapper = new GSBAnalyzer("ABQIAAAA_1cEGJUqVcMNlrQImNjdMxSztxuA-keoR3hW0vj51akthlWaZQ","http://safebrowsing.clients.google.com/safebrowsing","", "jdbc:mysql://localhost/gsb","root","nishtha");
        List<GSBInfectedUrl> gsbDirtyDomains = gsbWrapper.analyzeWithGSB(domainsToCheck);
        for(GSBInfectedUrl gsbDirtyDomain : gsbDirtyDomains){
            System.out.println(gsbDirtyDomain);
        }
      }}
     
      //for (int i = 0; i < tokens.length; i++)
    //  System.out.println(tokens[i]+"\n");
     //System.out.println(line+"\n"+"$$$$$$");
    }
        
        
        
      
  }
          catch (Exception e)
  {
    System.err.format("Exception occurred trying to read");
    e.printStackTrace();
  }   
  }
    
}
