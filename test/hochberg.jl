using Base.Test
using PValueAdjust

newPvalues = padjust([0.05, 0.03, 0.01, 0.5], method = :hochberg)
@test_approx_eq newPvalues [0.1, 0.09, 0.04, 0.5]

@test_approx_eq padjust([1, 0.5, 0.1, 0.001, 0.0001, 0.002], method = :hochberg) [1e+00, 1e+00, 3e-01, 5e-03, 6e-04, 8e-03]
@test_approx_eq padjust([0.05, 0.05, 0.05], method = :hochberg) [0.05, 0.05, 0.05]

@test all(padjust([1,1,1], method = :hochberg) .<= 1)

@test_throws DomainError padjust([-1], method = :hochberg)
@test_throws DomainError padjust([2], method = :hochberg)

@test padjust([0.5], method = :hochberg) == [0.5]
