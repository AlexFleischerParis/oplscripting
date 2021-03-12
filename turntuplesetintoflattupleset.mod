/*

here we ll see how to turn a non flat tuple set with arrays, sub tuple and sets inside
into a flat tuple set that can be tuen into a CSV that can be used within
Cloudpak for Data Watson Studio

*/

    execute
    {
      
      function isTupleSetFlat(tupleSet)
      {
        var nbFields=tupleSet.getNFields();
        var fistLine=Opl.first(tupleSet);
        var res=1; // True unless proved false
        
        for(var j=0;j<nbFields;j++)
        {
          var value=fistLine[tupleSet.getFieldName(j)];
          var typ=typeof(value);
          writeln(tupleSet.getFieldName(j), " is ",typ);
          if ((typ!="number") && (typ!="string"))  res=0;
        }   
        if (res==1) writeln("This tuple set is flat");
        else  writeln("This tuple set is not flat"); 
        return res;
    }
  }    
    
    
    range r=1..2;
    
    int a1[r]=[1,2];
    int a2[r]=[1,4];
    {int} set1={5,6};
    {int} set2={9,10};
    
    tuple subt
    {
      int x;
      int y;
    }
    
    tuple t
    {
    string firstname;
    int number[r];
    {int} intset;
    subt sub;
    }
    
    // not flat tuple set
    {t} s={<"Nicolas",a1,set1,<1,2>>,<"Alexander",a2,set2,<6,7>>};
    
    tuple t2
    {
      string firstname;
      int keynumber;
      int number;
      int intset;
      int sub1;
      int sub2;
    }
    
    {t2} s2;
    
    // turn s that is not flat into s2 that is a flat tuple set
    execute
    {
      writeln();
      writeln("is tuple set s flat ? ");
      writeln(isTupleSetFlat(s));
      writeln();
      
      for(var i in s)
        for(var j in r) 
          for(var k in i.intset) 
            s2.add(i.firstname,j,i.number[j],k,i.sub.x,i.sub.y)
            
      
      
      writeln();
      writeln("is tuple set s2 flat ? ");
      writeln(isTupleSetFlat(s2));
      writeln();
    }
    
    // the same but through OPL modeling and not scripting
    {t2} s2bis=union (i in s) union(j in r) union(k in i.intset) {<i.firstname,j,i.number[j],k,i.sub.x,i.sub.y>};
    
    execute display_s2
    {
      writeln("s=");
      writeln(s);
      writeln();
      writeln("s2=");
      for(var l in s2 )writeln(l);
      writeln();
      writeln("s2bis=");
      for(var l in s2bis )writeln(l);
    }
  
  
  /*
  
  gives
  
  is tuple set s flat ? 
firstname is string
number is IloMap
intset is IloDiscreteDataCollection
sub is IloTuple
This tuple set is not flat
0


is tuple set s2 flat ? 
firstname is string
keynumber is number
number is number
intset is number
sub1 is number
sub2 is number
This tuple set is flat
1

s=
 {<"Nicolas" [1 2] {5 6} <1 2>>
     <"Alexander" [1 4] {9 10} <6 7>>}

s2=
 <"Nicolas" 1 1 5 1 2>
 <"Nicolas" 1 1 6 1 2>
 <"Nicolas" 2 2 5 1 2>
 <"Nicolas" 2 2 6 1 2>
 <"Alexander" 1 1 9 6 7>
 <"Alexander" 1 1 10 6 7>
 <"Alexander" 2 4 9 6 7>
 <"Alexander" 2 4 10 6 7>
 
 s2bis=
 <"Nicolas" 1 1 5 1 2>
 <"Nicolas" 1 1 6 1 2>
 <"Nicolas" 2 2 5 1 2>
 <"Nicolas" 2 2 6 1 2>
 <"Alexander" 1 1 9 6 7>
 <"Alexander" 1 1 10 6 7>
 <"Alexander" 2 4 9 6 7>
 <"Alexander" 2 4 10 6 7>
 
 */  
    