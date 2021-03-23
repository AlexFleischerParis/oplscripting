int i1=2;
float f1=3.4;
string s1="s1";
{int} set1={1,2};

dvar int x;
dexpr int y=2*x;

range r=1..2;

tuple t
{
  int a;
  string b;
  {int} c;
 
}

{t} tupleSet={<1,"2",{8}>};

execute
{
  
  writeln("i1:",typeof(i1));
  writeln("f1:",typeof(f1));
  writeln("s1:",typeof(s1));
  writeln("set1:",typeof(set1));
  
  var nbFields=tupleSet.getNFields();
  for(var j=0;j<nbFields;j++) 
  {
    write(tupleSet.getFieldName(j),":");
    var value=Opl.first(tupleSet)[tupleSet.getFieldName(j)];
    writeln(typeof(value));
  }    
  writeln("x:",typeof(x));
  writeln("y:",typeof(y));
  writeln("r:",typeof(r));
  writeln();
}  

/*

which gives

i1:number
f1:number
s1:string
set1:IloDiscreteDataCollection
a:number
b:string
c:IloDiscreteDataCollection
x:IloNumVar
y:IloNumExpr
r:IloIntRange

*/
