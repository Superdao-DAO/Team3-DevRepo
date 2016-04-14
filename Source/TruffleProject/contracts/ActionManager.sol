// https://docs.erisindustries.com/tutorials/solidity/solidity-2/
import "Doug.sol";

contract ActionManager is DougEnabled {
    // construct, self destroy, etc

  function execute(bytes32 actionName, bytes data) returns (bool) {
    // permissions

    // use ActionsDB

    // get actions' contract instance and call its execute method

    return true;
  }

  function addAction(bytes32 name, address addr) {
    // permissions

    // use ActionsDB
  }

  function removeAction(bytes32 name) constant returns (bool) {
    // permissions

    // use ActionsDB    
  }

}