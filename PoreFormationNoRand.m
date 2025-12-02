Latice=zeros(1,100);
Latice(1,round(length(Latice)/2))=1;

for i=1:100;
  [row, col]=find(Latice== 1);  %Checks for 1's in Latice
  Latice=[Latice;zeros(1,size(Latice,2))]; %Adds a new row of 0's to the bottom of the matrix

 for j=1:length(row);
    r=row(j);
    c=col(j);

    %Check to the left
  if c-2>0 && r-1>0
    if Latice(r,c-1)==0 && Latice(r,c-2)==0 && Latice(r-1,c-1)==0; %Checks the 2 columns left of the 1 and the one's diagonally down
       Latice(r,c-1)=1;
    end
  end


    %Check to the right
  if c+2<=size(Latice,2) && r-1>0
    if Latice(r,c+1)==0 && Latice(r,c+2)==0 && Latice(r-1,c+1)==0; %Checks the 2 columns right of the 1 and the one's diagonally down
       Latice(r,c+1)=1;
    end
  end

    %Check below
  if c-1>0 && c+1<=size(Latice,2)
    if Latice(r+1,c-1)==0 && Latice(r+1,c+1)==0;
       Latice(r+1,c)=1;
    end
  end
 end
end

imagesc(Latice);
AspectRatio=daspect();
axis equal; AspectRatio=daspect;
figure(1);
print('LaticeOutput.eps','-depsc');  %Save as eps

