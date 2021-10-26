topScope.array = function(...values) {
	return values;
}

topScope.length = function(array) {
	return array.length;
}

topScope.element = function(array, n) {
	return array[n];
}
