using Zygote

function phi(x, mapping::Product)
	return 2*asin(x)
end

function phi(x, mapping::ChebyshevSparse)
	return 2*acos(x)
end

function phi(x, mapping::ChebyshevTower)
	return mapping.pc*acos(x)
end

