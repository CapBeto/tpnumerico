function [] = pruebas_runge_kutta4()
  close all;
  f = @( t, y ) ( y + 1 )*( t + 1 ) * cos( t^2 + 2*t );
  
  y0 = 4; a = 0; b = 2; h = 0.2; M = 10;
  R = runge_kutta4( f, a, b, y0, h, M );
  
  plot( R( :, 2 ),"r" );

endfunction
 