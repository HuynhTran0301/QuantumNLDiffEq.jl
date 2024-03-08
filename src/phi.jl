using Zygote

function phi(x, mapping::Product)
	return 2*asin(x)
end
function grad_phi_with_respect_to_x(x, mapping::Product)
    # Actual gradient calculation specific to your operation
    return mapping.pc / sqrt(1 - x^2)
end
@adjoint phi(x, mapping::Product) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)



function phi(x, mapping::ChebyshevSparse)
	return 2*acos(x)
end
function grad_phi_with_respect_to_x(x, mapping::ChebyshevSparse)
    # Actual gradient calculation specific to your operation
    return -mapping.pc / sqrt(1 - x^2)
end
@adjoint phi(x, mapping::ChebyshevSparse) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)


function phi(x, mapping::ChebyshevTower)
	return mapping.pc*acos(x)
end

function grad_phi_with_respect_to_x(x, mapping::ChebyshevTower)
    # Actual gradient calculation specific to your operation
    return -mapping.pc / sqrt(1 - x^2)
end
@adjoint phi(x, mapping::ChebyshevTower) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)
