function[] = pruebas_metodos()
  close all;
  f = @( t, y ) ( y + 1 )*( t + 1 ) * cos( t^2 + 2*t );
  
  a = 0; b = 2; h = 0.1; y0 = 4; M = 10;
  %   Resolviendo con el método de Euler
  R = euler( f, a, b, y0, h, M );
  plot( R, "g", "linewidth", 3 );
  
  hold on;
  %   Resolviendo con Runge-Kutta 2
  R = runge_kutta2( f, a, b, y0, h, M );
  plot( R, "b", "linewidth", 3 );
  
  %   Resolviendo con Runge-Kutta 4 
  hold on;
  R = runge_kutta4( f, a, b, y0, h, M );
  plot( R, "r", "linewidth", 3 );
endfunction