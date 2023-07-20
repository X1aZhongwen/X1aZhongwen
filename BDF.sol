// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Graph {
    mapping(uint => uint[]) private adjacencyList;// 邻接表
    uint private vertexCount;// 顶点数  

    constructor(uint count) {
        vertexCount = count;
    }
    // 加边
    function addEdge(uint u, uint v) public {
        adjacencyList[u].push(v);
    }

    function bfs(uint startVertex) public view returns (uint[] memory) {
        bool[] memory visited = new bool[](vertexCount);
        uint[] memory result = new uint[](vertexCount);
        uint resultIndex = 0;
        uint[] memory queue = new uint[](vertexCount);
        uint front = 0;
        uint rear = 0;
        queue[rear++] = startVertex;
        visited[startVertex] = true;

        while (front != rear) {
            uint vertex = queue[front++];
            result[resultIndex++] = vertex;

            for (uint i = 0; i < adjacencyList[vertex].length; i++) {
                uint neighbor = adjacencyList[vertex][i];
                if (!visited[neighbor]) {
                    queue[rear++] = neighbor;
                    visited[neighbor] = true;
                }
            }
        }
        return result;
    }
}
