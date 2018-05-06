d_x(i,ip,im,h)=(ip-im)/(2*h)

d_xx(i,ip,im,h)=(ip+im-2i)/(h^2)

function b(j)
	J=convert(Float64,j)
	if j < 3
		B=0.33333333333333333
	else
		B=(J^2 + J -2)/(2J*(J+1))
	end
	return B
end

function w(s)
	S=convert(Float64,s)
	W=4/(S^2 + S -2)
	return W
end

function mu(j)
	J=convert(Float64,j)
	MU=((2J-1)/J)*(b(j)/b(j-1))
	return MU
end

function nu(j)
	J=convert(Float64,j)
	NU=-((J-1)/J)*(b(j)/b(j-2))
	return NU
end

mu_2(j,s)=mu(j)*w(s)

function gam_2(j,s)
	GAM=-mu_2(j,s)*(1-b(j-1))
	return GAM
end


