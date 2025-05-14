BasicWallet Contract

This is a simple smart contract written in Solidity, designed to manage deposits, transfers, and balance checking for users. It also includes a feature to pause and resume contract functionality.
Features

    #Deposit Ether: Users can deposit Ether into the contract to increase their balance.

    #Transfer Balance: Users can send Ether from their balance to another address.

    #Pause and Resume: The contract can be paused or resumed to prevent transactions from happening.

    #Event Emission: When a balance transfer occurs, an event is emitted to track the transfer details.

Functions
1. deposite()

    #Description: Allows the caller to deposit Ether into the contract. The deposited amount is added to the caller's balance.

    #Modifiers: whenNotPaused

    #Visibility: External

    #Parameters: None

    #Returns: None

2. sendBalance(address _to, uint256 _amount)

    #Description: Allows the caller to send Ether to another address. The amount is deducted from the caller's balance and added to the recipient's balance.

    #Modifiers: whenNotPaused

    #Visibility: External

    #Parameters:

        _to: The address of the recipient.

        _amount: The amount of Ether to send.

    #Returns: None

    #Events: BalanceChanged

3. getBalance()

    #Description: Returns the current balance of the caller.

    #Modifiers: None

    #Visibility: External

    #Parameters: None

    #Returns: uint256 - The balance of the caller.

4. pauseContract()

    #Description: Pauses the contract, preventing all transactions.

    #Modifiers: whenPaused

    #Visibility: External

    #Parameters: None

    #Returns: None

5. resumeContract()

    #Description: Resumes the contract, allowing transactions again.

    #Modifiers: whenPaused

    #Visibility: External

    #Parameters: None

    #Returns: None

State Variables

    #userBalance: A mapping that stores the balance of each user. The user's address is the key, and the balance is the value.

    #isPaused: A boolean variable that tracks whether the contract is paused or not.

Modifiers

    #whenNotPaused: Ensures that the contract is not paused before executing a function.

    #whenPaused: Ensures that the contract is paused before executing a function.

Events

    #BalanceChanged: Emitted when a balance is transferred between two addresses.

        #Parameters:

            from: The sender's address.

            to: The recipient's address.

            balance: The amount transferred.

License

This contract is licensed under the MIT License.
