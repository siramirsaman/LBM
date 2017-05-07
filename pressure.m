 %% pressure difference calculations
    
    u_front_fluid=0;
    u_front_solid=0;
    u_back_fluid=0;
    u_back_solid=0;
    for ooo=40:48
        u_front_fluid=u_front_fluid+U(91,ooo);
    end
    for ooo=40:48
        u_front_solid=u_front_solid+U(92,ooo);
    end
    for ooo=40:48
        u_back_fluid=u_back_fluid+U(111,ooo);
    end
    for ooo=40:48
        u_back_solid=u_back_solid+U(110,ooo);
    end
        
    u_front_fluid= u_front_fluid/9;
    u_front_solid= u_front_solid/9;
    u_back_fluid=  u_back_fluid/9;
    u_back_solid=  u_back_solid/9;
    
        r_front_fluid=0;
    r_front_solid=0;
    r_back_fluid=0;
    r_back_solid=0;
    for ooo=49:57
        r_front_fluid=r_front_fluid+Rho(70,ooo);
    end
    for ooo=49:57
        r_front_solid=r_front_solid+Rho(71,ooo);
    end
    for ooo=49:57
        r_back_fluid=r_back_fluid+Rho(92,ooo);
    end
    for ooo=49:57
        r_back_solid=r_back_solid+Rho(91,ooo);
    end
        
    r_front_fluid= r_front_fluid/9;
    r_front_solid= r_front_solid/9;
    r_back_fluid=  r_back_fluid/9;
    r_back_solid=  r_back_solid/9;
    
    delta_p=1/3*(r_front_fluid-r_back_fluid);
    
  % fprintf('%f,%f,%f,%f,%f,%f,%f,%f,%f \n',
  % u_front_fluid,u_front_solid,u_back_fluid, u_back_solid,r_front_fluid,r_front_solid,r_back_fluid, r_back_solid,delta_p)