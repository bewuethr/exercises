// Depend on ./graph module
const {buildGraph} = require("./graph");

const roads = [
    "Alice's House-Bob's House",   "Alice's House-Cabin",
    "Alice's House-Post Office",   "Bob's House-Town Hall",
    "Daria's House-Ernie's House", "Daria's House-Town Hall",
    "Ernie's House-Grete's House", "Grete's House-Farm",
    "Grete's House-Shop",          "Marketplace-Farm",
    "Marketplace-Post Office",     "Marketplace-Shop",
    "Marketplace-Town Hall",       "Shop-Town Hall"
];

// Not really needed - could call buildGraph directly
let roadArray = roads.map(r => r.split("-"));

exports.roadGraph = buildGraph(roadArray);
