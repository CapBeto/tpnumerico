function [] = pruebas_euler()
	close all;
	f = @( t, y ) -y + t + 1;
	a = 0; 
	b = 1;
	h = 0.1; 
	M = 10;
	y0 = 1;

	R = euler( f, a, b, y0, h, M );
	X = R( : , 2 ); 
	plot( X );
endfunction
