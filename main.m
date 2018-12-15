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

feq_calculation

%% initializing f

f=feq;


%% MAIN LOOP

loop_counter = 1;

while Uresidual > Utol || Vresidual > Vtol

  %% calculating g

  calculating_g


  %% collision


  collision


  %% postcollision values for curved walls, for boundary nodes x_b

  if methode==2
    flippova
  elseif methode==3
    mei
  elseif methode==4
    bozidi
  elseif methode==5
    yu
  end

  %% C_D calculation

  C_D

  %% streaming

  streaming

  %% velocity calibration

  velocity_calibration


  %% Velocity and Pressure boundary


  He_Zou_pressure_velocity_boundary


  f = ftemp;


  %% Boundary condition bounce back boundary condition

  if methode==1
    bounceback
  end


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

  %% tecplot format file writing

  % file

end % end while loop


%% post processing

post_processing
