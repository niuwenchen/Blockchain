contract sample{
    enum OS {windows,Linux,OSX,unix}
    
    OS choice;
    
    function sample(OS chosen)
    {
        choice = chosen;
    }
    
    function setLinuxOS(){
        choice = OS.Linux;
    }
    
    function getChoice() returns (OS chosenOS)
    {
        return choice;
    }
}