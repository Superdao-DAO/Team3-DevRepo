import "Doug.sol";

contract ActionsDB is DougEnabled {
   function ActionsDB(address dougAddr) {
        setDougAddress(dougAddr);
        
        Doug doug = Doug(DOUG);
        if (!doug.addModule("core.actions.db", this)) {
            throw;
        }
   }

    function _add(bytes32 name, address addr)
        public
        onlyCallsFromModule("core.actions.manager")
        
        returns (bool)
    {
        // @TODO use Grove DB
    }

    function _remove(bytes32 name)
        public
        onlyCallsFromModule("core.actions.manager")
        
        returns (bool)
    {
        // @TODO use Grove DB    
    }
  
    function _get(bytes32 name)
        constant
        public
        onlyCallsFromModule("core.actions.manager")
        
        returns (address actionAddr)
    {
        // @TODO use Grove DB
    }

}