// solidity 工厂模式

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


import { HelloWorldTest } from "./test.sol";
// 网络引用
import { HelloWorld } from "https://github.com/smartcontractkit/Web3_tutorial_Chinese/blob/main/lesson-2/HelloWorld.sol";
// 引入第三方 import {} from "@companyName/product/contract";

contract HelloWorldFactory {

    HelloWorldTest hw;
    HelloWorldTest[] hws;

    function createHelloWorld() public {
        hw = new HelloWorldTest();
        hws.push(hw);
    }

    function getHelloWorldByIndex(uint256 _index) public view returns (HelloWorldTest) {
        return hws[_index];
    }

    function callSayHelloFromFactory(uint256 _index) public view returns (string memory) {
        return hws[_index].sayHello();
    }

    function callSayHelloInfoFromFactory(uint256 _index, uint256 _id) public view returns (string memory){
        return hws[_index].sayHelloInfo(_id);
    }

    function callSayHelloMapFromFactory(uint256 _index, uint256 _id) public view returns (string memory){
        return hws[_index].sayHelloMappingInfo(_id);
    }


    function callSetHelloWorldFromFactory(uint256 _index, string memory newString, uint256 _id) public {
        hws[_index].setHelloWorldStruct(newString, _id);
    }
}