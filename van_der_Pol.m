function [dydT] = van_der_Pol(y, T)
  mu=1.5;
  dydT(1, 1) = y(2, 1);
  dydT(2, 1) = mu*( 1 - y( 1, 1 )^2 ) * y( 2, 1 ) - y( 1, 1);
endfunction