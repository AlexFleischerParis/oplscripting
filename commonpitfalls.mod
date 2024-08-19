// Here let me share some common pitfalls with
// OPL scripting

// Pitfall 1 : mix OPL and OPL scripting which are 2 langguages

range r=1..5;
int v[i in r]=i;

// In OPL we can write
int su=sum(i in r) v[i];

execute
{
  writeln("su=",su);
  // which gives su=15
}

execute
{
// But in scripting we cannot write
// int su=sum(i in r) v[i];
// because that's OPL
// what we can write:

function compute_sum_array(vRange,vArray)
{
 var s=0;
 for(var i in vRange) s+=vArray[i];
 return s; 
}  

var su2=compute_sum_array(r,v);
writeln("su2=",su2);
  // which gives su2=15
  
}
