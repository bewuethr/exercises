function toArray(list) {
	let arr = [list.at];
	while (list.via) {
		list = list.via;
		arr.unshift(list.at);
	}

	return arr;
}

function findPath(a, b) {
	let work = [{at: a, via: null}];
	let seen = new Set([a]);

	for (let path of work) {
		let last = path.at;
		if (last == b) return toArray(path);

		for (let next of last.edges) {
			if (!seen.has(next)) {
				seen.add(next);
				work.push({at:next, via: path});
			}
		}
	}

	return null;
}

let graph = treeGraph(6, 7);
let start = Date.now();
console.log(findPath(graph[0], graph[graph.length - 1]).length);
console.log(Date.now() - start, "ms");
// Unoptimized, for treeGraph(6, 7):                  ~1200 ms
// Set instead of Array.any, for treeGraph(6, 7):     ~20 ms
// Set instead of Array.any, for treeGraph(7, 7):     ~100 ms
// Linked list instead of array, for treeGraph(7, 7): ~50 ms
// Linked list instead of array, for treeGraph(6, 7): ~12 ms
