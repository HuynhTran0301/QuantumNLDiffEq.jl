function phi(x, ::Product, pc)
	return pc*asin(x)
end

function phi(x, ::ChebyshevSparse, pc)
	return pc*acos(x)
end

function phi(x, ::ChebyshevTower, pc)
	return pc*acos(x)
end

