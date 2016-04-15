import "../../Doug.sol";
import "./MathAddAction.sol";

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
   
   function add(bytes32 data) {
        Doug doug = Doug(DOUG);
        ActionsManager am = ActionsManager(doug.getModule("core.actions.manager"));
        
        // can we return this?
        am.getAction("modules.math.add").execute(data);
   }
   
}