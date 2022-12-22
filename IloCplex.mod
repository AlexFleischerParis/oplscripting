int nbKids=300;
float costBus40=500;
float costBus30=400;
     
dvar int+ nbBus40;
dvar int+ nbBus30;

dvar int  obj;
     
minimize
     obj;
     
subject to
{
  obj==costBus40*nbBus40  +nbBus30*costBus30;
  ctKids: 40*nbBus40+nbBus30*30>=nbKids;
}

main
{
  thisOplModel.generate();
 
  cplex.solve();
  
  writeln("coef of nbbus40 in ctKids = ",cplex.getCoef(thisOplModel.ctKids,thisOplModel.nbBus40));
 
}

/*

gives

coef of nbbus40 in ctKids = 40


*/