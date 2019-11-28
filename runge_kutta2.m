function [ R ] = runge_kutta2( f, a, b, y0, h)
  M=ceil(abs((b-a)/h));
  Y = zeros( M + 1,ndims(y0) );
	T = (a : abs((b-a)/M) : b)';
	Y(1,:) = y0;
  
  for k = 1 : M
    k1 = h*feval(f, T(k), Y(k, :));
    k2 = h*feval(f, T(k) + h, Y(k, :));
    Y(k + 1, :) = Y(k, :) + ( k1 + k2 ) / 2;
  endfor
  
	R = [T Y];
endfunction