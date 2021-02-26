    int m=1000000;
    range r=1..m;
    int prime[i in r]=(i!=1) &&and(j in 2..ftoi(ceil(sqrt(i-1)))) (0!=i mod j); // is prime ?

    // One by one
    {int} primes={i | i in r : 1==prime[i]};

    execute
    {
    primes;
    }

    {int} nonPrimes;


    // Eratosthenes
    execute
    {
    for(var i in r) if (i!=1)
     if (!nonPrimes.contains(i))
        {
          j=2*i;
          while (j<=m)
          {
            nonPrimes.add(j);
            j=j+i;      
          }    
        }

    }

    {int} primes2=asSet(r) diff nonPrimes diff {1};

    execute
    {
    primes2;
    }

    assert card(primes)==card(primes2);
    assert card(primes symdiff primes2)==0; 
