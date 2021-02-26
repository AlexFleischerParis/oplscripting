


execute
{
  
  // get file at url and save it as filename
  function geturlfile(url,filename,pythonpath,pythonfile)
  {
    writeln("geturlfile ",url);
    writeln("and save to ",filename);
    var python=new IloOplOutputFile(pythonfile);
    
    python.writeln("import requests");
    python.writeln("response = requests.get('",url,"')");
    python.writeln("data = response.text");
    python.writeln("file=open('",filename,"', 'w')");
    python.writeln("file.write(data)");
    python.writeln("file.close()");
    python.close();
    IloOplExec(pythonpath+" "+ pythonfile,true);        
    
  }
}

string pythonpath="C:\\Python36\\python.exe";
string pythonfile="C:\\temp\\geturlfile.py";
execute
{
  // Because we cannot do 
  //var f=new IloOplInputFile("http://people.brunel.ac.uk/%7Emastjjb/jeb/orlib/files/scp61.txt");
  // we do an external python call
   
  geturlfile('http://people.brunel.ac.uk/%7Emastjjb/jeb/orlib/files/scp61.txt','c:\\\\temp\\\\scp.txt',pythonpath,pythonfile);
} 