int nbKids=300;
float costBus40=500;
float costBus30=400;
 
dvar int+ nbBus40;
dvar int+ nbBus30;

execute
{
  nbBus40.priority=10; // set the branching priority
  nbBus40.direction="BranchUp";
}
 
minimize
 costBus40*nbBus40  +nbBus30*costBus30;
 
subject to
{
 ctKids:40*nbBus40+nbBus30*30>=nbKids;
} 

execute
{
  writeln();
  writeln("postProcess");
  writeln("nbBus40 = ",nbBus40);
  writeln("nbBus30 = ",nbBus30);
  writeln("nbBus40.priority = ",nbBus40.priority); // set the branching priority
  writeln("nbBus40.direction = ",nbBus40.direction);
  
}

main
{
  thisOplModel.generate();
  writeln("flow control");
 
  writeln("nbBus40.UB: ",thisOplModel.nbBus40.UB);
  writeln("nbBus30.UB: ",thisOplModel.nbBus30.UB);
  // Set new upper  bound
  thisOplModel.nbBus40.UB=3;
  thisOplModel.nbBus30.UB=10;
  
  writeln("nbBus40.UB: ",thisOplModel.nbBus40.UB);
  writeln("nbBus30.UB: ",thisOplModel.nbBus30.UB);
  
  cplex.solve();
  thisOplModel.postProcess();
}

/*

which gives

flow control
nbBus40.UB: 2147483647
nbBus30.UB: 2147483647
nbBus40.UB: 3
nbBus30.UB: 10

postProcess
nbBus40 = 3
nbBus30 = 6
nbBus40.priority = 10
nbBus40.direction = BranchUp

*/


