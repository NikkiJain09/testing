/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nish;

import java.io.BufferedReader;
import java.io.FileReader;

public class Parsing {

    public static void main(String ... args)
    {
       try
  {
    BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\SONY\\Desktop\\abc.txt"));
    char text[]= new char[50];
    String line;
    String eline;
    while ((line = reader.readLine()) != null)
    {
      String delims = "[/]+";
      String[] tokens = line.split(delims);
      eline=tokens[1];
      delims= "[.]+";
      String list2[]= eline.split(delims,2);
      eline=list2[1];
      System.out.println(eline);
      
      //for (int i = 0; i < tokens.length; i++)
    //  System.out.println(tokens[i]+"\n");
      //System.out.println(line+"\n");
      break;
    }
    reader.close();
  }
  catch (Exception e)
  {
    System.err.format("Exception occurred trying to read");
    e.printStackTrace();
  } 
    }
}
