function phi(x, pc, ::Product)
	return pc*asin(x)
end

function phi(x, pc, ::ChebyshevSparse)
	return pc*acos(x)
end

function phi(x, pc, ::ChebyshevTower)
	return pc*acos(x)
end

