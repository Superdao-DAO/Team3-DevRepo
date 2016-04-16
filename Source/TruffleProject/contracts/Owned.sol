contract Owned {
    address public owner = msg.sender;

    modifier onlyOwner() {
        if (msg.sender != owner) throw;
        _
    }
    
    modifier allow(address account) {
        if (msg.sender != account) throw;
        _
    }
    
    function remove() public onlyOwner {
        selfdestruct(owner);
    }
    
    function() {
        throw;
    }    
}