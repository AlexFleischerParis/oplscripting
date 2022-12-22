using CP;

int nbKids=300;
float costBus40=500;
float costBus30=400;
     
dvar int+ nbBus40;
dvar int+ nbBus30;

dvar int  obj;
     
minimize
     costBus40*nbBus40  +nbBus30*costBus30;
     
subject to
{
  
  ctKids: 40*nbBus40+nbBus30*30>=nbKids;
}

main
{
  thisOplModel.generate();
 
  cp.solve();
  
  writeln("ObjBound = ",cp.getObjBound());
 
}

/*

gives

ObjBound = 3800

*/
