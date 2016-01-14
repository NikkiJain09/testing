
package edit_distance;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

public class Abreviation 
{
    public static void main(String[] args) 
    {
        String english=null, hindi=null,line;
        String parts[];
        ///////////////////////////////
        try 
        {
            String fileName = "C:\\Users\\abc\\Desktop\\y\\ab.txt";
            BufferedReader in = new BufferedReader(new FileReader(fileName), 8192);
            BufferedWriter bw1 = null;
            File fileDirOut = new File("C:\\Users\\abc\\Desktop\\y\\ab(1).txt");
            bw1= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDirOut,true), "UTF8"));
            while (((line = in.readLine()) != null))
            {
                parts=line.split("--");
                hindi=parts[0].trim();
                english=parts[1].trim();
                if((hindi.length()==0)||(english.length()==0))
                    continue;
                english=english.toLowerCase();                
                String temp="";
                Character ch;    
                for(int i=0; i<hindi.length();i++)
                {
                    ch=hindi.charAt(i);
                    if((ch>=2300)&&(ch<=2500))
                        temp+=hindi.charAt(i);
                }
                hindi=temp;
                temp="";
                for(int i=0; i<english.length();i++)
                {
                    ch=english.charAt(i);
                    if((ch>='a')&&(ch<='z'))
                        temp+=english.charAt(i);
                }
                english=temp;

            //System.out.println("Hindi: "+hindi+", L: "+hindi.length());
            //System.out.println("English: "+english+", L: "+english.length());
            ///////////////////////////////

                HashMap<Character, String> hm=new HashMap<Character, String>();  
                hm.put('a',"ए");
                hm.put('b',"बी");
                hm.put('c',"सी");
                hm.put('d',"डी");
                hm.put('e',"ई");
                hm.put('f',"एफ");
                hm.put('g',"जी");
                hm.put('h',"एच");
                hm.put('i',"आई");
                hm.put('j',"जे");
                hm.put('k',"के");
                hm.put('l',"एल");
                hm.put('m',"एम");
                hm.put('n',"एन");
                hm.put('o',"ओ");
                hm.put('p',"पी");
                hm.put('q',"क्यू");
                hm.put('r',"आर");
                hm.put('s',"एस");
                hm.put('t',"टी");
                hm.put('u',"यू");
                hm.put('v',"वी");
                hm.put('w',"डब्लू");
                hm.put('x',"एक्स");
                hm.put('y',"वाई");
                hm.put('z',"जेड");
                String tp="!";
                Character s;
                for(int d=0; d<english.length(); d++)
                {
                    s=english.charAt(d);
                    tp+=hm.get(s);
                }
                tp=tp.substring(1);

                System.out.println("New string: "+tp);
                System.out.println("eng: "+english);
                System.out.println("hindi: "+hindi);
                if(hindi.equals(tp))
                {
                    System.out.println("Match");
                    bw1.write(hindi+"--"+english+"##1");
                    bw1.write(";;;"); 
                }
                else
                {
                    //System.out.println("Not Match");
                   // bw1.write(hindi+"--"+english+"##0");
                   // bw1.write(";;;"); 
                }
            }
            bw1.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}