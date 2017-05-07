%% inputting from user
Uinitial = 0.1;	% Uinitial in lattice Units
Vinitial = 0.0 ;	% Vinitial in lattice Units
Rhoinitial = 1.0;	% Rhoinitial in lattice Units

fprintf('choose your method... (1)\n');
fprintf('1.bounceback\n');
fprintf('2.flippova\n');
fprintf('3.mei\n');
fprintf('4.bozidi\n');
fprintf('5.yu\n');


fprintf('\n>>>');
replymethode = input('');
if isempty(replymethode)
    replymethode = 1 ;
end
methode = replymethode;

Tau = 0.8 ;		% Tau - Relaxation time
fprintf('\nTau = ? (%d)\n',Tau);
replyTau = input('');
if isempty(replyTau)
    replyTau = Tau ;
end
Tau = replyTau;

R=11;
fprintf('\nR = ? (%d)\n',R);
replyR = input('');
if isempty(replyR)
    replyR = R ;
end
R = replyR;

if methode==2 || methode==3 || methode==5 %%wall rotation available only in two methods
    
    wall_rotation=0;
    
    fprintf('wall rotation = ? (%d)\n',wall_rotation);
    replywall_rotation = input('');
    
    if isempty(replywall_rotation)
        replywall_rotation = wall_rotation ;
    end
    
    wall_rotation = replywall_rotation;
end

nx=400;
fprintf('nx = ? (%d)\n',nx);
replynx = input('');
if isempty(replynx)
    replynx = nx ;
end
nx = replynx;

ny=100;
fprintf('ny = ? (%d)\n',ny);
replyny = input('');
if isempty(replyny)
    replyny = ny ;
end
ny = replyny;


Nu_physical= 1e-3;
fprintf('Nu_physical = ? (%f)\n',Nu_physical);
replyNu_physical = input('');
if isempty(replyNu_physical)
    replyNu_physical = Nu_physical ;
end
Nu_physical = replyNu_physical;


channel_height=0.01;
fprintf('channel_height = ? (%f)\n',channel_height);
replychannel_height = input('');
if isempty(replychannel_height)
    replychannel_height = Uinitial ;
end
channel_height = replychannel_height;


fprintf('U initial = ? (%f)\n',Uinitial);
replyu = input('');
if isempty(replyu)
    replyu = Uinitial ;
end
Uinitial = replyu;



Nu = (Tau-0.5)/3 ;
Re=Uinitial*2*ny/Nu;
Re_cylinder=Uinitial*2*R*3/(Tau-0.5);
FD=R*Rhoinitial*Uinitial^2/105.6430/Re_cylinder;
t_lattice=channel_height^2/ny^2/3*(Tau-1/2)/Nu_physical;
dt=t_lattice;
dx=channel_height/ny;
fprintf('*****************************************\n')
fprintf('               Re of flow  = %f              \n',Re)
fprintf('               Re Cylinder = %f              \n',Re_cylinder)
fprintf('               FD          = %f              \n',FD)
fprintf('               Tau         = %f              \n',Tau)
fprintf('               time lattice= %f              \n',t_lattice)
fprintf('*****************************************\n')
reply = input('Should I continue? Y/N [Y] \n','s');
if isempty(reply)
    reply = 'Y';
end
if reply == 'N' || reply == 'n'
    return
end