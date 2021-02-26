/*

Let s solve

https://medium.com/ibm-data-ai/optimization-simply-do-more-with-less-zoo-buses-and-kids-66940178db6

through brute force in OPL scripting. This does not scale.

*/

int nbKids=300;
float costBus40=500;
float costBus30=400;

range rangenbBus40=0..nbKids div 40+1;
range rangenbBus30=0..nbKids div 30+1;

execute
{
  var minCost=100000;
  var nbBus40min=0;
  var nbBus30min=0;
  
  for (var nbBus40 in rangenbBus40)
   for (var nbBus30 in rangenbBus30)
     if (40*nbBus40+30*nbBus30>=nbKids)
       {
         var newCost=costBus40*nbBus40+costBus30*nbBus30
         if (newCost<minCost)
         {
           minCost=newCost
           nbBus40min=nbBus40
           nbBus30min=nbBus30
         }
     }
                       
        
writeln("Result")
writeln("nbBus40=",nbBus40min)
writeln("nbBus30=",nbBus30min)
}

/*

which gives

Result
nbBus40=6
nbBus30=2

*/