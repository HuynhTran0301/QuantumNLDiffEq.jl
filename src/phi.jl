using Zygote

# Define phi functions for each type
function phi(x, mapping::Product)
    return asin(x)
end

function phi(x, mapping::ChebyshevSparse)
    return mapping.pc * acos(x)
end

function phi(x, mapping::ChebyshevTower)
    return mapping.pc * acos(x)
end

# Define gradient functions with proper method dispatching
grad_phi_with_respect_to_x(x, mapping::Product) = 1 / sqrt(1 - x^2)
grad_phi_with_respect_to_x(x, mapping::ChebyshevSparse) = -mapping.pc / sqrt(1 - x^2)
grad_phi_with_respect_to_x(x, mapping::ChebyshevTower) = -mapping.pc / sqrt(1 - x^2)

# Define adjoints for phi with proper type dispatching
Zygote.@adjoint phi(x, mapping::Product) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)
Zygote.@adjoint phi(x, mapping::ChebyshevSparse) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)
Zygote.@adjoint phi(x, mapping::ChebyshevTower) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)
