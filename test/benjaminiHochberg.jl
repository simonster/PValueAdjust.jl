using Base.Test
using PValueAdjust

newPvalues = padjust([0.05, 0.03, 0.01, 0.5], method = :benjaminiHochberg)
@test_approx_eq newPvalues [0.06666666667, 0.06, 0.04, 0.5]

@test_approx_eq padjust([1, 0.5, 0.1, 0.001, 0.0001, 0.002], method = :benjaminiHochberg) [1.0, 0.6, 0.15, 0.003, 0.0006, 0.004]
@test_approx_eq padjust([0.05, 0.05, 0.05], method = :benjaminiHochberg) [0.05, 0.05, 0.05]

@test all(padjust([1,1,1], method = :benjaminiHochberg) .<= 1)

@test_throws DomainError padjust([-1], method = :benjaminiHochberg)
@test_throws DomainError padjust([2], method = :benjaminiHochberg)

@test padjust([0.5], method = :benjaminiHochberg) == [0.5]
