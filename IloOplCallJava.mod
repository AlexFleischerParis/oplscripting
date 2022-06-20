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
