function [] = pruebas_runge_kutta2()
  close all;
  f = @( t, y ) -y + t + 1;
  a = 0; b = 1; h = 0.1; M = 10; y0 = 1;
  R = runge_kutta2( f, a, b, y0, h, M );
  X = R( : , 2 );
  plot( R );
  
endfunction