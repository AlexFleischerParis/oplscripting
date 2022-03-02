/*

IloOplCallJava : This function calls a Java method from a scripting block
*/

execute
{
  
var convert180toRadian = IloOplCallJava("java.lang.Math","toRadians", "", 180);
writeln("180 degrees in radian : ",convert180toRadian);
			    
}	

/*

180 degrees in radian : 3.141592654

*/		   
