library BitwiseHelper {
    /* Bit constants */
    uint32 constant BIT0 = 0x01;
    uint32 constant BIT1 = 0x02;
    uint32 constant BIT2 = 0x04;
    uint32 constant BIT3 = 0x08;
    uint32 constant BIT4 = 0x10;
    uint32 constant BIT5 = 0x20;
    uint32 constant BIT6 = 0x40;
    uint32 constant BIT7 = 0x80;
    uint32 constant BIT8 = 0x0100;
    uint32 constant BIT9 = 0x0200;
    uint32 constant BIT10 = 0x0400;
    uint32 constant BIT11 = 0x0800;
    uint32 constant BIT12 = 0x1000;
    uint32 constant BIT13 = 0x2000;
    uint32 constant BIT14 = 0x4000;
    uint32 constant BIT15 = 0x8000;
    uint32 constant BIT16 = 0x010000;
    uint32 constant BIT17 = 0x020000;
    uint32 constant BIT18 = 0x040000;
    uint32 constant BIT19 = 0x080000;
    uint32 constant BIT20 = 0x100000;
    uint32 constant BIT21 = 0x200000;
    uint32 constant BIT22 = 0x400000;
    uint32 constant BIT23 = 0x800000;
    uint32 constant BIT24 = 0x01000000;
    uint32 constant BIT25 = 0x02000000;
    uint32 constant BIT26 = 0x04000000;
    uint32 constant BIT27 = 0x08000000;
    uint32 constant BIT28 = 0x10000000;
    uint32 constant BIT29 = 0x20000000;
    uint32 constant BIT30 = 0x40000000;
    uint32 constant BIT31 = 0x80000000;
    
    /*
        Check if the given bit is set in the given flags.
        
        @param   {uint32} flags The flags containing variable
        @param   {uint32} bit   The bit to check
        @returns {bool}         The binary result from AND operation
    */
    function bitIsSet(uint32 flags, uint32 bit) returns (bool) {
        if(flags & bit == 0) return false; 
        else return true;
    }
    
    /*
        Set the provided bit in the flags container.
        
        @param   {uint32} flags The flags containing variable
        @param   {uint32} bit   The bit to set
        @returns {uint32}       The result of OR operation
    */
    function bitSet(uint32 flags, uint32 bit) returns (uint32) {
        return flags | bit;
    }
    
    /*
        Clear the provided bit in the flags container.
        
        @param   {uint32} flags The flags containing variable
        @param   {uint32} bit   The bit to clear
        @returns {uint32}       The result after clear operation
    */
    function bitClr(uint32 flags, uint32 bit) returns (uint32) {
        return flags & ~bit;
    }
    
    /*
        Left shift input number of bits.
        
        @param   {uint32} input The containing variable
        @param   {uint32} bits  The number of bits to shift
        @returns {uint32}        The result after shift operation
    */
    function leftShift(uint32 input, uint32 bits) returns (uint32 ret) {
        return input * (2 ** bits);
    }
    
    /*
        Right shift input number of bits.
        
        @param   {uint32} input The containing variable
        @param   {uint32} bits  The number of bits to shift
        @returns {uint32}       The result after shift operation
    */
    function rightShift(uint32 input, uint32 bits) returns (uint32 ret) {
        return input / (2 ** bits);
    }
}
