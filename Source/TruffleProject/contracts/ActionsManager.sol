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

  function execute(bytes32 actionName, address groveDBInstance, bytes32 dataKeyIndex, address caller) returns (bool) {
    // permissions

    Doug doug = Doug(DOUG);
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    address actionAddr = db._get(actionName);
    
    result = actionAddr.call(bytes4(bytes32(sha3("execute(address,bytes32)"))), groveDBInstance, dataKeyIndex);

    GarbageColletor gc = GarbageColletor(doug.getModule("core.gc"));
    gc.log(actionName, groveDBInstance, dataKeyIndex, now, caller);
  }

  function addAction(bytes32 name, address addr)
    public
    
    returns (bool result)
  {
    // permissions

    Doug doug = Doug(DOUG);
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    result = db._add(name, addr);
  }

  function removeAction(bytes32 name) constant returns (bool result) {
    // permissions

    Doug doug = Doug(DOUG);
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    result = db._remove(name);
  }

}