function [ R ] = runge_kutta2( f, a, b, y0, h, mu)
  M=ceil(abs((b-a)/h));
  Y = zeros(ndims(y0), M + 1);
	T = (a : abs((b-a)/M) : b);
	Y(:, 1) = y0;
  
  for k = 1 : M
    k1 = h*feval(f, Y(:, k), T(k), mu);
    %k2 = h*feval(f, T(k) + h, Y(k, :), mu);
    k2 = h*feval(f, Y(:, k)+h*k1, T(k) + h, mu);
    Y(:, k+1) = Y(:, k) + ( k1 + k2 ) / 2;
  endfor
  
	R = [T' Y'];
endfunction