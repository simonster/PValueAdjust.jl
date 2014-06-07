# PValueAdjust
Some methods to adjust p-values for multiple comparisons in Julia. All methods take a vector of p-values and return a vector with adjusted values.

## Methods
### Bonferroni
Controls the Familywise error rate (FWER).
```jl
bonferroni([0.05, 0.03, 0.05])
# 4-element Array{Float64,1}:
# 0.2 
# 0.12
# 0.2 
# 0.04
#
```