contract sample{
    //dymamic size array
    int[] myarray = [0,0];
    
    function sample(uint index,int value)
    {
        myarray[index] = value;
        int[] myarray2 = myarray;
        
        
        uint24[3] memory myarray3 = [1,2,99999];
        uint8[2]  memory myarray4 =[1,1];
        
    }
}