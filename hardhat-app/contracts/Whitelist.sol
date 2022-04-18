//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    //maximum number of addresses which can be whitelisted
    uint8 public maxWhitelistedAddresses;

    // keep track of number of addresses whitelisted till now
    uint8 public numAddressesWhitelisted;

    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true,
    // it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        //msg.sender is the address of the user who called this function
        require(
            !whitelistedAddresses[msg.sender],
            "Sender already in the whitelist."
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Max limit reached!"
        );

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
