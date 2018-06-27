## 数据类型
Solidity中所有的变量默认值都是0，尤其是string类型的也是0

    布尔类型: true 或false
    uint8,uint16,uint24
    int8,int16,int24
    ufixed0x8,ufixed0x16,...ufixed0x256
    fixed0x8,fixed0x16,...fixed0x256  代表分数
    
    address 存储最大20字节的值。 用于存储以太坊地址。address类型有两个属性:balanced和send
    balance用于检测地址余额，send用于向地址发送以太币。 send方法拿出需要转账那些方法的wei，
    并根据转账是否成功返回true或者false。wei从调用send方法的合约中扣除。 用户可以在Solidity中
    使用0x前缀给变量分配一个十六进制的数值
    
数组类型

    支持generic和byte两种数据类型。 支持固定长度和动态长度两种数组，也支持多维数组
    contract sample{
    //dymamic size array
    int[] myarray = [0,0];
    
    function sample(uint index,int value)
    {
        myarray[index] = value;
        int[] myarray2 = myarray;
        
        
        uint24[3] memory myarray3 = [1,2,99999];
        uint8[2]  memory myarray4 =[1,23];
        
    }
    }
    
    说明:
    (1) 在全局中声明的变量是Identity类型，可以在函数内部进行自动改变
    (2) 固定长度的数组和可变长的数组，区别就是[]中是否有length
    (3) [a,b,c]等实例化数组是memory类型的变量
        需要进行转换 
        uint8[2] meomry myarray4 = [1,23];
    (4) 数组有length属性。只能改变动态数组的大小
    (5) 如果想访问动态数组的未设置索引，会抛出异常

注意:
array,structs和map都不可以用作函数参数，也不可以用作函数返回值。所以函数参数和返回值就是基本的数据类型


### 字符串类型
使用bytes 和 string。 bytes用于创建原始字符串，string用于创建UTF-8字符串。 字符串长度总是动态的。

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
    
    说明:
    (1) 构造string字符串"xxxx" 最终数据存储在memory中
    因此: string myString4 = "Example" 抛出异常
          string myString5 = initString; //抛出异常，参数是memory
          
### 结构类型

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
   

### enum

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
    
    但是怎么进行赋值呢?
    
### mapping类型
mapping类型是一个哈希表，mapping类型只可以存在于storage中，不存在于memory中，因此它们是作为
状态变量声明的。 可以认为mapping类型包含key/value对，不是实际存储key，而是存储
key的keccak256哈希，用于查询value。 mapping类型没有长度。 

    contract sample{
    mapping (int => string) myMap;
    
    function sample(int key,string value)
    {
        myMap[key] =value;
        
        // myMap2 is a reference to myMap
        mapping (int => string) myMap2 = myMap;
    }
    }
    如果没有key，则返回是0

### delte操作符
delete操作符可以用于任何变量，将其设置成默认值。

如果对动态数组使用delete操作符，则删除所有元素，长度变为0. 如果对静态数组使用delete操作符，则重置所有索引。

如果对map类型使用delte操作符，什么都不会发生。如果对map类型的一个键使用delete操作符，则会删除与该键相关的值。

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
    
### 基本类型之间的转换
除了数组类型、字符串类型、结构类型、枚举类型和map类型外，其他类型均称为基本类型。



### 控制结构
Solidity支持if else while for break continue return ?: 等控制结构





     