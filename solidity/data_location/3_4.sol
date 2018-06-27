contract MemoryToLocalVar{
  struct S{string a;uint b;}

  //默认参数是memory
  function memoryToLocal(S s) internal{
    //默认的变量是storage的指针
    //Type struct MemoryToLocalVar.S memory is not implicitly convertible to expected type struct MemoryToLocalVar.S storage pointer.
    S tmp = s;
    
    //修改变量为memory类型
    // S memory tmp = s;
  }

}