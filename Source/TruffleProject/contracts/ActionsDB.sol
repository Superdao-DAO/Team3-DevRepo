// https://docs.erisindustries.com/tutorials/solidity/solidity-2/
import "Doug.sol";

contract ActionsDB is DougEnabled {
// construct, self destroy, etc

  mapping (bytes32 => address) public actions;

  function addAction(bytes32 name, address addr) returns (bool) {
    if(!isCalledFrom("ActionManager")){
      return false;
    }
    actions[name] = addr;
    return true;
  }

  function removeAction(bytes32 name) returns (bool) {
    if(!isCalledFrom("ActionManager")){
      return false;
    }
    if (actions[name] == 0x0){
      return false;
    }
    actions[name] = 0x0;
    return true;
  }

}