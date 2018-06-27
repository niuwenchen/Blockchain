## solidity 学习
solidity 源文件扩展名为.sol,多种版本

源文件中可以使用pragma Solidity 说明编写代码时使用的编译器版本

    pragma Solidity ^0.4.2;


### 智能合约的结构
合约就像是一个类(class),其中包含状态变量(state variable),函数(function),函数修改器(function modifier),
事件(event),结构(structure)和枚举(enum)。 合约还支持继承，通过在编译时备份代码来实现。
最后，合约还支持多种状态。

    contract Sample{
    // state variable
    uint256 data;
    address owner;
    
    
    //event definition
    event logData(uint256 dataToLog);
    
    //function modifier
    modifier oblyOwner(){
        if (msg.sender!= owner) throw;
        
    }
    
    // constructor
    function Sample(uint256 initData,address initOwner){
        data = initData;
        owner = initOwner;
    }
    
    //functions
    function getData() returns (uint256 returnedData){
        return data;
    }
    
    function setData(uint256 newData) {
        logData(newData);
        data = newData;
    }
    }

* 使用contract声明一个合约
* 声明两个状态变量data和owner。data包含一些数据，owner包含所有者的以太坊钱包地址，即部署合约者的以太坊地址
* 定义一个事件event。事件用于通知客户端。一旦data发生变化，将触发这个事件。所有事件保存在区块链中
* 定义一个函数修改器(function modifier)。修改器用于在执行一个函数之前自动检测条件。 这里，修改器检测合约所有者是否在调用函数，如果不是，就抛出异常
* 得到合约构造函数，在部署合约时，调用构造函数，构造函数用于初始化状态变量
* 定义两个方法。第一个方法用于得到data状态变量的值，第二个方法用于改变data的值



### 用new操作符创建合约
    
    contract sample1{
        int a;
        function assign(int b)
        {
            a =b;
        }
     }
     
     contract smaple2 {
        function sample2(){
            sample1 s= new sample1();
            s.assign(12);
        }
     }
    
    
### 异常
throw抛出

    function myFunction(){
        throw;
    }
    

### 外部函数调用
内部函数调用是一个函数在同一个合约中调用另一个函数
外部函数调用是一个函数调用另一个合约的函数

使用this关键字进行的调用称为外部调用，在函数中，this关键字代表当前合约的实例


    

