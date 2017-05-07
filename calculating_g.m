%% calculating g

    g = w .* 1 .* (Gx .* ex + Gy .* ey ) ./ cs^2;

    %     for a=1:9
    %         g(a) = w(a) * 1*(Gx*ex(a)+gy*ey(a))./cs^2;
    %     end