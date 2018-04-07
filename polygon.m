clear all
close all
clc

disp('Enter Window Size (lower left,upper right) : ');
in=input('','s');
wSize = str2double(regexp(in,' ','split'));
xMin=wSize(1);
yMin=wSize(2);
xMax=wSize(3);
yMax=wSize(4);


figure,
title("--- Polygon Clipped ---");
polygonDisplayFunction(xMin,yMin,xMax,yMax);

disp("Polygon Coordinates (X,Y)");
in=input('','s');
pSize = str2double(regexp(in,' ','split'));

L=length(pSize);
xPart=zeros(1);
yPart=zeros(1);
i=1;j=1;
while(i<=L)
    xPart(j)=pSize(i);
    yPart(j)=pSize(i+1);
    i=i+2;
    j=j+1;
    
end
plot(xPart,yPart,'red','linewidth',1);
hold on

L=length(xPart)
%For Clipped against left side
xClippedL=zeros(1); % store new clipped xpart
yClippedL=zeros(1); % store new clipped ypart
xi=1; % index for xpart list
yi=1; % index for ypart list
for i=2:1:L
    preX=xPart(i-1); % Pi-1 (previous)
    curX=xPart(i);   % Pi (current)
    preY=yPart(i-1);
    curY=yPart(i);
    if(preX>=xMin && curX>=xMin) %Pi-1 and Pi - both are to the left of the clipping line.
        xClippedL(xi)=curX;
        yClippedL(yi)=curY;
        xi=xi+1;
        yi=yi+1;
    elseif(preX<xMin && curX<xMin) %Pi-1 and Pi - both are to the right side of the clipping line.
        continue;
    elseif(preX>=wSize(2) && curX<wSize(2)) %Pi-1 to the left, but Pi to the right side of the clipping
        interX=wSize(2);
        interY=preY+(interX-preX)*((curY-preY)/(curX-preX));
        xClippedL(xi)=interX;
        yClippedL(yi)=interY;
        xi=xi+1;
        yi=yi+1;
        
    elseif(preX<wSize(2) && curX>=wSize(2)) %Pi-1 to right, but Pi to the left of the clipping line.
        interX=wSize(2);
        interY=preY+(interX-preX)*((curY-preY)/(curX-preX));
        xClippedL(xi)=interX;
        yClippedL(yi)=interY;
        xi=xi+1;
        yi=yi+1;
        xClippedL(xi)=curX;
        yClippedL(yi)=curY;
        xi=xi+1;
        yi=yi+1; 
    end
end
xClippedL(xi)=xClippedL(1);
yClippedL(yi)=yClippedL(1);

figure,
title("Clipped Against Left");
polygonDisplayFunction(xMin,yMin,xMax,yMax);
plot(xClippedL,yClippedL,'blue','linewidth',2);
hold on

xClippedB=zeros(1);
yClippedB=zeros(1);
xi=1;
yi=1;
for i=2:1:L
    preX=xClippedL(i-1);
    curX=xClippedL(i);
    preY=yClippedL(i-1);
    curY=yClippedL(i);
    if(preY>=wSize(2) && curY>=wSize(1))
        xClippedB(xi)=curX;
        yClippedB(yi)=curY;
        xi=xi+1;
        yi=yi+1;
    elseif(preY<wSize(2) && curY<wSize(2))
        continue;
    elseif(preY>=wSize(2) && curY<wSize(2))
        interY=wSize(2);
        interX=preX+(interY-preY)*((curX-preX)/(curY-preY));
        xClippedB(xi)=interX;
        yClippedB(yi)=interY;
        xi=xi+1;
        yi=yi+1;
        
    elseif(preY<wSize(2) && curY>=wSize(2))
        interY=wSize(2);
        interX=preX+(interY-preY)*((curX-preX)/(curY-preY));
        xClippedB(xi)=interX;
        yClippedB(yi)=interY;
        xi=xi+1;
        yi=yi+1;
        xClippedB(xi)=curX;
        yClippedB(yi)=curY;
        xi=xi+1;
        yi=yi+1;
        
    end
    
    
    
end
xClippedB(xi)=xClippedB(1);
yClippedB(yi)=yClippedB(1);

figure,
title("Clipped Against Bottom");
polygonDisplayFunction(xMin,yMin,xMax,yMax);
plot(xClippedB,yClippedB,'blue','linewidth',2);
hold on

xClippedR=zeros(1);
yClippedR=zeros(1);
xi=1;
yi=1;
for i=2:1:L
    preX=xClippedB(i-1);
    curX=xClippedB(i);
    preY=yClippedB(i-1);
    curY=yClippedB(i);
    if(preX<=wSize(3) && curX<=wSize(3))
        xClippedR(xi)=curX;
        yClippedR(yi)=curY;
        xi=xi+1;
        yi=yi+1;
    elseif(preX>wSize(3) && curX>wSize(3))
        continue;
    elseif(preX<=wSize(3) && curX>wSize(3))
        interX=wSize(3);
        interY=preY+(interX-preX)*((curY-preY)/(curX-preX));
        xClippedR(xi)=interX;
        yClippedR(yi)=interY;
        xi=xi+1;
        yi=yi+1;
        
    elseif(preX>wSize(3) && curX<=wSize(3))
        interX=wSize(3);
        interY=preY+(interX-preX)*((curY-preY)/(curX-preX));
        xClippedR(xi)=interX;
        yClippedR(yi)=interY;
        xi=xi+1;
        yi=yi+1;
        xClippedR(xi)=curX;
        yClippedR(yi)=curY;
        xi=xi+1;
        yi=yi+1;
        
    end
    
    
    
end
xClippedR(xi)=xClippedR(1);
yClippedR(yi)=yClippedR(1);
disp(xClippedR);
disp(yClippedR);

figure,
title("Clipped Against Right");
polygonDisplayFunction(xMin,yMin,xMax,yMax);
plot(xClippedR,yClippedR,'blue','linewidth',2);
hold on

xClippedU=zeros(1);
yClippedU=zeros(1);
xi=1;
yi=1;
for i=2:1:L
    preX=xClippedR(i-1);
    curX=xClippedR(i);
    preY=yClippedR(i-1);
    curY=yClippedR(i);
    
    if(preY<=wSize(4) && curY<=wSize(4))
        xClippedU(xi)=curX;
        yClippedU(yi)=curY;
        xi=xi+1;
        yi=yi+1;
    elseif(preY>wSize(4) && curY>wSize(4))
        continue;
    elseif(preY<=wSize(4) && curY>wSize(4))
        
        interY=wSize(4);
        
        interX=preX+(interY-preY)*((curX-preX)/(curY-preY));
        xClippedU(xi)=interX;
        yClippedU(yi)=interY;
        xi=xi+1;
        yi=yi+1;
        
    elseif(preY>wSize(4) && curY<=wSize(4))
        interY=wSize(4);
        interX=preX+(interY-preY)*((curX-preX)/(curY-preY));
        xClippedU(xi)=interX;
        yClippedU(yi)=interY;
        xi=xi+1;
        yi=yi+1;
        xClippedU(xi)=curX;
        yClippedU(yi)=curY;
        xi=xi+1;
        yi=yi+1;
        
    end
    
    
    
end
xClippedU(xi)=xClippedU(1);
yClippedU(yi)=yClippedU(1);
disp('');
disp(xClippedU);
disp(yClippedU);

figure,
title("Polygon Clipped Against Top");
polygonDisplayFunction(xMin,yMin,xMax,yMax);
plot(xClippedU,yClippedU,'blue','linewidth',2);
hold on

