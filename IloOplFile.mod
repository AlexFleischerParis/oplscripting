execute {
  var path = "./subfolder";
  var directory = new IloOplFile(path); 
  var f = directory.getFirstFileName();
  
  while ( f!=null ) 
  {
      var f = new IloOplFile(path + "/" + f);
      writeln( f.name );
      var inputFile=new IloOplInputFile(f.name);
      while (!inputFile.eof)
      {
        var str=inputFile.readline();
        writeln(str);
      }
      inputFile.close();
      f = directory.getNextFileName();
      
      
  }
}

/*

gives

./subfolder/a.txt
a
./subfolder/b.txt
b

*/