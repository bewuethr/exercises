class PixelEditor {
	constructor(state, config) {
		let {tools, controls, dispatch} = config;
		this.state = state;

		this.canvas = new PictureCanvas(state.picture, pos => {
			let tool = tools[this.state.tool];
			let onMove = tool(pos, this.state, dispatch);
			if (onMove) {
				return pos => onMove(pos, this.state, dispatch);
			}
		});

		this.controls = controls.map(Control => new Control(state, config));
		this.dom = elt("div", {}, this.canvas.dom, elt("br"),
			...this.controls.reduce((a, c) => a.concat(" ", c.dom), []));

		this.dom.tabIndex = 0;
		this.dom.addEventListener("keydown", event => {
			let toolObjKeys = Object.keys(tools);
			let toolKeys = toolObjKeys.map(t => t[0]);
			let key = event.key;
			if (toolKeys.includes(key) &&
				!event.ctrlKey && !event.metaKey && ! event.altKey)
			{
				event.preventDefault();
				let tool = toolObjKeys.find(t => t[0] == key);
				dispatch({tool});
			}
			else if (key == "z" && (event.ctrlKey || event.metaKey)) {
				event.preventDefault();
				dispatch({undo: true});
			}
		});
	}

	syncState(state) {
		this.state = state;
		this.canvas.syncState(state.picture);
		for (let ctrl of this.controls) ctrl.syncState(state);
	}
}
