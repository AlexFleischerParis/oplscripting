using CP;

stepFunction f=stepwise {100->8;50};

dvar interval itvs1;
dvar interval itvs1b intensity f;
dvar interval itvs2 optional;
dvar interval itvs3 optional;

dvar interval itvs[1..4]=[itvs1,itvs1b,itvs2,itvs3];

subject to
{
  startOf(itvs1)==2;
  endOf(itvs1)==10;
  
  startOf(itvs1b)==2;
  endOf(itvs1b)==10;
  
  startOf(itvs2)==2;
  endOf(itvs2)==10;
  presenceOf(itvs1)==1;
  
  presenceOf(itvs3)==0;
  
  
}

execute
{
  function display(name,itv)
  {
    write(name," = "),
    write(itv);
    write(" which is the same as ");
    write("<",Opl.presenceOf(itv)," ",Opl.startOf(itv)," ",Opl.endOf(itv)," ",Opl.sizeOf(itv),">");
    write(" and lengthOf = ",Opl.lengthOf(itv));
    writeln();
  }
  
  display("itvs1",itvs1);
  display("itvs1b",itvs1b);
  display("itvs2",itvs2);
  display("itvs3",itvs3);
  
  writeln(itvs);
}

/*

which gives

itvs1 =  <1 2 10 8> which is the same as <1 2 10 8> and lengthOf = 8
itvs1b =  <1 2 10 7> which is the same as <1 2 10 7> and lengthOf = 8
itvs2 =  <1 2 10 8> which is the same as <1 2 10 8> and lengthOf = 8
itvs3 =  <0 0 0 0> which is the same as <0 0 0 0> and lengthOf = 0


*/
