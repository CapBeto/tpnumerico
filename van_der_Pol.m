function [dydT] = van_der_Pol(T, yprima)
  dydT = zeros(1, 2);
  dydT(1, 1) = yprima(1, 2);
%  dydT(1, 2) = -yprima(1, 1) + 4*yprima(1, 2)*( 1 - yprima( 1, 1 ) ^ 2 );
  dydT( 1, 2 ) = 1.5*( 1 - yprima( 1, 1 )^2 ) * yprima( 1, 2 ) - yprima( 1, 1);
endfunction