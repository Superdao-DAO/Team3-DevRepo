import "Doug.sol";
import "ActionsDB.sol";

contract ActionsManager is DougEnabled {
   function ActionsManager(address dougAddr) {
        setDougAddress(dougAddr);
        
        Doug doug = Doug(DOUG);
        if (!doug.addModule("core.actions.manager", this)) {
            throw;
        }
   }

  function execute(bytes32 actionName, address groveDBInstance, bytes32 dataInputKeyIndex, address caller) returns (bool) {
    // permissions

    Doug doug = Doug(DOUG);
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    address actionAddr = db._get(actionName);
    
    bytes32 dataOutputKeyIndex = sha3("whatever... something random or pseudorandom");
    
    result = actionAddr.call(bytes4(bytes32(sha3("execute(address,bytes32)"))), groveDBInstance, dataInputKeyIndex, dataOutputKeyIndex);

    GarbageColletor gc = GarbageColletor(doug.getModule("core.gc"));
    gc.clear(dataInputKeyIndex); // we could keep the input and add it to the event
    gc.log(actionName, groveDBInstance, dataOutputKeyIndex, now, caller);

    Events e = Events(doug.getModule("core.events"));
    e.actionCalled(result, actionName, groveDBInstance, dataOutputKeyIndex, now, caller);
  }

  function addAction(bytes32 name, address addr)
    public
    
    returns (bool result)
  {
    // permissions

    Doug doug = Doug(DOUG);
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    result = db._add(name, addr);
    
    if (result) {
        Events e = Events(doug.getModule("core.events"));
        e._actionAdded(name, addr, msg.sender);
    }      
  }

  function removeAction(bytes32 name) constant returns (bool result) {
    // permissions

    Doug doug = Doug(DOUG);
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    result = db._remove(name);
    
    if (result) {
        Events e = Events(doug.getModule("core.events"));
        e._actionRemoved(name, msg.sender);
    }        
  }

}