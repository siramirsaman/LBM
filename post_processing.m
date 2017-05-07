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

%% file read
A=fopen('CUDA\LBMGPU\LBMGPU\U_100_plus_1.txt','r');
ii=fscanf(A,'U(%d,%d)=%f\n' );
for t=1:3:120000
    U_scnd(ii(t),ii(t+1))=ii(t+2);
    
end

fclose('all');


j=1:ny;
i=1:nx;
figure
contourf(j,i,U_scnd)
title('contour of U velocity')
xlabel('Channel Height (Y)')
ylabel('Channel Length (X)')