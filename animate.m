%% animate

if mod(loop_counter,1)==0

  u = (sqrt(U.^2+V.^2));

  imagesc(u');
  axis equal off;
  drawnow
  fprintf(' Iteration = %i, Uresidual = %f, Vresidual = %f \n', loop_counter, Uresidual, Vresidual)
end
