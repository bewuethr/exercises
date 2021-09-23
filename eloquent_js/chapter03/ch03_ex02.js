function isEven(a) {
	a = a < 0 ? -a : a;
	if (a == 0) return true;
	if (a == 1) return false;
	return isEven(a-2);
}
