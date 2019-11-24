function [] = pruebas_tp()
  Y = zeros( 1, 2 );
  Y( 1 ) = 0; Y( 2 ) = 1;
  a = 0; b = 2; h = 0.1; M = 10;
  R = euler( yprima, a, b, Y, h, M );
  plot( R( 2 ) );
endfunction