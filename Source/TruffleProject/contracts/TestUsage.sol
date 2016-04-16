import "Math.sol";

contract TestUsage is DougEnabled {
    function TestUsage(address doug) {
        if (!setDougAddress(doug)) throw;
    }
    
    function testAdd()
        returns (bytes32 result)
    {
        Doug doug = Doug(DOUG);
        
        Math mathModule = Math(doug.getModule("modules.math"));
        
        result = mathModule.add("5,20");
    }
}