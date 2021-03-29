/*

Eval xecutes string as a program, and returns the value of the last evaluated expression. 

*/

execute
{
  // display the string x and then the eval of x
  function display(x)
  {
    writeln(x," = ",eval(x));
  }
  
  
  var s="hello";
  display("s");
}  

/*

which gives 

s = hello

*/
