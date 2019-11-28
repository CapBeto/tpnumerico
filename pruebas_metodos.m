function[] = pruebas_metodos()
  close all;
	%f = @( t, y ) -y + t + 1;
  
  f = @(x,t) cos(t);% ( y + 1 )*( t + 1 ) * cos( t^2 + 2*t );
  a = 0; b = 2*pi; h = 0.1; y0 = 0;
  
  %   Calculo de parametros
  M=ceil(abs((b-a)/h));
  h=abs((b-a)/M);
	T = (a : h : b)';
  
  %   Resolviendo con el método de lsode
  R_lsode = lsode(f,y0,T);
  
  %   Resolviendo con el método de Euler
  R_euler = euler( f, a, b, y0, h);
  
  %   Resolviendo con Runge-Kutta 2
  R_rk2 = runge_kutta2( f, a, b, y0, h);
  
  %   Resolviendo con Runge-Kutta 4 
  R_rk4 = runge_kutta4( f, a, b, y0, h);
  
  figure(1)
  hold on
  grid on
  plot(T, sin(T), "k", "linewidth", 1 );%Funcion integrada analiticamente
  plot(T, R_euler( : , 2 ), "r", "linewidth", 3 );
  plot(T, R_rk2( : , 2 ), "b", "linewidth", 3 );
  plot(T, R_rk4( : , 2 ), "g", "linewidth", 3 );
  plot(T, R_lsode, "m", "linewidth", 3 );%Comparacion metodo lsode
  
endfunction