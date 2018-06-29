contract A{
    function f() internal
    {
        
    }
    
    function f1() external{
        
    }
    
    function callInternal() {
        f();
    }
    
    function callExternal(){
        // this.f();
    }
    
    function callExternal_0(){
        this.f1();
    }
    function callExternal_usef(){
        // this.f();
    }
}