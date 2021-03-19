/*

with scripting we can easily turn minimize into maximize and conversely
So here let's answer the question :with 8 buses 
With 8 buses , if we want to travel with 300 kids what is the minimum and maximum price we will pay

*/

using CP; // Works also with MIP : just comment this line

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
  
  40*nbBus40+nbBus30*30>=nbKids;
  
  // 8 buses in total
  nbBus40+nbBus30==8;
}

execute
{
  writeln(nbBus40," buses 40 seats and ",nbBus30," buses 30 seats")
}

main
{  


 
 thisOplModel.generate();
 var algo;
 if (thisOplModel.modelDefinition.isUsingCP()) algo=cp; else algo=cplex;
 writeln("minimize");  
 algo.solve();
 thisOplModel.postProcess();
 writeln("cost = ",algo.getObjValue());

 writeln();
 writeln("maximize"); 
 thisOplModel.getObjective().setCoef(thisOplModel.obj,-1);  
 algo.solve();
 thisOplModel.postProcess();
 writeln("cost = ",-algo.getObjValue());
 
}

/*

which gives

minimize
6 buses 40 seats and 2 buses 30 seats
cost = 3800

maximize
8 buses 40 seats and 0 buses 30 seats
cost = 4000

*/
