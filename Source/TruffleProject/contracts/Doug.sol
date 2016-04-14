// https://docs.erisindustries.com/tutorials/solidity/solidity-2/
import "Owned.sol";

// Contracts which extend DougEnabled have access to the Modules Manager (Doug)
contract DougEnabled is Owned {
    address public DOUG;

    function setDougAddress(address dougAddr) returns (bool result){
        // Once the doug address is set, don't allow it to be set again, except by the
        // doug contract itself.
        if(DOUG != 0x0 && dougAddr != DOUG){
            return false;
        }
        
        DOUG = dougAddr;
        return true;
    }
    
    function isCalledFrom(bytes32 contractName) internal constant returns (bool) {
        if (DOUG != 0x0) {
            address from = Doug(DOUG).getContract(contractName);
            
            if (msg.sender == from) {
                return true;
            }
        }

        return false;
    }
    
    function isCalledFromDoug() internal constant returns (bool) {
        if(DOUG != 0x0 && msg.sender == DOUG){
            return true;
        }
        
        return false;
    }    
}

// Modules Manager contract
contract Doug {

    address public owner;

    // Constructor
    function Doug(){
        owner = msg.sender;
    }

    // Add a new contract to Doug. This will overwrite an existing contract.
    function addContract(bytes32 name, address addr) returns (bool result) {
        // use grove library as DB
    }

    // Remove a contract from Doug. We could also suicide if we want to.
    function removeContract(bytes32 name) returns (bool result) {
       // use grove library as DB
    }
    
    function getContract(bytes32 name) returns (address contractAddr) {
        // use grove library as DB
    }

    function remove() {
        if(msg.sender == owner){
            suicide(owner);
        }
    }

}