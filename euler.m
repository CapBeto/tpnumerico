function [ R ] = euler( f, a, b, y0, h )
  M=ceil(abs((b-a)/h));
  Y = zeros( M + 1,ndims(y0) );
	T = (a : abs((b-a)/M) : b)';
	Y(1,:) = y0;
	for k = 1: M
		Y(k + 1, :) = Y(k, :) + h*feval(f, T(k), Y(k,:));
	endfor;
  % R = Y';
	R = [T Y];
endfunction
