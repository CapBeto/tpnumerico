function [] = euler2()
  % Vamos a usar una tolerancia en lugar de escribir los pasos
  
  %f = @( t, y ) -16 * y;
  f = @( t, w, v ) -w + 1.5*v*( 1 - w^2 );
  a = 0; b = 10; h = 0.001; M = 1000; tol = 0.0001;
  w0 = 0; v0 = 1;
  
  W = zeros( 1, M + 1 );
  V = zeros( 1, M + 1 );
  T = zeros( 1, M + 1 );
  T = a: h: b;
  W( 1 ) = w0;
  V( 1 ) = v0;
  norma = 1; k = 1;
  
  while ( norma > tol )
    W( k + 1 ) = W( k ) + h*V( k );
    V( k + 1 ) = V( k ) + h*feval( f, T( k ), W( k ), V( k ) );
    norma = norm( V( k + 1 ) - V( k ), inf );
    k = k + 1;
  endwhile
    
  plot( V, "r", "linewidth", 2 );
  hold on;
  plot( W, "b", "linewidth", 2 );
endfunction

  