%% Calculating fluid force on the cylinder; momentum exchange approach


Force_x=0;
Force_y=0;
Force_x_second=0;
Force_y_second=0;

for j=1:ny
  for i=1:nx
    if isfluid(i,j)==0
      ff_x=0;
      ff_y=0;
      ff_x_second=0;
      ff_y_second=0;
      for a=-1:1
        for b=-1:1
          if isfluid(i+a,j+b)==1 % for b and a =+1 -1 0 different cases a+2 and b+3 return same results the desired ex and ey
            ff_x=-ex(a+2)*( 2*f(i+a,j+b,matrix_a_b(b+2,a+2)) ) + ff_x; %%*dx/dt first method suggested by J. Gotz et al, Large scale simulation of fluid structure using Lattice Boltzmann Methods and the 'physics engine'
            ff_y=-ey(b+3)*( 2*f(i+a,j+b,matrix_a_b(b+2,a+2)) ) + ff_y; %%*dx/dt same as above
            ff_x_second=-ex(a+2)*(f(i,j,matrix_a_b(-b+2,-a+2))   + f(i+a,j+b,matrix_a_b(b+2,a+2)) ) + ff_x_second;%*dx/dt
            ff_y_second=-ey(b+3)*(f(i,j,matrix_a_b(-b+2,-a+2))   + f(i+a,j+b,matrix_a_b(b+2,a+2)) ) + ff_y_second;%*dx/dt
          end
        end
      end

      Force_x=Force_x+ ff_x;
      Force_y=Force_y+ ff_y;
      Force_x_second=Force_x_second+ ff_x_second;
      Force_y_second=Force_y_second+ ff_y_second;
    end
  end
end

C_d_lattice_second= abs(Force_x_second)/(Uinitial)^2/(R);%based on second momentum method
% C_d_keeper(loop_counter)=C_d_lattice_second; % when converging, average
% cd can be calculated from values obtained by cd_keeper

fprintf(' %i Force_x= %f, cd second lattice=%f, dx/dt=%f, Uresidual = %f\n',loop_counter,  Force_x, C_d_lattice_second,dx/dt, Uresidual)
