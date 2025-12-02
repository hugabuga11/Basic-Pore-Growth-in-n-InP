Latice=zeros(500); %Amount of Columns
Latice(1,round(length(Latice)/2))=1; %Chooses row 1 column 50 to be a 1
 %Chooses row 1 column 100 to be a 1

for i=1:200;
  [row,col]=find(Latice==1);  %Checks for 1's in Latice
  Latice=[Latice;zeros(1,size(Latice,2))]; %Adds a new row of 0's to the bottom of the matrix

 for j=1:length(row);

    %Random Pore Growth
    RNG=1:numel(row);
    RNG=RNG(randperm(length(row)));

    r=row(RNG(j));
    c=col(RNG(j));

    DiagProbTR=0.5;
    DiagProbTL=0.5;
    DiagProbBR=0.5;
    DiagProbBL=0.5;

    LatProbL=0.5;
    LatProbR=0.5;
    LatProbU=0.5;
    LatProbD=0.5;

    %Top left
  if c-2>0 && r-2>0
    if Latice(r-1,c)==0 && Latice(r-2,c)==0 && Latice(r,c-1)==0 && Latice(r-1,c-1)==0 && Latice(r-2,c-1)==0 && Latice(r,c-2)==0 && Latice(r-1,c-2)==0 && Latice(r-2,c-2)==0;
       if rand()<DiagProbTL
        Latice(r-1,c-1)=1;
       end
    end
  end

    %Top right
  if c+2<=size(Latice,2) && r-2>0
    if Latice(r-1,c)==0 && Latice(r-2,c)==0 && Latice(r,c+1)==0 && Latice(r-1,c+1)==0 && Latice(r-2,c+1)==0 && Latice(r,c+2)==0 && Latice(r-1,c+2)==0 && Latice(r-2,c+2)==0;
       if rand()<DiagProbTR
        Latice(r-1,c+1)=1;
       end
    end
  end

    %Bottom left
  if c-2>0 && r+2<=size(Latice,1)
    if Latice(r+1,c)==0 && Latice(r+2,c)==0 && Latice(r,c-1)==0 && Latice(r+1,c-1)==0 && Latice(r+2,c-1)==0 && Latice(r,c-2)==0 && Latice(r+1,c-2)==0 && Latice(r+2,c-2)==0;
       if rand()<DiagProbBL
        Latice(r+1,c-1)=1;
       end
    end
  end

    %Bottom right
  if c+2<=size(Latice,2) && r+2<=size(Latice,1)
    if Latice(r+1,c)==0 && Latice(r+2,c)==0 && Latice(r,c+1)==0 && Latice(r+1,c+1)==0 && Latice(r+2,c+1)==0 && Latice(r,c+2)==0 && Latice(r+1,c+2)==0 && Latice(r+2,c+2)==0;
       if rand()<DiagProbBR
        Latice(r+1,c+1)=1;
       end
    end
  end

    %Check to the left
  if c-2>0 && r-1>0
    if Latice(r,c-1)==0 && Latice(r,c-2)==0 && Latice(r-1,c-1)==0 && Latice(r-1,c-2)==0 && Latice(r+1,c-1)==0 && Latice(r+1,c-2)==0; %Checks the 2 columns left of the 1 and the one's diagonally down
      if rand()<LatProbL
       Latice(r,c-1)=1;
      end
    end
  end

    %Check to the right
  if c+2<=size(Latice,2) && r-1>0
    if Latice(r,c+1)==0 && Latice(r,c+2)==0 && Latice(r-1,c+1)==0 && Latice(r-1,c+2)==0 && Latice(r+1,c+1)==0 && Latice(r+1,c+2)==0; %Checks the 2 columns right of the 1 and the one's diagonally down
      if rand()<LatProbR
       Latice(r,c+1)=1;
      end
    end
  end

    %Check below
  if c-1>0 && c+1<=size(Latice,2) && r+2<=size(Latice,1)
    if Latice(r+1,c-1)==0 && Latice(r+1,c+1)==0 && Latice(r+2,c-1)==0 && Latice(r+2,c)==0 && Latice(r+2,c+1)==0;
      if rand()<LatProbD
        Latice(r+1,c)=1;
      end
    end
  end

    %Check above
  if c-1>0 && c+1<=size(Latice,2) && r-2>0
    if Latice(r-1,c-1)==0 && Latice(r-1,c+1)==0 && Latice(r-2,c-1)==0 && Latice(r-2,c)==0 && Latice(r-2,c+1)==0;
      if rand()<LatProbU
       Latice(r-1,c)=1;
      end
    end
   end
  end
 end

imagesc(Latice);
axis equal;
figure(1);
%print('LaticeOutputDiag.eps','-depsc');  %Save as eps

