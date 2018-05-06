#A quick test#

println("
##########################################################
#THIS IS A QUICK TEST SCRIPT GENERATES INITIAL CONDITIONS#
#AND TIME PROGRESSES THEM AS DEFINED BY YOUR EQUATIONS IN#
#\"problem.jl\"#############################################
##########################################################
")

include("functions.jl")

INIT=[collect(0. : 50.);zeros(49)]
X=map(x->0.1*x,collect(0:99))
h=0.1

println("importing plotting packages:
please wait a minute")
using Plots
plotly()
println("done!")

pl1=plot(X,INIT,label="Initial Conditions",title="Stabilized RKL2 integrator dt =0.01")


println("ENTERING RKL2 LOOP")
SOL_RKL2=ItegrateRKL2_Test(10,0.005,INIT)
println("##########DONE##########
\n")
plot!(X,SOL_RKL2, label="RKL2 T=0.05")


println("ENTERING RKL2 LOOP")
SOL_RKL2=ItegrateRKL2_Test(20,0.01,INIT)
println("##########DONE##########
\n")
plot!(X,SOL_RKL2, label="RKL2 T=0.25")


println("ENTERING RKL2 LOOP")
SOL_RKL2=ItegrateRKL2_Test(50,0.01,SOL_RKL2)
println("##########DONE##########
\n")
plot!(X,SOL_RKL2, label="RKL2 T=0.75")


println("ENTERING RKL2 LOOP")
SOL_RKL2=ItegrateRKL2_Test(75,0.01,SOL_RKL2)
println("##########DONE##########
\n")
plot!(X,SOL_RKL2, label="RKL2 T=1.5")

println("generating plots")
gui(pl1)

