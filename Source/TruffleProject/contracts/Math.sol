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

        // Prepare input... this can be separated in a function in DougEnabled or as a helper maybe.
        bytes32 dataInputKeyIndex = sha3("whatever... something random or pseudorandom");
        address groveDBInstance = doug.getModule("core.grove.db");
    
        // Use Grove DB to save the input data a,b using dataInputKeyIndex
    
        ActionsManager am = ActionsManager(doug.getModule("core.actions.manager"));
        bytes32 dataOutputKeyIndex = am.execute("modules.math.add", groveDBInstance, dataInputKeyIndex, msg.sender);
        
        if (dataOutputKeyIndex == 0x0) {
            // The action failed.
            throw;
        }
        
        // Use dataOutputKeyIndex to read the results of the action from Grove DB.
        
        result = 42; // we can store the value in a local var and the clear it from Grove DB so we don't waste space.

        GarbageColletor gc = GarbageColletor(doug.getModule("core.gc"));
        gc.clear(dataOutputKeyIndex);
        
        // We could also not use gc to clear the value and return dataOutputKeyIndex so the caller has access to the output data in Grove. Depends on implementation needs of the module.
        return result;
   }
   
}