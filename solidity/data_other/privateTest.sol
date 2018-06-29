contract  A {
    function f() private{}
    
    function testf(){
        f();
    }
}

contract B is A{
    function Testf(){
        // f(); // error 
    }
}