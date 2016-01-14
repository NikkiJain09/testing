package edit_distance;

import java.io.*;
import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

public class usingFourMainclass 
{
    public static int[][] fill_table(String x, String y)
    {
        int i,j,k;
        int[][] t= new int[x.length()+1][y.length()+1];
        System.out.println(x+" (x)L: "+x.length()+", "+y+" (y)L: "+y.length());
        for(i=0; i<x.length()+1; i++)
		t[i][0]=i;
	for(k=0; k<y.length()+1; k++)
		t[0][k]=k;
	for(i=1; i<x.length()+1; i++)	
            for(j=1; j<y.length()+1; j++)
		t[i][j]= Math.min(t[i-1][j]+1, t[i][j-1]+1);	
        
      /*  
        for(i=0; i<x.length()+1; i++)	
        {
            for(j=0; j<y.length()+1; j++)
		System.out.print(t[i][j]+" ");
            System.out.print("\n");
        }
        */    
        return t;
    }
    public static int edit_distance(String x, String y) 
    {     
        int table[][];
        System.out.println("from ed: "+x+" (x)L: "+x.length()+", "+y+" (y)L: "+y.length());
        //Populating the table...considering cost of [insertion=deletion=1]
        table=fill_table(x,y);
	System.out.println("\n\nEdit Distance: "+table[x.length()][y.length()]);
        return (table[x.length()][y.length()]);
    }    
    
    public static int boundary_checker(String hien, String en)
    {
        int c1=0,c2=0;        
        if((en.length()!=0)&&(hien.length()!=0))
        {
            Character en_f=en.charAt(0), en_e=en.charAt(en.length()-1),hien_f=hien.charAt(0), hien_e=hien.charAt(hien.length()-1),a=null;

            if((en_f.compareTo('a')==0) || (en_f.compareTo('e')==0) || (en_f.compareTo('i')==0) || (en_f.compareTo('o')==0) || (en_f.compareTo('u')==0))
                c1=1;

            if((hien_f.compareTo('अ')==0) || (hien_f.compareTo('आ')==0) || (hien_f.compareTo('ा')==0) || (hien_f.compareTo('इ')==0) || ((hien_f.compareTo('ि'))==0) || (hien_f.compareTo('ई')==0) || ((hien_f.compareTo('ी'))==0) || (hien_f.compareTo('उ')==0)|| (hien_f.compareTo('ु')==0)|| (hien_f.compareTo('ऊ')==0)|| (hien_f.compareTo('ू')==0)|| (hien_f.compareTo('ए')==0)|| ((hien_f.compareTo('े'))==0) || (hien_f.compareTo('ऐ')==0)|| (hien_f.compareTo('ै')==0)|| (hien_f.compareTo('ओ')==0)|| (hien_f.compareTo('ो')==0)|| (hien_f.compareTo('औ')==0) || (hien_f.compareTo('ौ')==0) ||(hien_f.compareTo('ऑ')==0))
                c2=1;   
            if(c1!=c2)
            {
                if(en.length()>1)
                    a=en.charAt(1);
                if(((en_f.compareTo('h')==0))&&(a.compareTo('o')==0))
                {   /*Eg. honest*/  }
                else   
                    return 0;
            }

            c1=c2=0;
            if((en_e.compareTo('a')==0) || (en_e.compareTo('e')==0) ||(en_e.compareTo('i')==0) || (en_e.compareTo('o')==0) || (en_e.compareTo('u')==0)|| (en_e.compareTo('y')==0))    
                c1=1;
            if((hien_e.compareTo('अ')==0) || (hien_e.compareTo('आ')==0) || (hien_e.compareTo('ा')==0) ||(hien_e.compareTo('इ')==0) || ((hien_e.compareTo('ि'))==0) || (hien_e.compareTo('ई')==0) || ((hien_e.compareTo('ी'))==0) || (hien_e.compareTo('उ')==0)|| (hien_e.compareTo('ु')==0) || (hien_e.compareTo('ऊ')==0)|| (hien_e.compareTo('ू')==0) || (hien_e.compareTo('ए')==0) || (hien_e.compareTo('े')==0) || (hien_e.compareTo('ऐ')==0)|| (hien_e.compareTo('ै')==0)|| (hien_e.compareTo('ओ')==0)|| (hien_e.compareTo('ो')==0)|| (hien_e.compareTo('औ')==0) || (hien_e.compareTo('ौ')==0)|| (hien_e.compareTo('ं')==0) || (hien_e.compareTo('ः')==0) ||(hien_e.compareTo('ऑ')==0))     
                c2=1;
            if(c1!=c2)
            {
                if(((c2==0)&&(en_e.compareTo('e')==0))|| ((c2==0)&&(en_e.compareTo('a')==0)) ||((c1==0)&&(hien_e.compareTo('ं')==0)))
                    return 1;
                else
                    return 0;
            }
            return 1;
        }
        else
            return -1;
    }
    public static String remove_vowels(String x)
    {
        int len=x.length();
        Character ch;
        String s="";
        for(int i=0; i<len; i++)
        {
            ch=x.charAt(i);
            if((ch.compareTo('a')==0)||(ch.compareTo('e')==0)||(ch.compareTo('i')==0)||(ch.compareTo('o')==0)||(ch.compareTo('u')==0)||(ch.compareTo('अ')==0)||(ch.compareTo('आ')==0)||(ch.compareTo('इ')==0)||(ch.compareTo('ई')==0)||(ch.compareTo('उ')==0)||(ch.compareTo('ऊ')==0)||(ch.compareTo('ए')==0)||(ch.compareTo('ऐ')==0)||(ch.compareTo('ओ')==0)||(ch.compareTo('औ')==0) || (ch.compareTo('ा')==0)|| (ch.compareTo('ि')==0)|| (ch.compareTo('ी')==0)||(ch.compareTo('ु')==0)|| (ch.compareTo('ू')==0)|| (ch.compareTo('े')==0)|| (ch.compareTo('ै')==0)|| (ch.compareTo('ो')==0)|| (ch.compareTo('ौ')==0)||(ch.compareTo('्')==0) ||(ch.compareTo('ॉ')==0) || (ch.compareTo('ऑ')==0))
            {}    
            else
                s+=x.charAt(i);
        }
        return s;
    }
    public static HashSet replacement(String u,String org, String orge)
    {      	
        Character ch,x,c='$';
        String str=u,tr;
        HashSet<String> hs = new HashSet<String>();
        hs.add(u);
        List<String> list = new CopyOnWriteArrayList<String>();
	//list.add(u);
        int index=0;
        System.out.println("Hi1");
        System.out.println("u: "+u+", org: "+org+", orge: "+orge);
        while(index<(org.length()-2))
        {
            c=org.charAt(index);
            if(c.equals('श'))//श्र
            {
                x=org.charAt(index+1);
                if(x.equals('्'))
                {
                    x=org.charAt(index+2);
                    if(org.equals('र'))
                    {
                        tr=((org.substring(0, index))+"%"+(org.substring(index+3)));
                        //tr=remove_vowels(tr.replace("%","s"));
                        org=tr.replace("%","s");
                        list.add(org);
                    }
                }
            }           
            if(c.equals('ज'))//ज्ञ
            {
                x=org.charAt(index+1);
                if(x.equals('्'))
                {
                    x=org.charAt(index+2);
                    if(x.equals('ञ'))
                    {
                        tr=((org.substring(0, index))+"%"+(org.substring(index+3)));
                        //tr=remove_vowels(tr);
                        list.add(tr.replace("%","j"));
                        list.add(tr.replace("%","gy"));
                        list.add(tr.replace("%","gny"));
                        org=tr.replace("%","g");    //Assuming that max time ज्ञ is represnetd as 'g'
                        list.add(org);
                    }
                }
            }
            if(c.equals('त'))//त्र
            {
                x=org.charAt(index+1);
                if(x.equals('्'))
                {
                    x=org.charAt(index+2);
                    if(x.equals('र'))
                    {
                        tr=((org.substring(0, index))+"%"+(org.substring(index+3)));
                        //tr=remove_vowels(tr);
                        list.add(tr.replace("%","t"));
                        org=tr.replace("%","tr");    //Assuming that max time त्र is represnetd as 'tr'
                        list.add(org);
                    }
                }
            }
            if(c.equals('क'))
            {
                x=org.charAt(index+1);
                if(x.equals('्'))   //  टैक्सी   क 
                {
                    x=org.charAt(index+2);
                    if(x.equals('ष'))//क्ष
                    {
                        tr=((org.substring(0, index))+"%"+(org.substring(index+3)));
                        //tr=remove_vowels(tr);
                        list.add(tr.replace("%","s"));
                        org=tr.replace("%","ksh");    //Assuming that max time क्ष is represnetd as 'ksh'
                        list.add(org);
                    }
                    if(x.equals('स'))//x
                    {
                        tr=org.substring(0, index)+"%"+org.substring(index+3);
                        //tr=remove_vowels(tr.replace("%","x"));
                        org=tr.replace("%","x");
                        list.add(org);    
                    }
                }
            }
            index++;
        }   
        while(index<(org.length()-1))
        {
            c=org.charAt(index);
            if(c.equals('ल'))
            {
                x=org.charAt(index+1);
                if(x.equals('ी'))
                {
                    list.add(remove_vowels(org.replace("ली","lh")));    
                }
            }
            index++;
        }
        list.add(remove_vowels(org));    
        list.add(remove_vowels(org.replaceFirst("ी","y")));    
        list.add(remove_vowels(org.replaceFirst("ि","y")));
        org=remove_vowels(org);
        if(list.isEmpty())
        {
            list.add(u);
        }
                System.out.println("Hi3");
        Character temp1='9';
        for(int i=0; i<u.length(); i++)
        {
                                        System.out.println("Hi55");
            ch=u.charAt(i);
            try
            {
                for(Object o : list)
                {   
                                                System.out.println("Hi66");
                                                System.out.println("str: "+str);
                        System.out.println("list size: "+list.size());
                    str= (String)o;  
                    if(ch.equals('़'))
                    {
                        list.add(str.replaceFirst("़",""));
                    }
                    if(ch.equals('ं'))
                    {
                      //मंखतरनकःकंगरस    मंखतरनकःकंगरस
                        System.out.println("1");
                        list.add(str.replaceFirst("ं","n"));
                        list.add(str.replaceFirst("ं","m"));
                        list.add(str.replaceFirst("ं",""));
                    }
                    if(ch.equals('ँ'))
                    {
                        list.add(str.replaceFirst("ँ","n"));
                        list.add(str.replaceFirst("ँ","m"));
                    }
                    if(ch.equals('ः'))
                    {
                        System.out.println("2");
                        list.add(str.replaceFirst("ः",""));
                        list.add(str.replaceFirst("ः","s"));
                        list.add(str.replaceFirst("ः","r"));
                    }
                    if(ch.equals('क'))
                    {
                        System.out.println("3");
                        list.add(str.replaceFirst("क","k"));                                                        
                        list.add(str.replaceFirst("क","q"));                                
                        list.add(str.replaceFirst("क","c"));
                        list.add(str.replaceFirst("क","ck"));
                        list.add(str.replaceFirst("क","kh"));
                        list.add(str.replaceFirst("क","ch"));
                    }
                    if(ch.equals('ख'))
                    {
                        System.out.println("4");
                        list.add(str.replaceFirst("ख","k"));                                        
                        list.add(str.replaceFirst("ख","kh"));                                        
                    }
                    if(ch.equals('ग'))
                    {
                        list.add(str.replaceFirst("ग","g"));                                                                       
                        list.add(str.replaceFirst("ग","gh"));
                    }
                    if(ch.equals('घ'))        
                    {
                        System.out.println("6");
                        list.add(str.replaceFirst("घ","g")); 
                        list.add(str.replaceFirst("घ","gh")); 
                    }
                    if(ch.equals('ङ'))
                    {
                        list.add(str.replaceFirst("ङ","g"));
                        list.add(str.replaceFirst("ङ","ng"));
                    }
                    if(ch.equals('च'))
                    {
                        list.add(str.replaceFirst("च","c"));
                        list.add(str.replaceFirst("च","ch"));
                    }
                    if(ch.equals('छ'))              
                    {
                        list.add(str.replaceFirst("छ","c")); 
                        list.add(str.replaceFirst("छ","ch"));                                                    
                        list.add(str.replaceFirst("छ","chh"));                                                    
                    }
                    if(ch.equals('ज'))             
                    {
                        if(i<(u.length()-2))
                        {
                            temp1=u.charAt(i+1);
                            if(temp1.equals('़'))
                            {
                                ch='ज़';
                                str=str.replaceFirst("ज"+"़","ज़");
                            }
                            else
                            {
                                list.add(str.replaceFirst("ज","j"));                        
                                list.add(str.replaceFirst("ज","g"));                        
                                list.add(str.replaceFirst("ज","z"));
                                list.add(str.replaceFirst("ज","s"));                        
                                list.add(str.replaceFirst("ज","jh"));
                            }
                        }
                        else
                        {
                            list.add(str.replaceFirst("ज","j"));                        
                            list.add(str.replaceFirst("ज","g"));                        
                            list.add(str.replaceFirst("ज","z"));
                            list.add(str.replaceFirst("ज","s"));                        
                            list.add(str.replaceFirst("ज","jh"));
                        }
                    }
                    if(ch.equals('झ'))
                    {                           
                        list.add(str.replaceFirst("झ","j"));                        
                        list.add(str.replaceFirst("झ","s"));                        
                        list.add(str.replaceFirst("झ","z"));                        
                        list.add(str.replaceFirst("झ","jh"));                        
                    }
                    if(ch.equals('ञ'))
                    {
                        list.add(str.replaceFirst("ञ","j"));                                                
                        list.add(str.replaceFirst("ञ","nj"));                                                
                    }
                    if(ch.equals('ट'))
                    {
                        list.add(str.replaceFirst("ट","t"));                                                                       
                        list.add(str.replaceFirst("ट","th"));                                                                       
                    }
                    if(ch.equals('ठ'))
                    {
                        list.add(str.replaceFirst("ठ","t"));
                        list.add(str.replaceFirst("ठ","th"));
                    }
                    if(ch.equals('ड'))
                    {
                        if(i<(u.length()-2))
                        {
                            temp1=u.charAt(i+1);
                            if(temp1.equals('़'))
                            {
                                ch='ड़';         
                                str=str.replaceFirst("ड"+"़","ड़");
                            }
                            else
                                list.add(str.replaceFirst("ड","d"));                        
                        }
                        else
                            list.add(str.replaceFirst("ड","d"));                        
                    }
                    if(ch.equals('ढ'))
                    {
                        if(i<(u.length()-2))
                        {
                            temp1=u.charAt(i+1);
                            if(temp1.equals('़'))
                            {
                                ch='ढ़';
                                str=str.replaceFirst("ढ"+"़","ढ़");
                            }
                            else
                            {
                                list.add(str.replaceFirst("ढ","d"));
                                list.add(str.replaceFirst("ढ","dh"));
                            }
                        }
                        else
                        {
                            list.add(str.replaceFirst("ढ","d"));
                            list.add(str.replaceFirst("ढ","dh"));
                        }
                    }
                    if(ch.equals('ण'))
                        list.add(str.replaceFirst("ण","n"));
                    if(ch.equals('त'))
                    {
                        System.out.println("8");
                        list.add(str.replaceFirst("त","t"));                                                
                        list.add(str.replaceFirst("त","th"));   
                        if(i<(u.length()-1))
                        {
                            temp1=u.charAt(i+1);
                            if(temp1.equals('्'))
                                list.add(str.replaceFirst("त्","च"));
                        }
                    }
                    if(ch.equals('थ'))
                    {
                        list.add(str.replaceFirst("थ","t"));
                        list.add(str.replaceFirst("थ","th"));
                    }
                    if(ch.equals('द'))
                    {
                        list.add(str.replaceFirst("द","d"));
                        if(i<(u.length()-1))
                        {
                            temp1=u.charAt(i+1);
                            if(temp1.equals('्'))
                                list.add(str.replaceFirst("द्","ज"));
                        }
                    }
                    if(ch.equals('ध'))
                    {
                        list.add(str.replaceFirst("ध", "d"));
                        list.add(str.replaceFirst("ध", "dh"));
                    }
                    if(ch.equals('न'))
                        list.add(str.replaceFirst("न","n"));
                    if(ch.equals('प'))
                        list.add(str.replaceFirst("प","p"));
                    if(ch.equals('फ'))
                    {
                        if(i<(u.length()-2))
                        {
                            temp1=u.charAt(i+1);
                            if(temp1.equals('़'))
                            {
                                ch='फ़';
                                str=str.replaceFirst("फ"+"़","फ़");
                            }
                            else
                            {
                                list.add(str.replaceFirst("फ","p"));
                                list.add(str.replaceFirst("फ","f"));
                                list.add(str.replaceFirst("फ","ph"));
                                list.add(str.replaceFirst("फ","gh"));
                            }
                        }
                        else
                        {
                            list.add(str.replaceFirst("फ","p"));
                            list.add(str.replaceFirst("फ","f"));
                            list.add(str.replaceFirst("फ","ph"));
                            list.add(str.replaceFirst("फ","gh"));
                        }
                    }
                    if(ch.equals('ब'))
                        list.add(str.replaceFirst("ब","b"));
                    if(ch.equals('भ'))
                    {
                        list.add(str.replaceFirst("भ","b"));
                        list.add(str.replaceFirst("भ","bh"));
                    }
                    if(ch.equals('म'))
                        list.add(str.replaceFirst("म", "m"));
                    if(ch.equals('य'))
                    {
                        list.add(str.replaceFirst("य","y"));
                        list.add(str.replaceFirst("य","")); //ia==""
                    }
                    if(ch.equals('र'))
                    {
                        list.add(str.replaceFirst("र","r"));
                        list.add(str.replaceFirst("र","rh"));
                    }
                        
                    if(ch.equals('ऋ') || ch.equals('ृ'))
                    {
                        list.add(str.replaceFirst("ऋ","r"));
                        list.add(str.replaceFirst("ृ","r"));
                    }    
                    if(ch.equals('ल'))
                        list.add(str.replaceFirst("ल","l"));
                    if(ch.equals('व'))
                    {
                        list.add(str.replaceFirst("व","v"));
                        list.add(str.replaceFirst("व","w"));
                    }
                    if(ch.equals('श'))    
                    {
                        list.add(str.replaceFirst("श","c"));
                        list.add(str.replaceFirst("श","s"));
                        list.add(str.replaceFirst("श","sh")); 
                        list.add(str.replaceFirst("श","t"));
                    }
                    if(ch.equals('ष'))
                    {
                        list.add(str.replaceFirst("ष","s"));
                        list.add(str.replaceFirst("ष","sh"));
                        list.add(str.replaceFirst("ष","shh"));
                    }
                    if(ch.equals('स'))
                    {
                        list.add(str.replaceFirst("स","s"));
                        list.add(str.replaceFirst("स","sh"));
                        if(i<(u.length()-1))
                        {
                            temp1=u.charAt(i+1);
                            if(temp1.equals('्'))
                                list.add(str.replaceFirst("स्","श"));
                            if((u.charAt(i+1)=='e')||(u.charAt(i+1)=='i')||(u.charAt(i+1)=='y'))
                                list.add(str.replaceFirst("स","c"));
                        }
                    }
                    if(ch.equals('ह'))
                    {
                        list.add(str.replaceFirst("ह","h"));                                                
                        if(i==(u.length()-1))
                            list.add(str.replaceFirst("ह","gh"));
                    }
                    if(ch.equals('ज़')) 
                    {
                        list.add(str.replaceFirst("ज़","z"));
                        list.add(str.replaceFirst("ज़","x"));
                        list.add(str.replaceFirst("ज़","s"));
                    }
                    if(ch.equals('ड़'))
                        list.add(str.replaceFirst("ड़","d"));                        
                    if(ch.equals('ढ़'))
                    {
                        list.add(str.replaceFirst("ढ़","d"));
                        list.add(str.replaceFirst("ढ़","dh"));
                    }
                    if(ch.equals('फ़'))
                    {
                        list.add(str.replaceFirst("फ़","f"));
                        list.add(str.replaceFirst("फ़","p"));
                        list.add(str.replaceFirst("फ़","ph"));
                        list.add(str.replaceFirst("फ़","gh"));
                    }                             
                }
            }
            catch(Exception e)
            {
                System.out.println("Exception caught: "+e);
                e.printStackTrace();
            }       
        }
                System.out.println("Hi4");
        
        for(Object oc: list)
            hs.add(remove_vowels((String)oc));
        
        return hs;
    }    
    public static HashSet repitions(HashSet<String> s)
    {
        int x;
        String temp;
        Character tc1,tc2;
        List<String> l = new CopyOnWriteArrayList<String>();
        for(Object o: s)
        {
            temp=(String)o;
            x=0;
            while(x<(temp.length()-1))
            {
                tc1=temp.charAt(x);
                tc2=temp.charAt(x+1);
                if(tc1.compareTo(tc2)==0)
                {
                    temp=temp.substring(0,x)+temp.substring(x+1);                       
                    l.add(temp);
                }
                x++;
            }
        }
        for(Object o: l)
            s.add((String)o);
        
        return s;
    }
    public static String repitions1(String vx)
    {
        int x=0;
        Character tc1,tc2;
        while(((vx.length()-1)>x))
        {
            tc1=vx.charAt(x);
            tc2=vx.charAt(x+1);
            if(tc1.compareTo(tc2)==0)
                vx=vx.substring(0,x)+vx.substring(x+1);                       
            x++;
        }

        return vx;
    }
    public static int found(HashSet<String> s, String tr)
    {
        Character ch;
        String sp;
        for(String cmpr: s )
        {
            sp="";
            for(int i=0; i<cmpr.length(); i++)
            {
                ch=cmpr.charAt(i);
                if(((ch>=2300)&&(ch<=2500))|| ((ch>='a')&&(ch<='z'))||(ch.equals('-')))
                    sp+=ch;
            }
            //if(sp.contains(tr))
            if(sp.equals(tr))
                return 1;
        }
        
        return -1;
    }
	
	public static void main(String[] args) 
        {
		// TODO Auto-generated method stub
		
		//String fileName = "C:\\Users\\abc\\Desktop\\F_filter\\outputTransliterated.txt";
        //String fileName = "C:\\Users\\Avinash\\Desktop\\outputByMoses\\y\\Oumc1.txt";
        //String fileName = "C:\\Users\\abc\\Desktop\\y\\englishTransOur";
        //String fileName = "C:\\Users\\abc\\Desktop\\y\\Oumc1.txt";
        String u="null",v="null",parts[],uc,vc;
        String lineHindi=null;
        int value;
        HashSet<String> set = new HashSet<String>();
        
        BufferedWriter bw1 = null;
		BufferedReader brHindi = null;
		BufferedReader brEng = null;
		
		try 
                {
                    //File fileDir1 = new File("C:\\Users\\Avinash\\Desktop\\outputByMoses\\JustHindiWords_our.txt");
                    File fileDir1 = new File("C:\\Users\\abc\\Desktop\\y\\JustHindiWords_our.txt");
                    try 
                    {
                            brHindi= new BufferedReader(new InputStreamReader(new FileInputStream(fileDir1), "UTF8"));
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
                {
                    //File fileDir1 = new File("C:\\Users\\Avinash\\Desktop\\outputByMoses\\englishTransOur");
                    File fileDir1 = new File("C:\\Users\\abc\\Desktop\\y\\englishTransOur");
                    try 
                    {
                            brEng= new BufferedReader(new InputStreamReader(new FileInputStream(fileDir1), "UTF8"));
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
                {
			//File fileDirOut = new File("C:\\Users\\Avinash\\Desktop\\outputByMoses\\transliteratedLinbyLine_our.txt");
                        File fileDirOut = new File("C:\\Users\\abc\\Desktop\\y\\njain.txt");
			bw1= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileDirOut,true), "UTF8"));
		} 
                catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String lineEng=null;
		
        try 
        {        
            int count=1;
            while(((lineHindi = brHindi.readLine()) != null))
            {
            	lineEng = brEng.readLine();
            	System.out.println("Line: "+count);
            	count++;
            	
            	String[] uParts = lineHindi.split(";;;");
            	String[] vParts = lineEng.split("\\s+");
            	for(int i=0;i<uParts.length;i++)
            	{
            		if(uParts[i].trim().length()==0)
            		{
            			continue;
            		}
            		else
            		{
                            uParts[i]=uParts[i].trim();
                            for(int j=0;j<vParts.length;j++)
                            {
                                vParts[j]=vParts[j].trim();
                                if(vParts[j].trim().length()==0)
                                {
                                        continue;
                                }
                                uParts[i]=uParts[i].toLowerCase();
                                vParts[j]=vParts[j].toLowerCase();
                                vc=vParts[j];
                                String temp="";
                                Character ch;    
                                for(int k=0; k<uParts[i].length();k++)
                                {
                                    ch=uParts[i].charAt(k);
                                    if((ch>=2300)&&(ch<=2500))
                                        temp+=uParts[i].charAt(k);
                                }
                                uParts[i]=temp;
                                uc=uParts[i];

                                v=vParts[j];
                                u= uParts[i];
                            /************PUT BY AVINASH to remove if translation contains hindi word*************/
                            Boolean isnotEng = Boolean.FALSE;
                            for(int k=0;k<vParts[j].length();k++)
                            {
                            	ch=vParts[j].charAt(k);
                            	if(((ch>='a')&&(ch<='z')))
                            	{
                            		
                            	}
                            	else
                            	{
                            		isnotEng = Boolean.TRUE;
                            	}
                            }

                            if(isnotEng == Boolean.TRUE)
                            {
                            	continue;
                            }                        
                            
                            v = v.trim();
                            u = u.trim();
                            vParts[j] = vParts[j].trim();
                            uParts[i] = uParts[i].trim();
                            ////////************************************///////////
                                System.out.println("Hello1");
                            try
                            {
                                if(boundary_checker(u,v)==-1)
                                    continue;
                                if(boundary_checker(u,v)==0)
                                {
                                    System.out.println("Not match from boundary");
                                    bw1.write(uc+"--"+vc+"##0");//appends the string to the file
                                    bw1.write(";;;");
                                    continue;
                                }
                                u=remove_vowels(u);
                                v=remove_vowels(v);
                                if(v.trim().length()==0)
                                {
                                    continue;
                                }
                                System.out.println("UC: "+uc+", U: "+u+", V: "+v);
                                set=replacement(u,uc,v);
                                System.out.println("Hello222222");
                                System.out.println("SET: "+set);
                                value=found(set, v);
                                if(value>=0)
                                {
                                    System.out.println("Match from replacement");
                                    bw1.write(uc+"--"+vc+"##1");
                                    bw1.write(";;;");
                                }
                                else
                                {
                                    set=repitions(set);
                                    v=repitions1(v);
                                    System.out.println("Set after epitions: "+set+", V: "+v);
                                    value=found(set, v);
                                    if(value>=0)
                                    {
                                        System.out.println("Match by removing repitions");
                                        bw1.write(uc+"--"+vc+"##1");
                                        bw1.write(";;;");
                                    }
                                    else
                                    {
                                        temp=v;
                                        ch=v.charAt(v.length()-1);
                                        if(ch.equals('y'))
                                        {
                                            temp=v.substring(0, v.length()-1);
                                            if(found(set,temp)>=0)
                                            {
                                                System.out.println("Match by removing y");
                                                bw1.write(uc+"--"+vc+"##1");
                                                bw1.write(";;;");
                                                continue;//System.exit(0);
                                            }
                                        }
                                        if(v.contains("kn") || v.contains("ps") || v.contains("wr") || v.contains("gn") || v.contains("ho") || v.contains("dg"))
                                        {
                                            if(v.contains("dg"))
                                            {
                                                temp=v.substring(0, v.indexOf("dg"))+v.substring(v.indexOf("dg")+1);
                                            }
                                            else  //only in starting
                                            {
                                                temp=v.substring(1);
                                            }                    
                                            if(found(set,temp)>=0)
                                            {
                                                System.out.println("Match by removing pairs starting");
                                                bw1.write(uc+"--"+vc+"##1");
                                                bw1.write(";;;");
                                                continue;
                                            }
                                        }
                                        if(v.contains("sc"))
                                        {
                                            //removing c...like in ascent
                                            temp=v.substring(0, v.indexOf("sc")+1)+v.substring(v.indexOf("sc")+2);
                                            if(found(set,temp)>=0)
                                            {
                                                System.out.println("Match by removing c in sc");
                                                bw1.write(uc+"--"+vc+"##1");
                                                bw1.write(";;;");
                                                continue;
                                            }
                                        }
                                        if(vc.contains("agh") || vc.contains("egh") || vc.contains("igh") || vc.contains("ogh") || vc.contains("ugh"))
                                        {
                                            //removing gh
                                            temp=vc.substring(0, vc.indexOf("gh"))+vc.substring(vc.indexOf("gh")+2);
                                            temp=remove_vowels(temp);
                                            if(found(set,temp)>=0)
                                            {
                                                System.out.println("Match by removing % in %gh");
                                                bw1.write(uc+"--"+vc+"##1");
                                                bw1.write(";;;");
                                                continue;
                                            }
                                        }
                                        if(vc.contains("al") || vc.contains("ol") || vc.contains("ul"))
                                        {
                                            //removing l
                                            temp=vc.substring(0, vc.indexOf("l"))+vc.substring(vc.indexOf("l")+1);
                                            temp=remove_vowels(temp);
                                            if(found(set,temp)>=0)
                                            {
                                                System.out.println("Match by removing l in %l");
                                                bw1.write(uc+"--"+vc+"##1");
                                                bw1.write(";;;");
                                                continue;
                                            }
                                        }
                                        ch=vc.charAt(0);
                                        if(ch.equals('u'))
                                        {
                                            temp=vc.replace('u', 'य');
                                            if(found(set,temp)>=0)
                                            {
                                                System.out.println("Match by replacing u by य");
                                                bw1.write(uc+"--"+vc+"##1");
                                                bw1.write(";;;");
                                                continue;
                                            }
                                        }
                                        int flag=1,c=0;
                                        String ed;
                                        System.out.println("set: "+set+", size: "+set.size());
                                        for(Object o: set)
                                        {c++;
                                            ed=(String)o;
                                            if(edit_distance(remove_vowels(ed.substring(0, ed.length()-1)), v)==0)
                                            {
                                                System.out.println("Match by edit distance: "+ed.substring(0, ed.length()-1)+"--"+v);
                                                bw1.write(uc+"--"+vc+"##1");
                                                bw1.write(";;;");
                                                flag=0;
                                                break;
                                            }
                                            else if(edit_distance(ed, remove_vowels(v.substring(0, v.length()-1)))==0)
                                            {
                                                System.out.println("Match by edit distance: "+ed+"--"+remove_vowels(v.substring(0, v.length()-1)));
                                                bw1.write(uc+"--"+vc+"##1");
                                                bw1.write(";;;");
                                                flag=0;
                                                break;
                                            }
                                        }
                                        System.out.println("no c: "+c);
                                        if(flag==1)
                                        {
                                            bw1.write(uc+"--"+vc+"##0");
                                            bw1.write(";;;");
                                            System.out.println("Not Match in end");
                                        }
                                    }
                                }
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                            }
                            }
            		}
            	}
                bw1.newLine();
                bw1.flush();
            }
            bw1.close();
            brEng.close();
            brHindi.close();
        }
        catch (Exception e) 
        {
            System.out.println("Exception:" + e );
        }
		
	}
}
