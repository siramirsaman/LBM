%% Velocity and Pressure boundary, He & Zou

for j=1:ny

  rho0_in= (ftemp(1,j,9)+ftemp(1,j,2)+ftemp(1,j,4)+2.*(ftemp(1,j,3)+ftemp(1,j,6)+ftemp(1,j,7)))/(1-U(1,j));
  ru=rho0_in*U(1,j);
  rv=rho0_in*V(1,j);
  ftemp(1,j,1)= ftemp(1,j,3)+(2/3)*ru;
  ftemp(1,j,5)= ftemp(1,j,7)+  1/6*ru + 1/2*rv + 1/2*(ftemp(1,j,4)-ftemp(1,j,2));
  ftemp(1,j,8)= ftemp(1,j,6)+  1/6*ru - 1/2*rv + 1/2*(ftemp(1,j,2)-ftemp(1,j,4));



  U(nx,j)= -1+(ftemp(nx,j,9)+ftemp(nx,j,2)+ftemp(nx,j,4)+2.*(ftemp(nx,j,1)+ftemp(nx,j,5)+ftemp(nx,j,8)))/rho0_out;
  ru=rho0_out*U(nx,j);
  V(nx,j)=0;
  rv=rho0_out*V(nx,j);
  ftemp(nx,j,3)=ftemp(nx,j,1) - 2/3*ru;
  ftemp(nx,j,6)=ftemp(nx,j,8) + 1/2*(ftemp(nx,j,4)-ftemp(nx,j,2)) - 1/6*ru;
  ftemp(nx,j,7)=ftemp(nx,j,5) + 1/2*(ftemp(nx,j,2)-ftemp(nx,j,4)) - 1/6*ru;

end
