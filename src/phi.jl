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
@adjoint phi(x, mapping::ChebyshevTower) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)
