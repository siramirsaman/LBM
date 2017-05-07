%% initializing


%% lattice D2Q9
ex = [ 1  0 -1  0  1 -1 -1  1  0 ] ;
ey = [ 0  1  0 -1  1  1 -1 -1  0 ] ;
w  = [ 1/9 1/9 1/9 1/9 1/36 1/36 1/36 1/36 4/9 ] ;
cs = 1/sqrt(3) ;	% Cs sound speed
matrix_a_b=[7 4 8;3 9 1;6 2 5]; % matrix used in force calculation in convergance for finding a =0,1,2,...9
%% 
Gx =  0;         % Body force in lattice units in x direction gravity-
Gy =  0;            % Body force in lattice units in y direction

% dx = 2e-4 ;         % dx=channel height/number oflattices if it was a real situation
%dt is calculated dt = 1e-5 ;         % dt

Utol = 1e-3 ;		% Toelarnce of U
Vtol = 1e-3 ;		% Toelarnce of V
Uresidual = 100 ;
Vresidual = 100 ;

%% define the parameters to be used
f = zeros (nx,ny,9);
ftemp = zeros (nx,ny,9);
feq = zeros (nx,ny,10);
fstar = zeros (nx,ny,9);
U = zeros (nx,ny);
V = zeros (nx,ny);
UW = zeros (nx,ny);
VW = zeros (nx,ny);
Ubf= zeros (nx,ny);
Vbf= zeros (nx,ny);
Rho = zeros (nx,ny);
delta= zeros (nx,ny);


%% Initialization
U(:,:) = Uinitial ;
V(:,:) = Vinitial ;
Rho(:,:) = Rhoinitial ;

Uold = U ;
Vold = V ;

ttt=200000000;