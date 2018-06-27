// pragma solidity ^0.4.0;
contract StorageConvertToStorage{
  struct S{string a;uint b;}

  //默认是storage的
  S s;

  function convertStorage(S storage s) internal{
    S tmp = s;
    tmp.a = "Test";
  }

  function call() returns (string){
    convertStorage(s);
    return s.a;//Test
  }
}
