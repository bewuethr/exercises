const url = "https://eloquentjavascript.net/author";

fetch(url, {headers: {Accept: "text/plain"}})
	.then(resp => resp.text())
	.then(text => console.log(text));

fetch(url, {headers: {Accept: "text/html"}})
	.then(resp => resp.text())
	.then(text => console.log(text));

fetch(url, {headers: {Accept: "application/json"}})
	.then(resp => resp.json())
	.then(data => console.log(data));

fetch(url, {headers: {Accept: "application/rainbows+unicorns"}})
	.then(resp => console.log(resp.status, resp.statusText));
