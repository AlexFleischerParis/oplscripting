int nbKids=300;
float costBus40=500;
float costBus30=400;
 
dvar int+ nbBus40;
dvar int+ nbBus30;
 
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
  writeln("ctKids.slack = ",ctKids.slack);
  
}

main
{
  thisOplModel.generate();
  writeln("flow control");
 
  writeln("ctKids lower bound : ",thisOplModel.ctKids.LB);
  // Set new lower  bound
  thisOplModel.ctKids.LB=thisOplModel.ctKids.LB-4;
  writeln("ctKids lower bound : ",thisOplModel.ctKids.LB);
  
  // Change bus capacity in the constraint to half capacity
  thisOplModel.ctKids.setCoef(thisOplModel.nbBus40, 20);
  thisOplModel.ctKids.setCoef(thisOplModel.nbBus30, 15);
  cplex.solve();
  thisOplModel.postProcess();
}

/*

which gives

flow control
ctKids lower bound : 300
ctKids lower bound : 296

postProcess
nbBus40 = 15
nbBus30 = 0
ctKids.slack = -4

*/

