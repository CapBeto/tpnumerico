function [ R ] = euler( f, a, b, y0, h, mu)
  M=ceil(abs((b-a)/h));
  Y = zeros(ndims(y0), M + 1);
	T = (a : abs((b-a)/M) : b);
	Y(:, 1) = y0;
  
	for k = 1: M
		Y(:,k + 1) = Y(:, k) + h*feval(f, Y(:, k), T(k), mu);
	endfor;

	R = [T' Y'];
endfunction
