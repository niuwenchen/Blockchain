contract MemoryConvertToStateVariable{
  struct S{string a;uint b;}

  //默认并不是storage，is Inentity
  S  s=S("memory", 0);

  function memoryToState(S   tmp) internal{
    S memory  de = tmp;//从内存中复制到状态变量中。

    //修改旧memory中的值，并不会影响状态变量
    tmp.a = "Test";
  }

  function call() returns(string){
    // S memory tmp =
    memoryToState(s);

    return s.a;
  }
}
