library StringHelper {
   /*
        Check equality between two strings.
        
        @param   {string} _a First string to check
        @param   {string} _b Second string to check
        @returns {bool}      Compare binary result
    */
    function stringsEqual(string _a, string _b) returns (bool) {
        bytes memory a = bytes(_a);
        bytes memory b = bytes(_b);
        if (a.length != b.length)
            return false;
        for (uint i = 0; i < a.length; i ++)
            if (a[i] != b[i])
                return false;
        return true;
    }
    
    /*
        Concatenate two strings.
        
        @param   {string} _a First string to concat
        @param   {string} _b Second string to concat
        @returns {string}    Resulting string
    */
    function stringsConcat(string _a, string _b) returns (string) {
  		bytes memory a = bytes(_a);
  		bytes memory b = bytes(_b);
  		bytes memory out;
  		for (uint i = 0; i < (a.length + b.length); i ++){
          	if(i < a.length)    
  				out[i] = a[i];
  			else
  				out[i] = b[i];
  		}
		  return string(out);
	  }
    /*
        Make an bytes array with delimited string input.
        
        @param   {string}  _a      Delimited string
        @param   {byte}    _delim  Delimiter
        @returns {bytes[]}	   Resulting bytes array
    */
    function stringsExplode(string _a, byte _delim) internal returns (bytes[]){
  		bytes memory a = bytes(_a);
  		bytes[] memory out;
  		uint index = 0;
  		uint arrPos = 0;
  		for(uint f = 0; f < a.length; f++){
  			if(a[f] == _delim){
  				index++;
  				arrPos = 0;
  			}
  			else {
  				out[index][arrPos++] = a[f];
  			}
  		}
  		return out;
	  }
    /*
        Convert a bytes array into a delimited byte sequence.
        
        @param   {bytes[]} _a      Bytes array
        @param   {byte}    _delim  Delimiter
        @returns {bytes}	   Resulting byte sequence
    */
    function stringsImplode(bytes[] _a, byte _delim) internal returns (bytes){
  		bytes memory out;
  		for(uint f = 0; f < _a.length; f++){
  			for(uint b = 0; b < _a[f].length; b++){
  				out[out.length] = _a[f][b];
  			}
  			out[out.length] = _delim;
  		}
  		return out;
	  }
}
