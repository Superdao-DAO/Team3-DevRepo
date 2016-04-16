import "Action.sol";
import "lib.helpers.strings";

contract MathAddAction is Action {
   function execute(bytes32 data)
        returns (bytes32 out)
   {
        bytes[] memory addIn = stringHelper.stringsExplode(data,",");
        
		for(uint f = 0; f < addIn.length; f++){
			out += addIn[f];
		}
   }
}