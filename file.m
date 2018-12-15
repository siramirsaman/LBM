%% file writing for animating

if mod(loop_counter,1)==0
  s=num2str(ttt);
  A=fopen(s,'w');
  fprintf(A,' TITLE= "STEP Output"   VARIABLES= "I","J","U", "V"    ZONE T="Flow Field", I= %d , J= %d , F=POINT \n ',nx,ny);
  for j=1:ny
    for i=1:nx
      fprintf(A,'\n %f %f %f %f \n',i,j,U(i,j),V(i,j));
    end
  end
  fclose('all');
  ttt=ttt+1;
end
