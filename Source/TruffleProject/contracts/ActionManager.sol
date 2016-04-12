// https://docs.erisindustries.com/tutorials/solidity/solidity-2/

contract ActionManager {
    // construct, self destroy, etc

  function execute(bytes32 actionName, bytes data) returns (bool) {
    // permissions

    // use ActionsDB

    if (actn == 0x0){
      return false;
    }

    actn.call(data);

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