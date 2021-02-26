

execute
{
  var start="01/01/2020";
  var nbDays=3;
  
  var d1=new Date(start);
  
  var delay=nbDays*3600*24*1000;

  var end=d1+delay;
  writeln("end =  ",new Date(end));
}

/*

gives

end =  01/04/2020 00:00:00 000

*/


