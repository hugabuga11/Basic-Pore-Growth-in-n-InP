Latice=zeros(200); %Amount of Columns
Latice(1,round(length(Latice)/2))=1; %Chooses row 1 column 50 to be a 1
 %Chooses row 1 column 100 to be a 1

for i=1:150;
  [row,col]=find(Latice==1);  %Checks for 1's in Latice
  Latice=[Latice;zeros(1,size(Latice,2))]; %Adds a new row of 0's to the bottom of the matrix

 for j=1:length(row);

    %Random Pore Growth
    RNG=1:numel(row);
    RNG=RNG(randperm(length(row)));

    r=row(RNG(j));
    c=col(RNG(j));

    %Top left
  if c-2>0 && r-2>0
    if Latice(r-1,c)==0 && Latice(r-2,c)==0 && Latice(r,c-1)==0 && Latice(r-1,c-1)==0 && Latice(r-2,c-1)==0 && Latice(r,c-2)==0 && Latice(r-1,c-2)==0 && Latice(r-2,c-2)==0;
        Latice(r-1,c-1)=1;
    end
  end

    %Top right
  if c+2<=size(Latice,2) && r-2>0
    if Latice(r-1,c)==0 && Latice(r-2,c)==0 && Latice(r,c+1)==0 && Latice(r-1,c+1)==0 && Latice(r-2,c+1)==0 && Latice(r,c+2)==0 && Latice(r-1,c+2)==0 && Latice(r-2,c+2)==0;
       Latice(r-1,c+1)=1;
    end
  end

    %Bottom left
  if c-2>0 && r+2<=size(Latice,1)
    if Latice(r+1,c)==0 && Latice(r+2,c)==0 && Latice(r,c-1)==0 && Latice(r+1,c-1)==0 && Latice(r+2,c-1)==0 && Latice(r,c-2)==0 && Latice(r+1,c-2)==0 && Latice(r+2,c-2)==0;
      Latice(r+1,c-1)=1;
    end
  end

    %Bottom right
  if c+2<=size(Latice,2) && r+2<=size(Latice,1)
    if Latice(r+1,c)==0 && Latice(r+2,c)==0 && Latice(r,c+1)==0 && Latice(r+1,c+1)==0 && Latice(r+2,c+1)==0 && Latice(r,c+2)==0 && Latice(r+1,c+2)==0 && Latice(r+2,c+2)==0;
      Latice(r+1,c+1)=1;
    end
  end

    %Check to the left
  if c-2>0 && r-1>0
    if Latice(r,c-1)==0 && Latice(r,c-2)==0 && Latice(r-1,c-1)==0 && Latice(r-1,c-2)==0 && Latice(r+1,c-1)==0 && Latice(r+1,c-2)==0; %Checks the 2 columns left of the 1 and the one's diagonally down
      Latice(r,c-1)=1;
    end
  end

    %Check to the right
  if c+2<=size(Latice,2) && r-1>0
    if Latice(r,c+1)==0 && Latice(r,c+2)==0 && Latice(r-1,c+1)==0 && Latice(r-1,c+2)==0 && Latice(r+1,c+1)==0 && Latice(r+1,c+2)==0; %Checks the 2 columns right of the 1 and the one's diagonally down
       Latice(r,c+1)=1;
    end
  end

    %Check below
  if c-1>0 && c+1<=size(Latice,2) && r+2<=size(Latice,1)
    if Latice(r+1,c-1)==0 && Latice(r+1,c+1)==0 && Latice(r+2,c-1)==0 && Latice(r+2,c)==0 && Latice(r+2,c+1)==0;
      Latice(r+1,c)=1;
    end
  end

    %Check above
  if c-1>0 && c+1<=size(Latice,2) && r-2>0
    if Latice(r-1,c-1)==0 && Latice(r-1,c+1)==0 && Latice(r-2,c-1)==0 && Latice(r-2,c)==0 && Latice(r-2,c+1)==0;
      Latice(r-1,c)=1;
    end
   end
  end
end
imagesc(Latice);
axis equal;
figure(1);
%print('LaticeOutputDiag.eps','-depsc');  %Save as eps

