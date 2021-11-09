function byTagName(node, tagName) {
	let result = [];

	function inspect(node) {
		for (let child of node.children) {
			if (tagName.toUpperCase() == child.nodeName) {
				result.push(child);
			}

			inspect(child);
		}
	}
	inspect(node);

	return result;
}
