function [ R ] = runge_kutta2( f, a, b, y0, h, M )
  T = zeros( 1, M + 1 );
  Y = zeros( 1, M + 1 );
  T = a :h :b;
  for k = 1 : M
    k1 = h*feval( f, T( k ), Y( k ) );
    k2 = h*feval( f, T( k ) + h, Y( k ) );
    Y( k + 1 ) = Y( k ) + ( k1 + k2 ) / 2;
  endfor
%  R = [ T' Y' ];
  R = Y';
endfunction