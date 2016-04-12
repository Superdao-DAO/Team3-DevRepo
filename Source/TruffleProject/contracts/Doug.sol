// https://docs.erisindustries.com/tutorials/solidity/solidity-2/

contract DougEnabled {
    address DOUG;

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

    // Makes it so that Doug is the only contract that may kill it.
    function remove(){
        if(msg.sender == DOUG){
            suicide(DOUG);
        }
    }

}

contract Doug {

    address owner;

    // Constructor
    function Doug(){
        owner = msg.sender;
    }

    // Add a new contract to Doug. This will overwrite an existing contract.
    function addContract(bytes32 name, address addr) returns (bool result) {
        // permissions
    
        // use ContractsDB
    }

    // Remove a contract from Doug. We could also suicide if we want to.
    function removeContract(bytes32 name) returns (bool result) {
        // permissions

        // use ContractsDB
    }
    
    function getContract(bytes32 name) returns (address contractAddr) {
        // permissions

        // use ContractsDB
    }

    function remove(){
        if(msg.sender == owner){
            suicide(owner);
        }
    }

}