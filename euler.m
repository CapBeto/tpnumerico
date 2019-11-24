function [ R ] = euler( f, a, b, y0, h, M )
	T = zeros( 1, M + 1 );
  Y = zeros( 1, M + 1 );
	T = a: h: b;
	Y( 1 ) = y0;
	for k = 1: M
		Y( k + 1 ) = Y( k ) + h*feval( f, T( k ), Y( k ) );
	endfor;
 % R = Y';
  
	R = [ T' Y' ];
endfunction
