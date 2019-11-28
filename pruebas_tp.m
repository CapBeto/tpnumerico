function [] = pruebas_tp()
  close all;
  clear all;
  graphics_toolkit gnuplot
  %	 pkg load optim
  
  y0 = zeros(2, 1);
  y0(1,1) = 0; y0(2,1) = 1;
  a = 0; b = 30; h = 0.1; mu = 2;
  M=ceil(abs((b-a)/h));
  h=abs((b-a)/M); #Calculo del nuevo h, igual o menor que el anterior
  T = (a : h : b);
  
  R_lsode        = lsode(@van_der_Pol, [0,1], T);
  R_euler        = euler(@van_der_Pol, a, b, y0, h, mu);
  R_runge_kutta2 = runge_kutta2(@van_der_Pol, a, b, y0, h, mu);
  R_runge_kutta4 = runge_kutta4(@van_der_Pol, a, b, y0, h, mu);
  R_Nystrom      = Nystrom(@van_der_Pol, a, b, y0, h, mu);

  #GRAFICO DE TENSION EN EL TIEMPO
  figure(1)
  hold on
  plot(T,R_lsode(:,1),'k','Linewidth',1)
  LEYENDA_lsode=sprintf('lsode');
  plot(R_euler(:,1),R_euler(:,2),'r','Linewidth',1)
  LEYENDA_euler=sprintf('Euler');
  plot(R_runge_kutta2(:,1),R_runge_kutta2(:,2),'g','Linewidth',1)
  LEYENDA_rk2=sprintf('Runge-Kutta de orden 2');
  plot(R_runge_kutta4(:,1),R_runge_kutta4(:,2),'b','Linewidth',1)
  LEYENDA_rk4=sprintf('Runge-Kutta de orden 4');
  plot(R_Nystrom(:,1),R_Nystrom(:,2),'c','Linewidth',1)
  LEYENDA_Nystrom=sprintf('Nystrom');
  legend(LEYENDA_lsode,LEYENDA_euler,LEYENDA_rk2,LEYENDA_rk4,LEYENDA_Nystrom,'Location','Northeast')
  xlabel('Tiempo[s]')
  ylabel('Tension[V]')
  %axis([ 0 0 0 0 ])
  grid minor
  print('PLT_SEDO_van_der_pol_osc','-dpng');
  
  #GRAFICO DE 
  figure(2)
  hold on
  plot(R_lsode(:,1),R_lsode(:,2),'k','Linewidth',1)
  plot(R_euler(:,2),R_euler(:,3),'r','Linewidth',1)
  plot(R_runge_kutta2(:,2),R_runge_kutta2(:,3),'g','Linewidth',1)
  plot(R_runge_kutta4(:,2),R_runge_kutta4(:,3),'b','Linewidth',1)
  plot(R_Nystrom(:,2),R_Nystrom(:,3),'c','Linewidth',1)
  legend(LEYENDA_lsode,LEYENDA_euler,LEYENDA_rk2,LEYENDA_rk4,LEYENDA_Nystrom,'Location','Northeast')
  xlabel('Tension[V]')
  ylabel('Tension[V]')
  %axis([ 0 0 0 0 ])
  grid minor
  print('PLT_SEDO_van_der_pol','-dpng');
endfunction
