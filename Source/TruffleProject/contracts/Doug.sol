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

contract DougDB is DougEnabled {   
    function _add(bytes32 name, address addr)
        public
        onlyCallsFromDoug
        
        returns (bool)
    {
        // @TODO use Grove DB
    }


    function _remove(bytes32 name)
        public
        onlyCallsFromDoug
        
        returns (bool)
    {
        // @TODO use Grove DB
    }
    
    function _get(bytes32 name)
        constant
        public
        onlyCallsFromDoug
        
        returns (address contractAddr)
    {
        // @TODO use Grove DB
    }
    
    function _getAll()
        constant
        public
        onlyCallsFromDoug
        
        // @TODO what data structure to return?
    {
        // @TODO use Grove DB
    }

}

// Modules Manager contract
contract Doug is Owned {
    address internal DougDBAddress;

    function Doug(address _dougDBAddress){
        if (!DougDB(_dougDBAddress).setDougAddress(this)) {
            // DB is already being used by other Doug instance.
            throw;
        }

        DougDBAddress = _dougDBAddress;
    
        // Bellow registrations for core.doug and core.doug.db are not mandatory, but might be useful. Also setting them is a check, if the DB is working correctly.
        if (!addModule("core.doug", this)) {
            throw;
        }
        if (!addModule("core.doug.db", DougDBAddress)) {
            throw;
        }
    }
    
    function setDougDBAddress(address _dougDBAddress)
       onlyOwner
    {
        DougDBAddress = _dougDBAddress;
    }

    function addModule(bytes32 name, address addr) returns (bool result) {
        // permissions
        
        DougDB db = DougDB(DougDBAddress);
    
        result = db._add(name, addr);
    }

    // Remove a contract from Doug. We could also suicide if we want to (with an input flag)
    function removeModule(bytes32 name) returns (bool result) {
        // permissions
        
        DougDB db = DougDB(DougDBAddress);
    
        result = db._remove(name);
    }
    
    function getModule(bytes32 name)
        constant
        public
        
        returns (address contractAddr)
    {
        // permissions
        
        DougDB db = DougDB(DougDBAddress);
    
        contractAddr = db._get(name);
    }
    
    // @dev Also selfdestructs current Doug.
    function switchDoug(address newDoug)
        onlyOwner
    {
        DougDB db = DougDB(DougDBAddress);
        
        // @TODO Use db._getAll() and call setDougAddress(newDoug) for every contract.
        
        remove();
    }

}