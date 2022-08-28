// SPDX-License-Identifier: GPL-3.0

import "@openzeppelin/contracts/utils/Strings.sol";


pragma solidity ^0.8.0;

contract MyFirstChatroom {
   struct Message { 
      address authorAddress;
      string author;
      string post;
   }

    Message[] private messages;

    constructor() {
    }

    function publishMessage(string memory _post) public returns (Message memory message) {
        string memory addrStr = Strings.toHexString(uint256(uint160(msg.sender)), 20);

        Message memory message = Message(msg.sender,addrStr,_post);

        messages.push(message);

        return message;
    }
    function getAllMessages() external view returns (Message[] memory) {
        return messages;
    }


}
