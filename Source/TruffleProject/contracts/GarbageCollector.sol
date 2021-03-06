import "Doug.sol";



contract GarbageCollector is DougEnabled {

   struct ActionCall {
        bytes32 actionName;
        address groveDBInstance;
        bytes32 dataKeyIndex;
        uint timestamp;
        address caller;
   }
   
   ActionCall[] callsLog;
   
   // dataKeyIndex to index in the callsLog array for easier access
   mapping (bytes32 => uint) callsLogMap;
   
   function log(bytes32 actionName, address groveDBInstance, bytes32 dataKeyIndex, uint timestamp, address caller) {
        // push to callsLog
        // save the new pushed item's index to callsLogMap
   }
   
   function clear(bytes32 dataKeyIndex) {
   }
   
   function clearOlderThan(uint timestamp) {
   }
   
   function clearAll() {
   }   
}