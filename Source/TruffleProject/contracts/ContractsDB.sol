contract ContractsDB {
    // construct, self destroy, etc
    
    modifier onlyDoug() { if(!isCalledFromDoug()) throw; _ }

    function _add(bytes32 name, address addr)
        public
        onlyDoug()
        
        returns (bool)
    {
        // store with Grove DB
    }


    function _remove(bytes32 name)
        public
        onlyDoug()
        
        returns (bool)
    {
        // remove from Grove DB
    }
    
    function _get(bytes32 name)
        public
        onlyDoug()
        
        returns (address contractAddr)
    returns () {
        // get from Grove DB
    }

}