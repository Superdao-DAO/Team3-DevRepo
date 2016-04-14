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
    
    modifier onlyCallsFromModule(bytes32 moduleName) {
        if (DOUG != 0x0) {
            address from = Doug(DOUG).getModule(moduleName);
            
            if (msg.sender == from) {
                _
            }
        }

        throw;
    }
    
    modifier onlyCallsFromDoug() {
        if(DOUG == 0x0 || msg.sender != DOUG){
            throw;
        }
        _
    }    
}

// Modules Manager contract
contract Doug {

    address public owner;

    // Constructor
    function Doug(){
        owner = msg.sender;
    }

    function addModule(bytes32 name, address addr) returns (bool result) {
        // use grove library as DB
    }

    // Remove a contract from Doug. We could also suicide if we want to (with an input flag)
    function removeModule(bytes32 name) returns (bool result) {
       // use grove library as DB
    }
    
    function getModule(bytes32 name) returns (address contractAddr) {
        // use grove library as DB
    }

    function remove() {
        if(msg.sender == owner){
            suicide(owner);
        }
    }

}