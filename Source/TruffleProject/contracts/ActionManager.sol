// https://docs.erisindustries.com/tutorials/solidity/solidity-2/
import "Doug.sol";

contract ActionManagerEnabled is DougEnabled {
    // Makes it easier to check that action manager is the caller.
    function isActionManager() internal constant returns (bool) {
        if(DOUG != 0x0){
            /*address am = ContractProvider(DOUG).contracts("actions");
            if (msg.sender == am){
                return true;
            }*/
        }
        return false;
    }
}

contract ActionManager {
  function execute(bytes32 actionName, bytes data) returns (bool) {
    // use grove library as DB    

    // If no action with the given name exists - cancel.
    /*if (actn == 0x0){
      return false;
    }*/
    // No type conversion possible here, for now.
    //actn.call(data);
    return true;
  }

  // Add a new action.
  function addAction(bytes32 name, address addr) {
    // use grove library as DB    
  }

  // Remove an action.
  function removeAction(bytes32 name) constant returns (bool) {
    // use grove library as DB    
  }

}