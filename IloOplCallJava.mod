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

execute
{
var title="title";
var msg="hello";  

IloOplCallJava("javax.swing.JOptionPane", "showMessageDialog",
"(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V", 
null, msg, title, 1);	 
}  

execute{ 
writeln("5 random numbers");
var rnd = IloOplCallJava("java.util.Random", "<init>", "()");
rnd.setSeed(1);	
for(var i=1;i<=5;i++)
{			    			  
 var t = rnd.nextDouble();
 writeln(t);
}
writeln("Gaussian");
for(var i=1;i<=5;i++)
{			    			  
 var t = rnd.nextGaussian();
 writeln(t);
}
}