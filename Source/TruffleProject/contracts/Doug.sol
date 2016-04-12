// https://docs.erisindustries.com/tutorials/solidity/solidity-2/
import "Owned.sol";

contract DougEnabled {
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
    
    modifier restricted {
        if (msg.sender == owner) _
    }

    // Makes it so that Doug is the only contract that may kill it.
    function remove(){
        if(msg.sender == DOUG){
            suicide(DOUG);
        }
    }

}

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