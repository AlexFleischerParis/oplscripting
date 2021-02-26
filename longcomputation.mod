int n=500;
range r=1..n;

float su=sum(i in r) sum(j in r) sum(k in r)(j+i-k);
float su2;

execute
{
  var d1=new Date();
  su;
  var d2=new Date();
  writeln("OPL computation : ",(d2-d1)/1000);
}

execute
{
  var d1=new Date();
  for(var i in r) for(j in r) for(k in r) su2=su2+j+i-k;
  var d2=new Date();
  writeln("OPL scripting : ",(d2-d1)/1000);
}

assert su2==su;
