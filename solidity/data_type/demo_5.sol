contract sample{
    struct Struct{
        mapping(int=>string) myMap;
        int myNumber;
    }
    
    int[] myArray;
    Struct myStruct;
    
    function sample(int key,string value,int number,int[] array){
        myStruct = Struct(number);
        
        myStruct.myMap[key]=value;
        myArray =  array;
    }
    
    function reset()
    {
        // myArray length is 0
        delete myArray;
        
        // myNumber is now 0 and myMap remains as it is
        delete myStruct;
        
    }
    
    function delteKey(int key)
    {
        // here we are deleteing the key
        delete myStruct.myMap[key];
    }
    
}