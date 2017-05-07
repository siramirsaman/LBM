    for j=1:ny
        for i=1:nx
            if isfluid(i,j) == 0  %%on down and upper boundaries

                temp = f(i,j,1);
                f(i,j,1) = f(i,j,3);
                f(i,j,3) = temp;

                temp = f(i,j,2);
                f(i,j,2) = f(i,j,4);
                f(i,j,4) = temp;

                temp = f(i,j,5);
                f(i,j,5) = f(i,j,7);
                f(i,j,7) = temp;

                temp = f(i,j,6);
                f(i,j,6) = f(i,j,8);
                f(i,j,8) = temp;
            end
        end
    end
