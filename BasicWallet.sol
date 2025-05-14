// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract BasicWallet {
    
    // A mapping to store the balance of each user, where the address is the key and the balance is the value.
    mapping(address => uint256) public userBalance;

    // A state variable to track if the contract is paused or not.
    bool public isPaused;

    // Event that is emitted when a balance is transferred between two addresses.
    event BalanceChanged(address indexed from, address indexed to, uint256 balance);

    // Modifier that ensures the contract is not paused before executing a function.
    modifier whenNotPaused() {
        require(!isPaused, "Contract is paused");  // Check that the contract is not paused.
        _;
    }

    // Modifier that ensures the contract is paused before executing a function.
    modifier whenPaused() {
        require(isPaused, "Contract is not paused");  // Check that the contract is paused.
        _;
    }

    // Function to deposit ether into the contract.
    function deposite() external payable whenNotPaused {
        userBalance[msg.sender] += msg.value;  // Add the sent amount to the sender's balance.
    }

    // Function to send balance from one user to another.
    function sendBalance(address _to, uint256 _amount) external whenNotPaused {
        require(userBalance[msg.sender] >= _amount, "Insufficient balance");  // Ensure the sender has enough balance.
        userBalance[msg.sender] -= _amount;  // Deduct the amount from the sender's balance.
        userBalance[_to] += _amount;  // Add the amount to the receiver's balance.

        emit BalanceChanged(msg.sender, _to, _amount);  // Emit an event for the balance transfer.
    }

    // Function to get the balance of the caller.
    function getBalance() external view returns(uint256) {
        return userBalance[msg.sender];  // Return the balance of the caller.
    }

    // Function to pause the contract (no transactions allowed after pausing).
    function pauseContract() external whenPaused {
        isPaused = true;  // Set the contract state to paused.
    }

    // Function to resume the contract after it has been paused.
    function resumeContract() external whenPaused {
        isPaused = false;  // Set the contract state to not paused.
    }
}
