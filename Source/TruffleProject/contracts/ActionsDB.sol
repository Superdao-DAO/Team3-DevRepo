// https://docs.erisindustries.com/tutorials/solidity/solidity-2/
import "Doug.sol";

contract ActionsDB is DougEnabled {
// construct, self destroy, etc

    function _add(bytes32 name, address addr)
        public
        onlyCallsFromModule("ActionManager")
        
        returns (bool)
    {
    
    
    }

    function _remove(bytes32 name)
        public
        onlyCallsFromModule("ActionManager")
        
        returns (bool)
    {
    
    }
  
    function _get(bytes32 name)
        public
        onlyCallsFromModule("ActionManager")
        
        returns (address actionAddr)
    {
  
    }

}