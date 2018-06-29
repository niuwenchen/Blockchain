contract  A {
    function f() internal{}
    
    function testf(){
        f();
    }
}

contract B is A{
    function Testf(){
        f();
    }
}