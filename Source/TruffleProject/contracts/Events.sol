import "Doug.sol";

// Permissions???
contract Events is DougEnabled {
    event moduleAdded(bytes32 moduleName, address moduleAddr, address caller);
    event moduleRemoved(bytes32 moduleName, address caller);
    // Might be too heavy and unnecessary, but just for the idea:
    event moduleAccessed(bytes32 moduleName, address moduleAddr, address caller);
    
    event actionAdded(bytes32 actionName, address actionAddr, address caller);
    event actionRemoved(bytes32 actionName, address caller);
    event actionCalled(bool status, bytes32 actionName, address groveDBInstance, bytes32 dataKeyIndex, uint timestamp, address caller);
    
    event dougSwitched(address oldDoug, address newDoug, address caller);
   
    function Events(address dougAddr) {
        setDougAddress(dougAddr);
        
        Doug doug = Doug(DOUG);
        if (!doug.addModule("core.events", this)) {
            throw;
        }
    }
    
    function _moduleAdded(bytes32 moduleName, address moduleAddr) {
        moduleAdded(moduleName, moduleAddr);
    }
    
    function _moduleRemoved(bytes32 moduleName) {
        moduleRemoved(moduleName);
    }
    
    function _moduleAccessed(bytes32 moduleName, address moduleAddr, address caller) {
        moduleAccessed(moduleName, moduleAddr, caller);
    }
    
    function _actionAdded(bytes32 actionName, address actionAddr) {
        actionAdded(actionName, actionAddr);
    }
    
    function _actionRemoved(bytes32 actionName) {
        actionRemoved(actionName);
    }
    
    function _moduleAccessed(bytes32 actionName, address actionAddr, address caller) {
        moduleAccessed(actionName, actionAddr, caller);
    }
    
    function _actionCalled(bytes32 actionName, address groveDBInstance, bytes32 dataKeyIndex, uint timestamp, address caller) {
        actionCalled(actionName, groveDBInstance, dataKeyIndex, timestamp, caller);
    }
    
    function _dougSwitched(address oldDoug, address newDoug) {
        dougSwitched(oldDoug, newDoug);
    }
}