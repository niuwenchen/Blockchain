
contract publicTest{
    function f(){}
    
    function Testpublic(){
        f();
        this.f();
    }
}