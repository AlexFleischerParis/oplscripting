{int} s={1,2};
int a[1..2]=[3,4];
range r=1..4;

int ar[j in 1..4]=j;

execute
{
 
  // Scripting variables are local to the scripting block
  var ar=new Array(4);
  
  ar[1]=s;
  ar[2]=a;
  ar[3]=new Date();
  ar[4]=new Array(2);
  ar[4][1]="hello";
  ar[4][2]=2;
  writeln("ar = (in the first execute block)",ar);
  for(var i in r) writeln("ar[",i,"] = ",ar[i]);
  writeln("ar[4][1] = ",ar[4][1]);
  writeln("ar[4][2] = ",ar[4][2]);
}

execute
{
  writeln("ar = (in the second execute block)",ar);
}

/*

ar = (in the first execute block)[object Object]
ar[1] =  {1 2}
ar[2] =  [3 4]
ar[3] = 11/17/2020 19:15:31 069
ar[4] = [object Object]
ar[4][1] = hello
ar[4][2] = 2
ar = (in the second execute block) [1 2 3 4]

*/
