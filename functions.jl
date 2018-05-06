include("generic.jl")
include("problem.jl")

function ItegrateRKL2_Test(Steps::Int64,tau::Float64,init::Array{Float64,1})
	lf=length(init)
	Sol=Array{Float64,1}(lf)
	Sol=map(x->x,init)
	Sol[1]=0
	Sol[lf]=0
	for i=1:Steps
		Y=[map(x->x,Sol)	map(x->x,Sol)	map(x->x,Sol)]
		Y0=map(x->x,Sol)
		DD=maximum(map(x->D(x),init))
		t_parab=0.1*h*h/DD
		s=0.5*(sqrt(9+16*(tau/t_parab))-1)
		s=ceil(Int64,s)
		println("t_parab=$t_parab")
		ll=length(init)-1
		lf=length(init)
		Ksi=mu_2(1,s)
		println("mu_=$Ksi  s=$s")
		for j=2:ll
			J=Y[j,1]
			JP=Y[j+1,1]
			JM=Y[j-1,1]
			term=Ksi*tau*F(J,JP,JM,h)
			Y[j,2]=Y0[j]+term
		end
		Y[1,1]=0
		Y[lf,1]=0
		Sol=map(x->x,Y[:,2])
		Sol[1]=0
		Sol[lf]=0
		for i=2:s
			MU_2=mu_2(i,s)
			MU=mu(i)
			GAM=gam_2(i,s)
			NU=nu(i)
			K=1-MU-NU
			I_=((i-1)%3)+1
			I_P=((i)%3)+1
			I_M=((i-2)%3)+1
			for j=2:ll
				YJ=Y[j,((i-1)%3)+1]
				YJP=Y[j+1,((i-1)%3)+1]
				YJM=Y[j-1,((i-1)%3)+1]
				Y0J=Y0[j]
				Y0JM=Y0[j-1]
				Y0JP=Y0[j+1]
				term=MU_2*tau*F(YJ,YJP,YJM,h)
				term2=GAM*tau*F(Y0J,Y0JP,Y0JM,h)
				Y[j,(i%3)+1]=MU*Y[j,((i-1)%3)+1]+NU*Y[j,((i-2)%3)+1]+(1.-MU -NU)*Y0[j]+term+term2
			end
			Sol=map(x->x,Y[:,(s%3)+1])
			Sol[1]=0
			Sol[lf]=0
		end
	end
	return Sol
end

