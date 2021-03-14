int n=100000000;
int scale=maxint div 2;

range r=1..n;

float x[i in r]=rand(scale+1)/scale;
float y[i in r]=rand(scale+1)/scale;

//execute
//{
//  for(var i in r)
//  {
//    x[i]=Math.random();
//    y[i]=Math.random();
//  }
//}

int nb=sum(i in r) ((x[i]^2+y[i]^2)<=1);

float piOPL=nb*4/n;

execute
{
  writeln("PI computed in OPL : ",piOPL);
}

/*

which gives

PI computed in OPL : 3.14142592

*/
