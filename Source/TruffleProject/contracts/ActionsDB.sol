import "Doug.sol";
import "Grove.sol";


contract ActionsDB is DougEnabled {

    Grove grove;

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
        // use Grove DB
        // @TODO Check if key exists in db 
        grove.insert("ActionsDB", name , addr);

    }

    function _remove(bytes32 name)
        public
        onlyCallsFromModule("core.actions.manager")
        
        returns (bool)
    {
        // use Grove DB 
        grove.remove("ActionsDB", name);   
    }
  
    function _get(bytes32 name)
        constant
        public
        onlyCallsFromModule("core.actions.manager")
        
        returns (address actionAddr)
    {
        // @TODO use Grove DB
        // @TODO get contract address by name from Grove Db  ...     
    }

}