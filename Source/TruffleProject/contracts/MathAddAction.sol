import "Action.sol";

contract MathAddAction is Action {
   function execute(address groveDB, hash dataKeyIndex)
        returns (bool)
   {
        // Get Grove DB instance using groveDB address
        // Read the input data from Grove DB using dataKeyIndex and "input" as suffix. Something like 38002fcf466f90d69a03e55c01d86b74aaee34ae3be4153e16f9b139f9e089e5input 
        // Process
        // Save in Grove DB the output using dataKeyIndex and "output" as suffix. Something like 38002fcf466f90d69a03e55c01d86b74aaee34ae3be4153e16f9b139f9e089e5output
        // Return bool if the action was successful or not.
   }
}