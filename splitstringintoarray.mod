string s="1;2;8;1000";

int arsize;

execute
{
  ar=s.split(";");
  writeln("size =",ar.length);
  arsize=ar.length;
}

range r=1..arsize;
int resultarray[r];

execute
{
  ar=s.split(";");
  for(var i in r) resultarray[i]=Opl.atoi(ar[i-1]);
  writeln("resultarray = ",resultarray);
}

/*

which gives

size =4
resultarray =  [1 2 8 1000]

*/


