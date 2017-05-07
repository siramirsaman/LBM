for j=1:ny
        for i=1:nx
            if isfluid(i,j) == 0
               %% b=2
              if isfluid(i,j+1) == 1
                  b=2;
                  a=4;
                  
                  y= jj + sqrt( R*R - (i-ii)*(i-ii) ) ;
                  delta(i,j,a)= abs(j+1 - y); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  if delta(i,j,a) >= 1/2
                  f(i,j,b)= (1/(2*delta(i,j,a)))*f(i,j+1,a) + (2*delta(i,j,a)-1)/(2*delta(i,j,a))* f(i,j+1,b);
           
                  end
                  if delta(i,j,a) < 1/2
                  f(i,j,b)= 2*delta(i,j,a)*  f(i,j+1,a) + ( 1 - 2*delta(i,j,a) )* f(i,j+2,b);
             
                  end
                  
                 
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
               %% 4
              if isfluid(i,j-1) == 1
                  b=4;
                  a=2;
                  y= jj - sqrt( R*R - (i-ii)*(i-ii) ) ;
                  delta(i,j,a)= abs(y - (j-1)); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  if delta(i,j,a) >= 1/2
                  f(i,j,b)= (1/(2*delta(i,j,a)))*f(i,j-1,a) + (2*delta(i,j,a)-1)/(2*delta(i,j,a))* f(i,j-1,b);
           
                  end
                  if delta(i,j,a) < 1/2
                  f(i,j,b)= 2*delta(i,j,a)*  f(i,j-1,a) + ( 1 - 2*delta(i,j,a) )* f(i,j-2,b);
             
                  end
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 1
               if isfluid(i+1,j) == 1
                  a=3;
                  b=1;
                  x= ii + sqrt( R*R - (j-jj)*(j-jj) ) ;
                  delta(i,j,a)= abs(i+1 - x); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  if delta(i,j,a) >= 1/2
                  f(i,j,b)= (1/(2*delta(i,j,a)))*f(i+1,j,a) + (2*delta(i,j,a)-1)/(2*delta(i,j,a))* f(i+1,j,b);
           
                  end
                  if delta(i,j,a) < 1/2
                  f(i,j,b)= 2*delta(i,j,a)*  f(i+1,j,a) + ( 1 - 2*delta(i,j,a) )* f(i+2,j,b);
             
                  end
                  %%%%%%%%%%%%%%%%%%%%%%%%%
               end
              %% 3
              if isfluid(i-1,j) == 1
                  a=1;
                  b=3;
                  x= ii - sqrt( R*R - (j-jj)*(j-jj) ) ;
                  delta(i,j,a)= abs(x - (i-1));
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  if delta(i,j,a) >= 1/2
                  f(i,j,b)= (1/(2*delta(i,j,a)))*f(i-1,j,a) + (2*delta(i,j,a)-1)/(2*delta(i,j,a))* f(i-1,j,b);
           
                  end
                  if delta(i,j,a) < 1/2
                  f(i,j,b)= 2*delta(i,j,a)*  f(i-2,j,a) + ( 1 - 2*delta(i,j,a) )* f(i-2,j,b);
             
                  end
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 5
              if isfluid(i+1,j+1) == 1
                  b =   j-ii-jj-i;
                  c =   1/2*( ii*ii + (j-jj-i)*(j-jj-i) - R*R );
                  x =   1/2*( -b + sqrt( b*b - 4*c ) );
                  y =   j + (x-i);
                   a=7;
                   bb=5;
                   delta(i,j,a) = sqrt(( (i+1 - x)*(i+1 - x) + (j+1 - y)*(j+1 - y))  )/sqrt(2);
                 
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                 if delta(i,j,a) >= 1/2
                  f(i,j,bb)= (1/(2*delta(i,j,a)))*f(i+1,j+1,a) + (2*delta(i,j,a)-1)/(2*delta(i,j,a))* f(i+1,j+1,bb);
           
                  end
                  if delta(i,j,a) < 1/2
                  f(i,j,bb)= 2*delta(i,j,a)*  f(i+1,j+1,a) + ( 1 - 2*delta(i,j,a) )* f(i+2,j+2,bb);
             
                  end
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 7
              if isfluid(i-1,j-1) == 1
                  b =   j-ii-jj-i;
                  c =   1/2*( ii*ii + (j-jj-i)*(j-jj-i) - R*R );
                  x =   1/2*( -b - sqrt( b*b - 4*c ) );
                  y =   j + (x-i);
                  a=5;
                  bb=7;
                  delta(i,j,a) = sqrt(1/2*( (x - (i-1) )*(x - (i-1) ) + (y - (j-1) )*(y - (j-1) )) );
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  if delta(i,j,a) >= 1/2
                  f(i,j,bb)= (1/(2*delta(i,j,a)))*f(i-1,j-1,a) + (2*delta(i,j,a)-1)/(2*delta(i,j,a))* f(i-1,j-1,bb);
           
                  end
                  if delta(i,j,a) < 1/2
                  f(i,j,bb)= 2*delta(i,j,a)*  f(i-1,j-1,a) + ( 1 - 2*delta(i,j,a) )* f(i-2,j-2,bb);
             
                  end
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 6
              if isfluid(i-1,j+1) == 1
                  b =   -j-ii+jj-i;
                  c =   1/2*(ii*ii +  (j-jj+i)*(j-jj+i) - R*R );
                  x =   1/2*( -b - sqrt( b*b - 4*c ) );
                  y =   j - (x-i);
                  a=8;
                  bb=6;
                  delta(i,j,a) = sqrt(1/2*( (x - (i-1) )*(x - (i-1) ) + (j+1 -y)*(j+1 -y)) ); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  if delta(i,j,a) >= 1/2
                  f(i,j,bb)= (1/(2*delta(i,j,a)))*f(i-1,j+1,a) + (2*delta(i,j,a)-1)/(2*delta(i,j,a))* f(i-1,j+1,bb);
           
                  end
                  if delta(i,j,a) < 1/2
                  f(i,j,bb)= 2*delta(i,j,a)*  f(i-1,j+1,a) + ( 1 - 2*delta(i,j,a) )* f(i-2,j+2,bb);
             
                  end
                  %%%%%%%%%%%%%%%%%%%%%%%%%
              end
              %% 8
              if isfluid(i+1,j-1) == 1
                   b =   -j-ii+jj-i;
                  c =   1/2*( ii*ii + (j-jj+i)*(j-jj+i) - R*R );
                  x =   1/2*( -b + sqrt( b*b - 4*c ) );
                  y =   j - (x-i);
                  a=6;
                  bb=8;
                  delta(i,j,a) = sqrt(1/2*( (i+1 - x)*(i+1 - x) + (y - (j-1))*(y - (j-1))) ); 
                  
                  %%%%%%%%%%%collision%%%%%%%%%%%%%
                  if delta(i,j,a) >= 1/2
                  f(i,j,bb)= (1/(2*delta(i,j,a)))*f(i+1,j-1,a) + (2*delta(i,j,a)-1)/(2*delta(i,j,a))* f(i+1,j-1,bb);
           
                  end
                  if delta(i,j,a) < 1/2
                  f(i,j,bb)= 2*delta(i,j,a)*  f(i+1,j-1,a) + ( 1 - 2*delta(i,j,a) )* f(i+2,j-2,bb);
             
                  end
                  %%%%%%%%%%%%%%%%%%%%%%%%%
                  
              end
             
            end
        end
    end