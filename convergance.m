 %%  checking the convergance

    Uresidual = 0 ;
    Vresidual = 0 ;

    for I = 1 : 2*ii
        for J = 1 : ny

            if U(I,J)> 0
                Uresidual = Uresidual + abs(U(I,J)-Uold(I,J))/ U(I,J) ;
            end

            if V(I,J) > 0
                Vresidual = Vresidual + abs(V(I,J)-Vold(I,J))/ V(I,J) ;
            end

        end
    end

    Uold = U ;
    Vold = V ;

% %% loop counter 
%     loop_counter = loop_counter +1;