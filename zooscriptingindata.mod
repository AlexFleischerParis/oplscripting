int nbKids=...;

// a tuple is like a struct in C, a class in C++ or a record in Pascal
tuple bus
{
  key int nbSeats;
  float cost;
}

// This is a tuple set
{bus} buses=...;

// asserts help make sure data is fine
assert forall(b in buses) b.nbSeats>0;
assert forall(b in buses) b.cost>0;

// decision variable array
dvar int+ nbBus[buses];

// objective
minimize
     sum(b in buses) b.cost*nbBus[b];
     
// constraints
subject to
{
   sum(b in buses) b.nbSeats*nbBus[b]>=nbKids;
}

execute
{
  for(var b in buses) writeln(nbBus[b]," buses ",b.nbSeats," seats");
}

/*

before price decrease
s= {<40 500> <30 400>}
after price decrease
s= {<40 400> <30 300>}
// solution (optimal) with objective 3000
0 buses 40 seats
10 buses 30 seats

*/
