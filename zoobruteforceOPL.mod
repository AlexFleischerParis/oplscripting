/*

Let s solve

https://medium.com/ibm-data-ai/optimization-simply-do-more-with-less-zoo-buses-and-kids-66940178db6

through brute force in OPL modeling part. This does not scale.

*/

int nbKids=300;
float costBus40=500;
float costBus30=400;

range rangenbBus40=0..nbKids div 40+1;
range rangenbBus30=0..nbKids div 30+1;

tuple t
{
  int nbBus40;
  int nbBus30;
}

{t} feasibleSet={<nbBus40,nbBus30> | nbBus40 in rangenbBus40,nbBus30 in rangenbBus30
:40*nbBus40+30*nbBus30>=nbKids};

float minCost=min(f in feasibleSet) (f.nbBus40*costBus40+f.nbBus30*costBus30);

{t} sol={<nbBus40,nbBus30> | nbBus40 in rangenbBus40,nbBus30 in rangenbBus30
:minCost==nbBus40*costBus40+nbBus30*costBus30};

execute
{
  writeln("cost = ",minCost);
  writeln(Opl.first(sol).nbBus40, "buses 40 seats and ",Opl.first(sol).nbBus30, "buses 30 seats");
}