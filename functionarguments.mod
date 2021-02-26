// let us see here how we can send any number of parameters to a function

execute
{
  function compute_average()
  {
    var s=0;
    for(var i=0;i< arguments.length;i++) s=s+arguments[i];
    return s/arguments.length;
  }
  writeln("compute_average(6,7)=",compute_average(6,7));
  writeln("compute_average(6,7,10,11,20)=",compute_average(6,7,10,11,20));
}

/*

which gives

compute_average(6,7)=6.5
compute_average(6,7,10,11,20)=10.8

*/
