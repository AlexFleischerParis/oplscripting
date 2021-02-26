

execute
{
  // f returns x+1
  static function f(x)
  {
    return x+1;
  }
  
  includeScript("subfunction.js");
  
  writeln("f(3)=",f(3));
  writeln("g(3)=",g(3));
  
  var a=4;
  
  // returns x+a
  function h(x)
  {
    return a+x;
  }
  
  writeln("h(3)=",h(3));
}

execute
{
  
  writeln("g(6)=",g(6));
  // NB f(3) would not work here since f is static but if you remove static then
  // this would work fine
}

/*

which gives

f(3)=4
g(3)=5
h(3)=7
g(6)=8


*/

