function [] = pruebas_euler()
	close all;
	%f = @( t, y ) -y + t + 1;
  
  f = @( t, y ) ( y + 1 )*( t + 1 ) * cos( t^2 + 2*t );
  a = 0; b = 2; h = 0.1; y0 = 4; %M = 10;
	% a = 0; 
	% b = 1;
	% h = 0.1; 
	% M = 10;
	% y0 = 1;

  %	R = euler( f, a, b, y0, h, M );
  %	X = R( : , 2 ); 
  %	plot( X );
  R = euler( f, a, b, y0, h);
  plot( R( : , 2 ), "r", "linewidth", 3 );

endfunction
