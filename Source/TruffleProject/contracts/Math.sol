import "ActionsManager.sol";
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
   
   function add(bytes32 data)
        returns (bytes32 out)
   {
        Doug doug = Doug(DOUG);
        ActionsManager am = ActionsManager(doug.getModule("core.actions.manager"));
        
        // @TODO can we return this?
        out = am.execute("modules.math.add", data);
   }
   
}