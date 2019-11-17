function [ R ] = runge_kutta4( f, a, b, y0, h, M )
  T = zeros( 1, M + 1 );
  Y = zeros( 1, M + 1 );
  T = a: h: b;
  Y( 1 ) = y0;
  
  for k = 1: M
    k1 = h*feval( f, T( k ), Y( k ) );
    k2 = h*feval( f, T( k ) + h / 2, Y( k ) + k1 / 2 );
    k3 = h*feval( f, T( k ) + h / 2, Y( k ) + k2 / 2 );
    k4 = h*feval( f, T( k ) + h, Y( k ) + k3 );
    Y( k + 1 ) = Y( k ) + ( k1 + 2*k2 + 2*k3 + k4 ) / 6;
  endfor

  R = [ T' Y' ];

endfunction
