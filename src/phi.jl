function phi(x, mapping::Product)
	return mapping.pc*asin(x)
end

function phi(x, mapping::ChebyshevSparse)
	return mapping.pc*acos(x)
end

function phi(x, ::ChebyshevTower)
	return mapping.pc*acos(x)
end

