    int nbKids=200;
    float costBus40=500;
    float costBus30=400;
    float costBus50=625;
         
    dvar int+ nbBus40;
    dvar int+ nbBus30;
    dvar int+ nbBus50;

    dexpr float cost=costBus40*nbBus40  +nbBus30*costBus30+nbBus50*costBus50;
    dexpr float co2emission=nbBus50+nbBus40*1.1+nbBus30*1.2;;
         
    minimize
      staticLex(cost,co2emission);
         
    subject to
    {

      40*nbBus40+nbBus30*30+nbBus50*50>=nbKids;
    }

    execute DISPLAY_After_SOLVE
    {
      writeln("The minimum cost is ",cost);
      writeln("CO2 emission is ",co2emission);
      writeln("We will use ",nbBus40," 40 seats buses ",nbBus30,
      " 30 seats buses and ", nbBus50," buses 50 seats");
    }
    
    /*
    
    The minimum cost is 2500
	CO2 emission is 4
	We will use 0 40 seats buses 0 30 seats buses and 4 buses 50 seats
	
	*/
