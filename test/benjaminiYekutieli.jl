using Base.Test
using PValueAdjust

newPvalues = padjust([0.05, 0.03, 0.01, 0.5], method = :benjaminiYekutieli)
@test_approx_eq newPvalues [0.13888888888889, 0.125, 0.083333333333, 1]

@test_approx_eq padjust([1, 0.5, 0.1, 0.001, 0.0001, 0.002], method = :benjaminiYekutieli) [1.00000, 1.00000, 0.36750, 0.00735, 0.00147, 0.0098]
@test_approx_eq padjust([0.05, 0.05, 0.05], method = :benjaminiYekutieli) [0.0916666666667, 0.0916666666667, 0.0916666666667]
@test all(padjust([1.0 ,1.0, 1.0], method = :benjaminiYekutieli) .<= 1.0)

@test_throws DomainError padjust([-1], method = :benjaminiYekutieli)
@test_throws DomainError padjust([2], method = :benjaminiYekutieli)

@test padjust([0.5], method = :benjaminiYekutieli) == [0.5]
