%% collision

for j=1:ny
  for i=1:nx
    if isfluid(i,j) == 1
      for a=1:9
        temp = f(i,j,a) - (f(i,j,a) - feq(i,j,a))/Tau + g(a) ;
        f(i,j,a) = temp;
      end
    end
  end
end
