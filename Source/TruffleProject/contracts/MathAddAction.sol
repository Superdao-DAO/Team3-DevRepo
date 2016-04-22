import "Action.sol";

contract MathAddAction is Action {
   function execute(address groveDB, bytes32 dataInputKeyIndex, bytes32 dataOutputKeyIndex)
   {
        // Get Grove DB instance using groveDB address
        // Read the input data from Grove DB using dataInputKeyIndex 
        // Process
        // Save in Grove DB the output using dataOutputKeyIndex
   }
}