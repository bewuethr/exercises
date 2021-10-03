function dominantDirection(text) {
	return countBy(text, char => {
		let script = characterScript(char.codePointAt(0));
		return script ? script.direction : "none";
	}).filter(({name}) => name != "none").
		reduce((a, b) => a.count > b.count ? a : b).name;
}
