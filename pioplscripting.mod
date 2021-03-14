int n=100000000;
range r=1..n;

execute
{
  
var nb=0;
for(var i in r)
  {
    var x=Math.random();
    var y=Math.random();
    if ((x*x+y*y)<=1) nb++;
  }

  var piOPL=nb*4.0/n;
  writeln("PI computed in OPL scripting: ",piOPL);
}

/*

which gives

PI computed in OPL scripting: 3.14154448


*/


