function [ R ] = Nystrom( f, a, b, y0, h, mu)
  M=ceil(abs((b-a)/h));
  Y = zeros(ndims(y0), M + 1);
	T = (a : abs((b-a)/M) : b);
	Y(:, 1) = y0;
  
  #Obtengo un valor adicional de arranque por Runge-Kutta de orden 4
  k = 1;
  k1 = h*feval( f, Y(:, k), T( k ), mu);
  k2 = h*feval( f, Y(:, k) + k1 / 2, T( k ) + h / 2, mu);
  k3 = h*feval( f, Y(:, k) + k2 / 2, T( k ) + h / 2, mu);
  k4 = h*feval( f, Y(:, k) + k3, T( k ) + h, mu);
  Y(:,k+1) = Y(:, k) + ( k1 + 2*k2 + 2*k3 + k4 ) / 6;
  
  #Teniendo los valores iniciales necesarios, aplico Nystrom
  for k = 2: M
    Y(:,k+1)=[2*h , 0 ; 0 , h^2]*feval(f, Y(:, k), T(k), mu)+[Y(1,k-1);-Y(2,k-1)+2*Y(2,k) ];
  endfor
  
  R = [T' Y'];
endfunction