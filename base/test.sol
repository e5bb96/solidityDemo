// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract HelloWorldTest {

    bool boolVar = true;



    // 表示只允许存储 [0,2^8-1] = [0,255]
    uint8 unitVar = 254;
    // unit = uint256
    uint256 uintVar = 379840039219704; 

    bytes32 bytesVar = "Hellow world";
    string strVar = "Hello world";
    bytes bytesDefindVar = "Hellow world"; // bytes实际是数组，bytes 类型的长度是动态的

    // 存储地址的数据
    address addrVar = 0x172842C9f7285CaC7f2e652f8B91b5550cAab89F;


    // view 只允许读取
    function sayHello() public view returns (string memory) {
        // 調用函數
        return addinfo(strVar);
    }

    function sayHelloInfo(uint256 _id) public view returns(string memory){
        for (uint256 i = 0; i < infos.length; i++){
            if (infos[i].id == _id) {
                return addinfo(infos[i].phrase);
            }
        }
        return addinfo(strVar);
    }

    function sayHelloMappingInfo(uint256 _id) public view returns(string memory){
        // 空指针判断
        if (infoMapping[_id].addr == address(0x0)){
            return addinfo(strVar);
        }
        return addinfo(infoMapping[_id].phrase); 
    }

    function setHelloWorld(string memory newString) public {
        strVar = newString;
    }    

    function setHelloWorldStruct(string memory newString, uint256 _id) public {
        Info memory info = Info(newString, _id, msg.sender);
        infos.push(info);
        infoMapping[_id] = info;
    }

    // pure 不做修改，僅作運算操作
    function addinfo(string memory hellowWorldStr) internal pure returns (string memory){
        return string.concat(hellowWorldStr, " from xxx contract.");
    } 

    // 針對複雜的數據結構，如string需要增加下面關鍵字。如果uint、bytes、int 編譯器自動適配
    // 1.Storage 存储在区块链的状态存储（永久存储，写入需要 gas） 
    // 2.Memory 临时存储在 EVM 内存（RAM），读取/写入 memory 比 storage 更省 gas
    // 3.calldata 存储在交易/调用的输入数据（只读），不可修改（类似 memory 但更省 gas）
    // 4.stack 存储在 EVM 执行栈，用于基本数据类型（uint, bool, address 等）
    // 5.codes 存储在合约字节码（不可变），存储合约的代码和常量（constant/immutable 变量）
    // 6.logs 存储在交易日志（event 数据），用于事件（event），供链下程序（如 DApp）监听
    

    // 數據結構
    // struct: 結構體
    // array: 數組
    // mapping: 映射，存儲key/value
    
    struct Info {
        string phrase;
        uint256 id;
        address addr;
    }
    Info[] infos;

    mapping(uint256 id => Info info) infoMapping;


}