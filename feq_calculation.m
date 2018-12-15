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
