import "Doug.sol";

contract ActionManager is DougEnabled {
   function ActionManager(address dougAddr) {
        setDougAddress(dougAddr);
        
        Doug doug = getDoug();
        if (!doug.addModule("core.actions.manager", this)) {
            throw;
        }
   }

  function execute(bytes32 actionName, bytes data) returns (bool) {
    // permissions

    Doug doug = getDoug();
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    address actionAddr = db._get(actionName);

    // get actions' contract instance and call its execute method

    return true;
  }

  function addAction(bytes32 name, address addr)
    public
    
    returns (bool result)
  {
    // permissions

    Doug doug = getDoug();
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    result = db._add(name, addr);
  }

  function removeAction(bytes32 name) constant returns (bool result) {
    // permissions

    Doug doug = getDoug();
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    result = db._remove(name);
  }

}