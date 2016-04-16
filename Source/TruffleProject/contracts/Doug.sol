import "Owned.sol";
import "Grove.sol";


// @TODO Review these three contracts' relations, so they can be separated into three files. 

// Contracts which extend DougEnabled have access to the Modules Manager (Doug)
contract DougEnabled is Owned {
    address public DOUG;
    Grove grove;

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
        grove.insert("DougDB", name , addr);
    }


    function _remove(bytes32 name)
        public
        onlyCallsFromDoug
        
        returns (bool)
    {
        // @TODO use Grove DB
        grove.remove("DougDB", name);   

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
    address internal dougDBAddress;
    address internal groveDBAddress;
    address internal garbageCollector;

    function Doug(address _dougDBAddress, address _groveDBAddress, address _garbageCollector){
        if (!DougDB(_dougDBAddress).setDougAddress(this)) {
            // DB is already being used by other Doug instance.
            throw;
        }
        if (!GarbageColletor(_garbageCollector).setDougAddress(this)) {
            // GC is already being used by other Doug instance.
            throw;
        }        

        dougDBAddress = _dougDBAddress;
        groveDBAddress = _groveDBAddress;
        garbageCollector = _garbageCollector;
    
        if (!addModule("core.doug", this)) {
            throw;
        }
        if (!addModule("core.doug.db", dougDBAddress)) {
            throw;
        }
        if (!addModule("core.grove.db", groveDBAddress)) {
            throw;
        }
        if (!addModule("core.gc", garbageCollector)) {
            throw;
        }        
    }
    
    function setDougDBAddress(address _dougDBAddress)
       onlyOwner
    {
        dougDBAddress = _dougDBAddress;
        
        removeModule("core.doug.db");
        if (!addModule("core.doug.db", dougDBAddress)) {
            throw;
        }
    }

    function setGroveDBAddress(address _groveDBAddress)
       onlyOwner
    {
        groveDBAddress = _groveDBAddress;
        
        removeModule("core.grove.db");
        if (!addModule("core.grove.db", groveDBAddress)) {
            throw;
        }
    }
    
    function setGCAddress(address _garbageCollector)
       onlyOwner
    {
        garbageCollector = _garbageCollector;
        
        removeModule("core.gc");
        if (!addModule("core.gc", garbageCollector)) {
            throw;
        }
    }        

    function addModule(bytes32 name, address addr) returns (bool result) {
        // permissions
        
        DougDB db = DougDB(dougDBAddress);
    
        result = db._add(name, addr);
    }

    // Remove a contract from Doug. We could also suicide if we want to (with an input flag)
    function removeModule(bytes32 name) returns (bool result) {
        // permissions
        
        DougDB db = DougDB(dougDBAddress);
    
        result = db._remove(name);
    }
    
    function getModule(bytes32 name)
        constant
        public
        
        returns (address contractAddr)
    {
        // permissions
        
        DougDB db = DougDB(dougDBAddress);
    
        contractAddr = db._get(name);
    }
    
    // @dev Also selfdestructs current Doug.
    function switchDoug(address newDoug)
        onlyOwner
    {
        DougDB db = DougDB(dougDBAddress);
        
        // @TODO Use db._getAll() and call setDougAddress(newDoug) for every contract.
        
        remove();
    }

}