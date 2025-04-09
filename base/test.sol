// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract HelloWorld {

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
        return strVar;
    }

    // function setHelloWorld(string memory newString) public re

    
    
}