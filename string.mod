// In OPL string processing can only be done in scripting

execute
{
  var s="OPL CPLEX in IBM";
  writeln("length = ",s.length);
  var posIBM=s.indexOf("IBM");
  writeln("posIBM = ",posIBM);
  var s2="";
  for(var i=0;i<=2;i++) 
  {
    write(s.charAt(posIBM+i));
    s2=s2+String.fromCharCode(s.charCodeAt(posIBM+i)-1);
    writeln();
  }
  writeln("s2 = ",s2);
  var news=s.substring(0,posIBM)+s2;
  writeln("news = ",news);
}
