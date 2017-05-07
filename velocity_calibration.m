  %% velocity_calibration

    U(1,:)=Uinitial;
    V(1,:)=0;
%     V(nx,:)=0;
    rho0_out=1;
    rho0_in=1;
% %     U(:,1)= Uinitial;
% %     V(:,1)= 0;
% %     U(:,ny)= Uinitial;
% %     V(:,ny)= 0;

for i=1:nx
    for j=1:ny
        if isfluid(i,j)==0
            U(i,j)= 0.0;
            V(i,j)= 0.0;
        end
    end
end