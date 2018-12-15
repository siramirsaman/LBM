%% post processing


%% plotting Contour
j=1:ny;
i=1:nx;
figure
contourf(j,i,U)
title('contour of U velocity')
xlabel('Channel Height (Y)')
ylabel('Channel Length (X)')


%% file writing
A=fopen('fileee.plt','w');
 fprintf(A,' TITLE= "STEP Output" m  VARIABLES= "I","J","U", "V" m  ZONE T="Flow Field", I= %d , J= %d , F=POINT m',nx,ny);
for i=1:nx
    for j=1:ny
        fprintf(A,'%f %f %f %fm',i,j,U(i,j),V(i,j));
    end
end
fclose('all');