contract StorageToMemory{
  struct S{string a;uint b;}

  S s = S("storage", 1);

  function storageToMemory(S storage x) internal{
    S  tmp = x;//由Storage拷贝到memory中

    //memory的修改不影响storage
    tmp.b = 2;
  }

  function call() returns (uint){
    storageToMemory(s);
    return s.b;
  }
}