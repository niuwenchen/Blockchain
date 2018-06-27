## solidity的数据位置
目前位置，基本上所有的编程语言都把变量存储在内存中。在solidity中，根据情况的不同，
变量可能不存储在内容和文件系统中。

根据情况的不同，数据总有一个默认位置。但对于复杂的数据类型，例如字符串string,数组array和结构类型struct，
可以用向类型添加storage或memory进行重写。

    函数参数(包括返回参数) 默认使用memory。

    本地变量默认使用storage,显然，对于状态变量来说，位置强制使用storage


    数据位置很重要，因为会改变分配的行为:

    storage变量和meomry变量之间的分配总是创建一个独立的备份。但如果分配是从memory存储的一种复杂类型到另一种复杂类型，
    则不创建备份。

    到一个状态变量的分配(即使是来自其他状态变量)总是创建一个独立的备份

    不能把memory中存储的复杂类型分配给本地存储变量

    在分配状态变量给本地存储变量的情况下，本地存储变量指向状态变量，也就是说，本地存储变量变为指针。

对于一个函数而言，里面的参数和返回值都是用的时候再创建，因此在memory中； 对于实例变量即状态变量，一般存储在本地中。

1 参数及局部变量

    contract SimpleAssign{
    struct S{string a;uint b;}

    //默认参数是memory
    function assign(S s) internal{
            //默认的变量是storage的指针
            //Type struct MemoryToLocalVar.S memory is not implicitly convertible to expected type struct MemoryToLocalVar.S storage pointer.
        S tmp = s;
    }
    }
    异常信息表明
        s是memory变量，
        tmp 是 storage变量
    说明:
        参数是memory变量
        局部变量是storage变量
        
2 状态变量

    状态变量，合约内声明的公有变量。默认的数据位置是storage。
    contract StateVariable{
    struct S{string a;uint b;}
    //状态变量，默认是storage
    S s;
    }
    
3 将storage转换为storage
    
    当我们把一个storage类型的变量赋值给另一个storage时，我们只是修改了它的指针。
    // pragma solidity ^0.4.0;
    contract StorageConvertToStorage{
    struct S{string a;uint b;}

    //默认是storage的
    S s;

    function convertStorage(S storage s) internal{
        S tmp = s;
        tmp.a = "Test";
    }

    function call() returns (string){
        convertStorage(s);
        return s.a;//Test
    }
    }

    上面的例子中，storage类型的变量A传递给storage 变量B时，如果B修改了属性值，则A也发生变化
    这就是经典的引用传递，而不是值传递。
    
4 memory 转换为storage

    局部变量和状态变量的类型都是storage，分开说明
4.1 memory赋值给状态变量

    contract MemoryConvertToStateVariable{
    struct S{string a;uint b;}

    //默认是storage的
    S s;

    function memoryToState(S memory tmp) internal{
        s = tmp;//从内存中复制到状态变量中。

        //修改旧memory中的值，并不会影响状态变量
        tmp.a = "Test";
    }

    function call() returns(string){
        S memory tmp = S("memory", 0);
        memoryToState(tmp);

    return s.a;
    }
    }

    将memory变量进行传递，此时进行的是值传递，不会引发外部的变化
    
5 memory赋值给局部变量

    storage必须是静态分配存储空间的。局部变量虽然是一个storage的，但仅仅是一个storage
    类型的指针。 如果进行这样的赋值，实际会产生一个错误
    
    contract MemoryToLocalVar{
    struct S{string a;uint b;}

    //默认参数是memory
    function memoryToLocal(S s) internal{
        //默认的变量是storage的指针
        //Type struct MemoryToLocalVar.S memory is not implicitly convertible to expected type struct MemoryToLocalVar.S storage pointer.
        //S tmp = s;
    
        //修改变量为memory类型
        S memory tmp = s;
    }
    
    Type struct S memory is not implicity convertible to expected type struct S storage pointer
    局部变量
            storage pointer
            函数参数: memory 变量

综合上面两个例子，也就是说，memory变量可以直接赋值给storage变量，但是是全局状态变量；
而且这种赋值方式(函数)的形式是值传递； 如果是赋值给局部storage变量，也就是storage指针，
需要进行强制转换

5 storage 变量转换为memory变量

    contract StorageToMemory{
    struct S{string a;uint b;}

    S s = S("storage", 1);

    function storageToMemory(S storage x) internal{
        S memory tmp = x;//由Storage拷贝到memory中

        //memory的修改不影响storage
        tmp.b = 2;
    }

    function call() returns (uint){
        storageToMemory(s);
        return s.b;
    }
    }
    
    此时运行的时候，s.b还是1
    storage变量转换为memory变量，不改变storage变量
    如果将上面的函数中
        S storage tmp =s ==> S tmp =s;
        此时s.b 就发生了变化，因为变成了引用传递了。

6 memory转换为memory

    contract MemoryToMemory{
    struct S{string a;uint b;}

    //默认参数是memory
    function memoryToMemory(S s) internal{
        S memory tmp = s;

        //引用传递
        tmp.a = "other memory";
    }

    function call() returns (string){
        S memory mem = S("memory", 1);
        memoryToMemory(mem);
        return mem.a;//other memory
    }
    }
    
    memory给memory进行函数传递，是进行引用传递。
    
7 struct的数据类型

    如果用struct构造变量，则他是memory类型的
    
    contract MemoryToMemory{
    struct S{string a;uint b;}

    S tmp = S("memory",1);
    //默认参数是memory
    function memoryToMemory(S s) internal{
        S memory tmp = s;

        //引用传递
        tmp.b = 3;
    }

    function call() returns (uint){
        // Type struct S memory is not implicity convertible to expected type struct S storage pointer
        S  mem = S("memory", 1);
        // memoryToMemory(mem);
        S  oth = mem;
        oth.b =3;
        return mem.b;//other memory
    }
    }

    看同样的构造方式，只不过构造的位置不同，从而导致产生的数据的存储位置不同
    在全局中，用Struct 构造产生的是Identity，并不是storage
        identity 可以自动转换为storage和memory，根据具体情况来看。
    在局部中，用Struct 构造产生的是memory类型
