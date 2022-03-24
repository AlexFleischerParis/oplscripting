int nbKids=300;
float costBus40=500;
float costBus30=400;
 
dvar int+ nbBus40;
dvar int+ nbBus30;
 
minimize
 costBus40*nbBus40  +nbBus30*costBus30;
 
subject to
{
 40*nbBus40+nbBus30*30>=nbKids;
} 

execute
{
  writeln("nbBus40 = ",nbBus40);
  writeln("nbBus30 = ",nbBus30);
}

int nbBusTotal=nbBus40+nbBus30; // Lazy evaluation

execute
{
  nbBus40=nbBus40+1;
  nbBus30=nbBus30+1;
  writeln("nbBusTotal = ",nbBusTotal);
}

/*

gives

nbBus40 = 6
nbBus30 = 2
nbBusTotal = 10

*/
