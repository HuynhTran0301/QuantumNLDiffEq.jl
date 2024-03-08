function load(x, N, mapping::Product, pc)
	return repeat([phi(x, pc, mapping)], N)
end

function load(x, N, mapping::ChebyshevSparse, pc)
	return repeat([phi(x, pc, mapping)], N)
end

function load(x, N, mapping::ChebyshevTower, pc)
	return [i*phi(x, pc, mapping) for i in 1:N]
end

function new_circuit(DQC::DQCType, x, theta, n=1, v=0)
	tmp = load(x, DQC.N, DQC.afm, DQC.pc)
	f = [i == n ? tmp[i] .+ v : tmp[i] for i in 1:DQC.N]
	
	return chain(DQC.N, dispatch(DQC.fm, f), DQC.evol, dispatch(DQC.var, theta))
end
