contract sample{
    string mystring ="";
    bytes myrawstring;
    
    function sample(string initString,bytes rawStringInit){
        mystring = initString;
        
        string mystring2 = mystring;
        
        // mystring3 is a string in memory
        string memory mystring3 = "ABCDE";
        
        //here the length and content changes
        mystring3="XTZ";
        myrawstring = rawStringInit;
        
        myrawstring.length++;
        
        // throw exception while compiling
        string mystring4="Example";
        
        // throw exception while compling
        string mystring5=initString;
        
    } 
}