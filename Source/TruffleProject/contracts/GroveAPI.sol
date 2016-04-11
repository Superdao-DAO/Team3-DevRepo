// http://ethereum-grove.readthedocs.org/en/latest/

library GroveAPI {
    struct Index {
            bytes32 id;
            bytes32 name;
            bytes32 root;
            mapping (bytes32 => Node) nodes;
    }

    struct Node {
            bytes32 nodeId;
            bytes32 indexId;
            bytes32 id;
            int value;
            bytes32 parent;
            bytes32 left;
            bytes32 right;
            uint height;
    }

    function insert(Index storage index, bytes32 id, int value) public;
    function query(Index storage index, bytes2 operator, int value) public returns (bytes32);
}