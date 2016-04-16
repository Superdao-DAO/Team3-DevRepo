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

  function execute(bytes32 actionName, bytes32 data) returns (bytes32 out) {
    // permissions

    Doug doug = Doug(DOUG);
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    address actionAddr = db._get(actionName);
	
	out = actionAddr.call(string4(string32(sha3("execute(bytes32)"))), data);
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