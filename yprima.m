function [dydT ] = yprima( T, Y )
  dydT = zeros( 1, 2 );
  dydT( 1 ) = Y( 2 );
  dydT( 2 ) = -16 * Y( 1 );
endfunction