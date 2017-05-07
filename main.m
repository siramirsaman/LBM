clear all
clc


%% initial values

user_input


%% initializing - with respect to user inputs from previous step

initializer


%% sloid geometry defining

cylinder_geometry


%% velocity calibration

velocity_calibration

%% calculating equlibrium distribution based on each node form initial macroscopic values

% feq_calculation
%% feq calculation
    for j=1:ny
        for i=1:nx
            for a=1:9
                feq(i,j,a)=Rho(i,j) * w(a) * ...
                    (1 + 3 * ( ex(a)*U(i,j) + ey(a) * V(i,j) ) + ...
                    9.0/2.0 * ( ex(a)*U(i,j) + ey(a) * V(i,j) )^2 -...
                    3.0/2.0 *(U(i,j)^2+V(i,j)^2));
            end
        end
    end
%% initializing f

f=feq;


break
%% MAIN LOOP

loop_counter = 1;
tic
while loop_counter<3002
    
    %% calculating g
    
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %     calculating_g
    
    
    %% collision
    
    
    collision
    

    
    
    %% postcollision values for curved walls, for boundary nodes x_b
    
    %     if methode==2
    %         flippova
    %     elseif methode==3
    %         mei
    %     elseif methode==4
    %         bozidi
    %     elseif methode==5
    %         yu
    %     end
    
    %% C_D calculation
    
    % % % % % % % % % % % % % % % % % % % % % % % % %     C_D
    
    %% streaming
    
    streaming
    
%     if loop_counter==2
%         fid=fopen('test_ftemp.plt','w');
%         for j=1:ny
%             for i=1:nx
%                 for a=1:9
%                     fprintf(fid,'%f\n',ftemp(i,j,a));
%                 end
%             end
%         end
%         fclose(fid);
%         break
%     end
    %% velocity calibration
    
    velocity_calibration
    
    
    %% Velocity and Pressure boundary
    
    
    He_Zou_pressure_velocity_boundary
    
    
    
    %% f=ftemp
    
    
    f = ftemp;
    
    
    %% %% Boundary condition bounce back boundary condition
    
    %     if methode==1
    bounceback
    %     end
    
    
    %% velocity calibration
    
    velocity_calibration
    
    
    %% calculating macroscopic velocities
    
    
    calculating_macroscopic_velocities
    
    
    %% velocity calibration
    
    velocity_calibration
    
    %% pressure difference calculations
    
    % pressure
    
    %% RECALCULATING f equlibrium distribution based on each node form initial macroscopic values
    
    feq_calculation
    
    %%  checking the convergance
    
    convergance
    
    %% animate
    
     animate
    
    %% file writing
    
    % file
    loop_counter=loop_counter+1;
    

end % end while loop

toc

% for i=1:3
%     for j=1:3
%         for a=1:9
%             fprintf('%f\n',feq(i,j,a))
%         end
%     end
% end
% pause

%% post processing

% post_processing

