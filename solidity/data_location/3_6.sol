contract MemoryToMemory{
  struct S{string a;uint b;}

    S  tmp = S("memory",1);
  //默认参数是memory
  function memoryToMemory(S s) internal{
    S memory tmp = s;

    //引用传递
    tmp.b = 3;
  }

  function call() returns (uint){
    S  mem = S("memory", 1);
    // memoryToMemory(mem);
    S  oth = mem;
    oth.b =3;
    return mem.b;//other memory
  }
}

