import "Doug.sol";

contract DougDB is DougEnabled {   
    function _add(bytes32 name, address addr)
        public
        onlyCallsFromDoug
        
        returns (bool)
    {
        // store with Grove DB
    }


    function _remove(bytes32 name)
        public
        onlyCallsFromDoug
        
        returns (bool)
    {
        // remove from Grove DB
    }
    
    function _get(bytes32 name)
        constant
        public
        onlyCallsFromDoug
        
        returns (address contractAddr)
    {
        // get from Grove DB
    }

}