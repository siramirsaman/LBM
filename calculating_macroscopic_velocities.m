    %% calculating macroscopic velocities


    Rhotemp = 0 ;
    MomtempX = 0 ;
    MomtempY = 0 ;
    for I = 1 : nx
        for J = 1 : ny
            if isfluid(I,J) == 1
                for a = 1 : 9
                    Rhotemp = Rhotemp + f(I,J,a) ;
                    MomtempX = MomtempX + f(I,J,a)*ex(a) ;
                    MomtempY = MomtempY + f(I,J,a)*ey(a) ;
                end
                Rho(I,J) = Rhotemp ;
                U(I,J) = MomtempX /Rho(I,J) ;
                V(I,J) = MomtempY /Rho(I,J) ;
                Rhotemp = 0 ;
                MomtempX = 0 ;
                MomtempY = 0 ;
            end
        end
    end