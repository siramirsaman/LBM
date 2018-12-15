%% streaming
for i=1:nx

  in=i-1;
  ip=i+1;

  for j=1:ny
    if j>1
      jn=j-1;
    else
      jn=ny;
    end
    if j<ny
      jp=j+1;
    else
      jp=1;
    end

    % ftemp id distribution at time = t+1
    % f is distribution at current time
    if jn~=0
      ftemp(i , jn  , 4) = f(i,j,4);
    end
    ftemp(i , j   , 9) = f(i,j,9);
    if jp~=ny+1
      ftemp(i , jp  , 2) = f(i,j,2);
    end
    if in~=0
      ftemp(in, j   , 3) = f(i,j,3);
      if jp~=ny+1
        ftemp(in, jp  , 6) = f(i,j,6);
      end
      if jn~=0
        ftemp(in, jn  , 7) = f(i,j,7);
      end
    end
    if ip~=nx+1
      if jp~=ny+1
        ftemp(ip, jp  , 5) = f(i,j,5);
      end
      if jn~=0
        ftemp(ip, jn  , 8) = f(i,j,8);
      end
      ftemp(ip, j   , 1) = f(i,j,1);
    end
  end
end
