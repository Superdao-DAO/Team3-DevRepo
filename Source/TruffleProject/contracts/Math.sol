import "ActionsManager.sol";
import "GarbageColletor.sol";
import "MathAddAction.sol";

contract Math is DougEnabled {
   function Math(address dougAddr) {
        setDougAddress(dougAddr);
        
        Doug doug = Doug(DOUG);
        if (!doug.addModule("modules.math", this)) {
            throw;
        }
        
        address MathAddActionAddr = new MathAddAction();
        
        ActionsManager am = ActionsManager(doug.getModule("core.actions.manager"));
        if (!am.addAction("modules.math.add", MathAddActionAddr)) {
            throw;
        }
   }
   
   function add(uint a, uint b)
        returns (uint result)
   {
        Doug doug = Doug(DOUG);

        // Prepare input... this can be separated in a function in DougEnabled or as a helper.
        bytes32 dataKeyIndex = sha3("whatever... something random or pseudorandom");
        address groveDBInstance = doug.getModule("core.grove.db");
    
        // Use Grove DB to save the input data a,b using dataKeyIndex with a suffix "input" as index. Something like 38002fcf466f90d69a03e55c01d86b74aaee34ae3be4153e16f9b139f9e089e5input.
        // The index dataKeyIndex can be used in the action (MathAddAction in our case) to store the result and we'll have access to it here by adding a suffix "output" to the index: 38002fcf466f90d69a03e55c01d86b74aaee34ae3be4153e16f9b139f9e089e5output for example.
    
        ActionsManager am = ActionsManager(doug.getModule("core.actions.manager"));
        bool success = am.execute("modules.math.add", groveDBInstance, dataKeyIndex);
        
        if (!success) {
            // The action failed.
            throw;
        }
        
        // Use dataKeyIndex with "output" suffix to read the results of the action from Grove DB.
        
        result = 42; // we can store the value in a local var and the clear it from Grove DB so we don't waste space.

        GarbageColletor gc = GarbageColletor(doug.getModule("core.gc"));
        
        gc.clear(dataKeyIndex);
        
        // We could also not use gc to clear the value and return dataKeyIndex so the caller has access to the output data. Depends on implementation needs of the module.
        return result;
   }
   
}