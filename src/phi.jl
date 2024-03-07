function phi(x, ::Product)
	return asin(x)
end

function phi(x, mapping::ChebyshevSparse)
    return mapping.pc*acos(x)
end

function phi(x, mapping::ChebyshevTower)
    return mapping.pc*acos(x)
end

