import {writeFileSync, readFileSync} from "fs";

const fileName = "./talks.json";

function loadTalks(fileName) {
	let storedTalks;
	try {
		storedTalks = JSON.parse(readFileSync(fileName, "utf8"));
	}
	catch(e) {
		storedTalks = {};
	}

	return Object.assign(Object.create(null), storedTalks);
}

SkillShareServer.prototype.updated = function() {
	this.version++;
	let response = this.talkResponse();
	writeFileSync(fileName, JSON.stringify(this.talks));
	this.waiting.forEach(resolve => resolve(response));
	this.waiting = [];
};

new SkillShareServer(loadTalks(fileName)).start(8000);
