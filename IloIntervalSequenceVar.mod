using CP;

range R = 1..3;



dvar interval itvs[i in R] size 4+i ;
dvar sequence seq in all(i in R)itvs[i] types all(i in R)(i+100);

minimize max(i in R) endOf(itvs[i]);
subject to
{
   noOverlap(seq);  
   first(seq,itvs[3]);
   last(seq,itvs[1]);
}



execute {
  writeln("sequence = ",seq);
  writeln();
  writeln("first = ",seq.first() );
  writeln("second = ",seq.next(seq.first()) ) ;
  writeln("last = ",seq.last() );

  
}

/*

which gives

sequence =  {<"itvs[3]" 0 2 103 0 7 7>
     <"itvs[2]" 1 1 102 7 13 6>
     <"itvs[1]" 2 0 101 13 18 5>}

first =  <1 0 7 7>
second =  <1 7 13 6>
last =  <1 13 18 5>

NB:

In "itvs[3]" 0 2 103 0 7 7

103 is the type, 0,7 and 7 are start, end and size

*/