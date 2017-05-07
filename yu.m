for i=1:nx
        for j=1:ny
            if isfluid(i,j) == 0
               %% b=2
              if isfluid(i,j+1) == 1
                  b=2;
                  a=4;
                  
                  y= jj + sqrt( R^2 - (i-ii)^2 ) ;
                  delta(i,j,a)= abs(j+1 - y); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  UW(i,j)= R * wall_rotation;
                  VW(i,j)=0;
                  fwall= f(i,j+2,a) + delta(i,j,a)* ( f(i,j+1,a) - f(i,j+2,a) ) +   2 * w(a) * Rho(i,j+1) * 3 * ( ex(a)* UW(i,j) + ey(a) * VW(i,j));


                  f(i,j,b)= fwall + delta(i,j,a)/( 1 + delta(i,j,a) ) * ( f(i,j+1,b) -  fwall );
                            
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
               %% 4
              if isfluid(i,j-1) == 1
                  b=4;
                  a=2;
                  y= jj - sqrt( R^2 - (i-ii)^2 ) ;
                  delta(i,j,a)= abs(y - (j-1)); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  UW(i,j)= - R * wall_rotation;
                  VW(i,j)=0;
                  fwall= f(i,j-2,a) + delta(i,j,a)* ( f(i,j-1,a) - f(i,j-2,a) )+   2 * w(a) * Rho(i,j-1) * 3 * ( ex(a)* UW(i,j) + ey(a) * VW(i,j)) ;


                  f(i,j,b)= fwall + delta(i,j,a)/( 1 + delta(i,j,a) ) * ( f(i,j-1,b) -  fwall );
             
                  
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 1
               if isfluid(i+1,j) == 1
                  a=3;
                  b=1;
                  x= ii + sqrt( R^2 - (j-jj)^2 ) ;
                  delta(i,j,a)= abs(i+1 - x); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  UW(i,j)= 0;
                  VW(i,j)= - R * wall_rotation;
                  fwall= f(i+2,j,a) + delta(i,j,a)* ( f(i+1,j,a) - f(i+2,j,a) ) +   2 * w(a) * Rho(i+1,j) * 3 * ( ex(a)* UW(i,j) + ey(a) * VW(i,j));


                  f(i,j,b)= fwall + delta(i,j,a)/( 1 + delta(i,j,a) ) * ( f(i+1,j,b) -  fwall );
             
                 
                  %%%%%%%%%%%%%%%%%%%%%%%%%
               end
              %% 3
              if isfluid(i-1,j) == 1
                  a=1;
                  b=3;
                  x= ii - sqrt( R^2 - (j-jj)^2 ) ;
                  delta(i,j,a)= abs(x - (i-1));
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  UW(i,j)= 0;
                  VW(i,j)= R * wall_rotation;
                  fwall= f(i-2,j,a) + delta(i,j,a)* ( f(i-1,j,a) - f(i-2,j,a) )+   2 * w(a) * Rho(i-1,j) * 3 * ( ex(a)* UW(i,j) + ey(a) * VW(i,j)) ;


                  f(i,j,b)= fwall + delta(i,j,a)/( 1 + delta(i,j,a) ) * ( f(i-1,j,b) -  fwall );
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 5
              if isfluid(i+1,j+1) == 1
                  b =   j-ii-jj-i;
                  c =   1/2*( ii^2 + (j-jj-i)^2 - R^2 );
                  x =   1/2*( -b + sqrt( b^2 - 4*c ) );
                  y =   j + (x-i);
                   a=7;
                   bb=5;
                   delta(i,j,a) = sqrt(( (i+1 - x)^2 + (j+1 - y)^2)  )/sqrt(2);
                 
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  teta= atan( abs(     (y - jj) / (x - ii )    )); % angel of the intersection of wall point
                  UW(i,j)= abs( R * wall_rotation * cos(teta));
                  VW(i,j)= -abs(R * wall_rotation * sin(teta));
                  fwall= f(i+2,j+2,a) + delta(i,j,a)* ( f(i+1,j+1,a) - f(i+2,j+2,a) ) +   2 * w(a) * Rho(i+1,j+1) * 3 * ( ex(a)* UW(i,j) + ey(a) * VW(i,j));


                  f(i,j,bb)= fwall + delta(i,j,a)/( 1 + delta(i,j,a) ) * ( f(i+1,j+1,bb) -  fwall );
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 7
              if isfluid(i-1,j-1) == 1
                  b =   j-ii-jj-i;
                  c =   1/2*( ii^2 + (j-jj-i)^2 - R^2 );
                  x =   1/2*( -b - sqrt( b^2 - 4*c ) );
                  y =   j + (x-i);
                  a=5;
                  bb=7;
                  delta(i,j,a) = sqrt(1/2*( (x - (i-1) )^2 + (y - (j-1) )^2) );
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  teta= atan( abs(     (y - jj) / (x - ii )    )); 
                  UW(i,j)= -abs(R * wall_rotation * cos(teta));
                  VW(i,j)= abs(R * wall_rotation * sin(teta));
                  
                  fwall= f(i-2,j-2,a) + delta(i,j,a)* ( f(i-1,j-1,a) - f(i-2,j-2,a) )+   2 * w(a) * Rho(i-1,j-1) * 3 * ( ex(a)* UW(i,j) + ey(a) * VW(i,j)) ;


                  f(i,j,bb)= fwall + delta(i,j,a)/( 1 + delta(i,j,a) ) * ( f(i-1,j-1,bb) -  fwall );
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 6
              if isfluid(i-1,j+1) == 1
                  b =   -j-ii+jj-i;
                  c =   1/2*(ii^2 +  (j-jj+i)^2 - R^2 );
                  x =   1/2*( -b - sqrt( b^2 - 4*c ) );
                  y =   j - (x-i);
                  a=8;
                  bb=6;
                  delta(i,j,a) = sqrt(1/2*( (x - (i-1) )^2 + (j+1 -y)^2) ); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  teta= atan( abs(     (y - jj) / (x - ii )    )); 
                  UW(i,j)= abs(R * wall_rotation * cos(teta));
                  VW(i,j)= abs(R * wall_rotation * sin(teta));
                  
                  fwall= f(i-2,j+2,a) + delta(i,j,a)* ( f(i-1,j+1,a) - f(i-2,j+2,a) ) +   2 * w(a) * Rho(i-1,j+1) * 3 * ( ex(a)* UW(i,j) + ey(a) * VW(i,j));


                  f(i,j,bb)= fwall + delta(i,j,a)/( 1 + delta(i,j,a) ) * ( f(i-1,j+1,bb) -  fwall );
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 8
              if isfluid(i+1,j-1) == 1
                   b =   -j-ii+jj-i;
                  c =   1/2*( ii^2 + (j-jj+i)^2 - R^2 );
                  x =   1/2*( -b + sqrt( b^2 - 4*c ) );
                  y =   j - (x-i);
                  a=6;
                  bb=8;
                  delta(i,j,a) = sqrt(1/2*( (i+1 - x)^2 + (y - (j-1))^2) ); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  teta= atan( abs(     (y - jj) / (x - ii )    )); 
                  UW(i,j)= -abs(R * wall_rotation * cos(teta));
                  VW(i,j)= -abs(R * wall_rotation * sin(teta));
                  
                  fwall= f(i+2,j-2,a) + delta(i,j,a)* ( f(i+1,j-1,a) - f(i+2,j-2,a) ) +   2 * w(a) * Rho(i+1,j-1) * 3 * ( ex(a)* UW(i,j) + ey(a) * VW(i,j));


                  f(i,j,bb)= fwall + delta(i,j,a)/( 1 + delta(i,j,a) ) * ( f(i+1,j-1,bb) -  fwall );
                  %%%%%%%%%%%%%%%%%%%%%%%%%
                  
              end
             
            end
        end
    end
