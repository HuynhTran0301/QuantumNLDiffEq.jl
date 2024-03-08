function phi(x, ::Product)
	return 2*asin(x)
end

function phi(x, ::ChebyshevSparse)
	return 2*acos(x)
end

function phi(x,::ChebyshevTower)
	return 2*acos(x)
end

