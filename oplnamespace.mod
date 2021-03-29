range r=1..2;
int v[1..4]=[1,2,4,4];
{int} s={1,2,5};


execute
{
  // display the string x and then the eval of x
  function display(x)
  {
    writeln(x," = ",eval(x));
  }
  
  display("r");
  display("Opl.asSet(r)");
  writeln();
  display("v");
  display("Opl.standardDeviation(v)");
  display("Opl.allDifferent(v)");
  writeln();
  
  display("s");
  display("Opl.card(s)");
  display("Opl.item(s,2)");
}

/*

which gives

r = 1..2
Opl.asSet(r) =  {1 2}

v =  [1 2 4 4]
Opl.standardDeviation(v) = 1.299038106
Opl.allDifferent(v) = 0

s =  {1 2 5}
Opl.card(s) = 3
Opl.item(s,2) = 5

*/
