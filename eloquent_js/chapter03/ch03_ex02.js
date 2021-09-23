function isEven(a) {
	if (a == 0) return true;
	if (a == 1) return false;
	if (a < 0) return isEven(-a);
	return isEven(a - 2);
}
