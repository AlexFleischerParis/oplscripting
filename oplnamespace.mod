range r=1..2;
int v[1..4]=[1,2,4,4];


execute
{
  writeln(Opl.asSet(r));
  writeln(Opl.standardDeviation(v));
  writeln(Opl.allDifferent(v));
}

/*

which gives

 {1 2}
1.299038106
0

*/
