contract sample{
    struct myStruct {
        bool mybool;
        string mystring;
    }
    
    myStruct s1;
    
    myStruct s2=myStruct(true,"a");
    
    function sample(bool initBool,string init)
    {
        s1 = myStruct(initBool,init);
        myStruct memory s3 = myStruct(initBool,init);
    }
        
}