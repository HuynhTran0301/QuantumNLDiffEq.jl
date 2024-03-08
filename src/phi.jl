function phi(x, mapping::Product)
	return 2*asin(x)
end

function phi(x, mapping::ChebyshevSparse)
	return 2*acos(x)
end

function phi(x, mapping::ChebyshevTower)
	a = mapping.pc
	println(a)
	return a*acos(x)
end

