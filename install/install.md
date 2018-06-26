## Install
(1) download mist or ethereum   (网址)[https://github.com/ethereum/mist/releases/tag/v0.10.0]

(2) download geth: 

(3) 创建创世区块 genesis.json

    {
    "config": {
        "chainId": 15,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
    "coinbase" : "0x0000000000000000000000000000000000000000",
    "difficulty" : "0x40000",
    "extraData" : "",
    "gasLimit" : "0xffffffff",
    "nonce" : "0x0000000000000042",
    "mixhash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
    "parentHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
    "timestamp" : "0x00",
    "alloc": { }

    }


    chainId: 指定了独立的区块链网络ID。网络ID在连接到其他节点的时候也会用到，
        以太坊公网的网络ID是1，为了不与公有链有冲突，运行私有链节点时要指定自己的网络Id。
        不同ID网络的节点无法相互连接
    HomesteadBlock: 当设置为0时表示使用Homestead发布该链
    nonce: 是一个64位随机数，用于挖矿，注意它和mishash的设置需要满足以太坊的Yellow paper
        所描述的条件
    mishash: 由上一个区块的一部分生成的hash。
    difficulty: 设置当前区块的难度，越大挖矿就越难
    alloc: 用来预置帐号以及帐号的以太币数量
    coinbaseL 旷工帐号
    timestamp: 创建创世块的时间戳
    extraData: 附加信息
    gasLimit: 该值设置对GAS的消耗总量限制，用来限制区块能包含的交易信息总和
    
    ## -- datadir 表示当前区块链网络数据存放位置
    geth  --datadir "./blockData"  init genesis.json
    生成两个文件夹
    geth: 保存的该链上的区块数据
    keystore: 保存的该链上的用户信息
    
    启动私有链
    ## --nodiscover  表示该链禁止被其他节点发现
    ## console 2 >> geth.log  日志输出
    geth --datadir "./blockData"  --nodiscover console 2>> geth.log
    
    另一种启动rpc通信的
    geth --identity "secbro etherum"  --rpc --rpccorsdomain "*"  --datadir "./blockData" --port "30303" 
        --rpcapi "db,eth,net,web3" --networkid 95518 console 2>>geth.log 
        
    identity: 区块链的标识，用于表示当前网络的名字
    init: 指定创世块文件的位置，并创建创世块
    datadir: 指定区块数据存放的位置
    Port: 网络监听接口  默认30303
    rpc: 启动rpc通信
    rpcapi: 设置允许连接rpc的客户端，一般为db,eth,net,web3
    rpccorsdomain: 指定什么url能连接到你的节点执行rpc定制端任务。
    rpcaddr: 连接rpc的地址，默认为localhost
    rpcport: 连接rpc的端口，默认为8545
    networkid: 设置当前区块链的网络ID，用于区分不同的网络，是一个数字
    console: 启动命令行模式，可以在Geth中执行命令。
    

   
    
