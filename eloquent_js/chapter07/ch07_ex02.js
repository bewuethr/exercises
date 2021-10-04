function myRobot({place, parcels}, route) {
	if (route.length == 0) {
		let routes = parcels.map(p => {
			if (p.place != place) return {
				pickup: true,
				route: findRoute(roadGraph, place, p.place)
			};

			return {
				pickup: false,
				route: findRoute(roadGraph, place, p.address)
			};
		});

		route = routes.reduce((prev, cur) => {
			if (prev.route.length > cur.route.length) return cur;
			if (prev.route.length < cur.route.length) return prev;
			return cur.pickup ? cur : prev;
		}).route;
	}

	return {direction: route[0], memory: route.slice(1)};
}
