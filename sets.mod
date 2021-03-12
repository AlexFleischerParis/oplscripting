{int} s1={1,2};
{int} s2={2,3};

{int} sinter=s1 inter s2;
{int} sunion=s1 union s2;

{int} sinterbis;
{int} sunionbis;

int v1=(2 in s1);
int v1bis;

int o1=ord(s1,2);
int o1bis;

int su1=sum(i in s1) i;
int su1bis;

int size1=card(sinter);
int size1bis;



execute
{
  sinterbis=Opl.operatorINTER(s1,s2);
  sunionbis=Opl.operatorUNION(s1,s2);
  v1bis=s1.contains(2);
  o1bis=Opl.ord(s1,2);
  
  for(var i in s1) su1bis+=i;
  size1bis=sinter.size;
}

assert forall(i in sinter) i in sinterbis;
assert card(sinter)==card(sinterbis);
assert v1==v1bis;
assert o1==o1bis;
assert su1==su1bis;
assert size1==size1bis;

{int} s3={5} union s2 union {9,10};
{int} s3b={5};

execute
{
  s3b.importSet(s2);
  s3b.addAll(new Array(9,10));
}

assert forall(i in s3) i in s3b;
assert card(s3)==card(s3b);
