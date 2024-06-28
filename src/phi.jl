using Zygote

# Define phi functions for each type
function phi(x, mapping::Product)
    return asin(x)
end

function phi(x, mapping::ChebyshevSparse)
    return mapping.pc * acos(x)
end

function phi(x, mapping::ChebyshevTower)
    if x < 1
        return mapping.pc * acos(x)
    elseif x >= 1
        return mapping.pc * acosh(x)
    else
        error("Input x must be greater or equal to 0")
    end
end

# Define gradient functions with proper method dispatching
grad_phi_with_respect_to_x(x, mapping::Product) = 1 / sqrt(1 - x^2)
grad_phi_with_respect_to_x(x, mapping::ChebyshevSparse) = -mapping.pc / sqrt(1 - x^2)
# grad_phi_with_respect_to_x(x, mapping::ChebyshevTower) = -mapping.pc / sqrt(1 - x^2)
function grad_phi_with_respect_to_x(x, mapping::ChebyshevTower)
    if x < 1
        return -mapping.pc / sqrt(1 - x^2)
    elseif x >= 1
        return mapping.pc / sqrt(x^2 - 1)
    end
end

# Define adjoints for phi with proper type dispatching
Zygote.@adjoint phi(x, mapping::Product) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)
Zygote.@adjoint phi(x, mapping::ChebyshevSparse) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)
Zygote.@adjoint phi(x, mapping::ChebyshevTower) = phi(x, mapping), Δ -> (Δ * grad_phi_with_respect_to_x(x, mapping), nothing)
