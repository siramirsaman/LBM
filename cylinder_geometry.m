%% Cylinder nodes

isfluid = ones(nx,ny); % all nodes are part of fluid unless we note

% isfluid(:,1)  = 0; % south wall/ down wall
% isfluid(:,ny) = 0;% north wall / upper wall

ii=floor(nx/5+1);
jj=floor(ny/2+3);

for i=1:nx
    for j=1:ny
        if sqrt(  (i-ii)^2  +  (j-jj)^2  ) < R
            isfluid(i,j)=0;
            U(i,j)= 0.0;
            V(i,j)= 0.0;
        end
    end
end