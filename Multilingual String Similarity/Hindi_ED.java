package edit_distance;

//import java.util.*;
public class Hindi_ED 
{
    public static Character[] Array(String s) 
    {
        if ( s == null ) 
            return null;
        int len = s.length();
        Character[] array = new Character[len];
        for (int i = 0; i < len ; i++) 
        {
            array[i] = s.charAt(i);
            System.out.print(array[i]+", ");
        }
        return array;
    }
    public static int minimum(int x, int y, int z)
    {
	return Math.min(Math.min(x, y), z);
    }
    public static int[][] fill_table(String x, String y)
    {
        int i,s,j;
        String a,b;
        int[][] t= new int[x.length()][y.length()];
        for(i=0; i<x.length(); i++)
		t[i][0]=i;
	for(i=0; i<y.length(); i++)
		t[0][i]=i;
	for(i=1; i<x.length(); i++)	
	{
            for(j=1; j<y.length(); j++)
            {
		s=1;
                a=x.charAt(i-1)+"";
                b=y.charAt(j-1)+"";   
                if(a.equals(b))
                    s=0;
		t[i][j]= minimum(t[i-1][j]+1, t[i][j-1]+1, t[i-1][j-1]+s);
            }	
	}
        return t;
    }
    public static void main(String[] args) 
    {     
	int i,j;
        float similarity;
        String x,y;
        
        //Taking Input
        /*
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter X: ");
        x=scan.next();
        System.out.println("\nEnter Y: ");
        y=scan.next();
        */
        x="सोमवार";
        y="रविवार";
        
        //Converting String into Character Array
        Character[] x_array = new Character[x.length()];
        Character[] y_array = new Character[y.length()];
        x_array=Array(x);
        y_array=Array(y);
        int table[][];
        //int table[][]= new int[x.length()][y.length()];
        
        //Populating the table...considering cost of [insertion=deletion=substitution=1]
        table=fill_table(x,y);
                
	//Printing the table
	for(i=0; i<x.length(); i++)
	{
            System.out.print("\n");            
            for(j=0; j<y.length(); j++)
		System.out.print(table[i][j]+" ");
	}
	System.out.println("\n\nEdit Distance: "+table[x.length()-1][y.length()-1]);
        float val=table[x.length()-1][y.length()-1];
        similarity=1-(val/Math.max(x.length(), y.length()));
        System.out.println("Similarity Percentage: "+similarity*100+"%");
    }    
}

/*
सोमवार
रविवार
अफ्रीका
अमेरिका
एशिया
ऑस्ट्रेलिया
यूरोप
*/