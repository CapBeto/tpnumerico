function [] = pruebas_tp()
  close all;
  clear all;
  graphics_toolkit gnuplot
%  pkg load optim
  
  y0 = zeros(1, 2);
  y0(1,1) = 0; y0(1,2) = 1;
  a = 0; b = 30; h = 0.1;
  
  R_euler        = euler(@van_der_Pol, a, b, y0, h);
  R_runge_kutta2 = runge_kutta2(@van_der_Pol, a, b, y0, h);
  R_runge_kutta4 = runge_kutta4(@van_der_Pol, a, b, y0, h);
  
  figure(1)
  hold on
  plot(R_euler(:,1),R_euler(:,2),'r','Linewidth',5)
  LEYENDA_euler=sprintf('Euler');
  plot(R_runge_kutta2(:,1),R_runge_kutta2(:,2),'b','Linewidth',3)
  LEYENDA_rk2=sprintf('Runge-Kutta de orden 2');
  plot(R_runge_kutta4(:,1),R_runge_kutta4(:,2),'g','Linewidth',5)
  LEYENDA_rk4=sprintf('Runge-Kutta de orden 4');
  legend(LEYENDA_euler,LEYENDA_rk2,LEYENDA_rk4,'Location','Northeast')
  xlabel('Tiempo[s]')
  ylabel('Tension[V]')
  %axis([ 0 0 0 0 ])
  grid minor
  print('PLT_SEDO_van_der_pol','-dpng');
  figure(2)
  hold on
  plot(R_euler(:,2),R_euler(:,3),'r','Linewidth',5)
  LEYENDA_euler=sprintf('Euler');
  plot(R_runge_kutta2(:,2),R_runge_kutta2(:,3),'b','Linewidth',3)
  LEYENDA_rk2=sprintf('Runge-Kutta de orden 2');
  plot(R_runge_kutta4(:,2),R_runge_kutta4(:,3),'g','Linewidth',5)
  LEYENDA_rk4=sprintf('Runge-Kutta de orden 4');
  legend(LEYENDA_euler,LEYENDA_rk2,LEYENDA_rk4,'Location','Northeast')
  xlabel('Tiempo[s]')
  ylabel('Tension[V]')
  %axis([ 0 0 0 0 ])
  grid minor
  print('PLT_SEDO_van_der_pol_fase','-dpng');
endfunction