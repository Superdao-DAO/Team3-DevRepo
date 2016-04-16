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

  function execute(bytes32 actionName, bytes32 data) returns (hash dataKeyIndex) {
    // permissions

    Doug doug = Doug(DOUG);
    ActionsDB db = ActionsDB(doug.getModule("core.actions.db"));
    
    address actionAddr = db._get(actionName);
    
    dataKeyIndex = sha3("whatever... something random or pseudorandom");
    
    // Use Grove DB to save the input bytes32 data with dataKeyIndex with a suffix "input". Something like 38002fcf466f90d69a03e55c01d86b74aaee34ae3be4153e16f9b139f9e089e5input.
    // We return dataKeyIndex and the calee can use it to read the output by adding a suffix "output": 38002fcf466f90d69a03e55c01d86b74aaee34ae3be4153e16f9b139f9e089e5output for example.

    address groveDBInstance = doug.getModule("core.groveDB");
    
    // @TODO get actions' contract instance and call its execute method. Send params to execute: groveDBInstance, dataKeyIndex
    // return dataKeyIndex, if the call resulted to true or 0x0, if it was false.
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