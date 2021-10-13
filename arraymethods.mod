execute
{
  
  var ar=new Array(4);
  ar[0]=2;
  ar[1]=10;
  ar[2]=4;
  ar[3]=1;
  ar[4]=7;
  
  writeln("length = ",ar.length);
  
  writeln("join = ",ar.join(" , "));
  
  ar.reverse();
  writeln("reverse = ",ar.join(" , "));
  
  ar.sort();
  writeln("sort default (string) = ",ar.join(" , "));
   
   function numberorder(a,b){ return ((a==b)?(0):((a<b)?-1:1)); }

   
    
    ar.sort(numberorder);
    writeln("sort number = ",ar.join(" , "));
}  
/*

which gives

length = 5
join = 2 , 10 , 4 , 1 , 7
reverse = 7 , 1 , 4 , 10 , 2
sort default (string) = 1 , 10 , 2 , 4 , 7
sort number = 1 , 2 , 4 , 7 , 10

*/
