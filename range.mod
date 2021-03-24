range r=1..10;

range float rf=1.2..2.3;

execute {
   writeln(r.LB);
   writeln(r.UB);
   writeln(r.size);
   
   writeln();
   
   writeln(rf.LB);
   writeln(rf.UB);
   
   writeln();
   writeln("display loop");
   for(var i in r) write(i," ");
   writeln();
   
}

/*

gives

1
10
10

1.2
2.3

display loop
1 2 3 4 5 6 7 8 9 10 
*/
