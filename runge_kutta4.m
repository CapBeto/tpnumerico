function [ R ] = runge_kutta4( f, a, b, y0, h, mu)
  M=ceil(abs((b-a)/h));
  Y = zeros(ndims(y0), M + 1);
	T = (a : abs((b-a)/M) : b);
	Y(:, 1) = y0;
   
  for k = 1: M
    k1 = h*feval( f, Y(:, k), T( k ), mu);
    %k1 = h*feval( f, T( k ), Y(k, :), mu);
    k2 = h*feval( f, Y(:, k) + k1 / 2, T( k ) + h / 2, mu);
    %k2 = h*feval( f, T( k ) + h / 2, Y(k, :) + (k1 * h)/ 2, mu);
    k3 = h*feval( f, Y(:, k) + k2 / 2, T( k ) + h / 2, mu);
    %k3 = h*feval( f, T( k ) + h / 2, Y(k, :) + (k2 * h)/ 2, mu);
    k4 = h*feval( f, Y(:, k) + k3, T( k ) + h, mu);
    %k4 = h*feval( f, T( k ) + h, Y(k, :) + k3*h, mu);
    Y(:, k+1) = Y(:, k) + ( k1 + 2*k2 + 2*k3 + k4 ) / 6;
    %Y(k + 1, :) = Y(k, :) + ( k1 + 2*k2 + 2*k3 + k4 ) / 6;
  endfor

	R = [T' Y'];
endfunction
