contract Owned {
    address public owner = msg.sender;
    
    modifier owned() {
        if (msg.sender != owner) throw;
        _
    }
    
    modifier allow(address account) {
        if (msg.sender != account) throw;
        _
    }
    
    function remove() public owned {
        selfdestruct(owner);
    }
    
    function() {
        throw;
    }    
}