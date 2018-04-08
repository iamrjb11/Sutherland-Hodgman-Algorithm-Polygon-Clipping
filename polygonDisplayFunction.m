function [] = polygonDisplayFunction(xMin,yMin,xMax,yMax)
    set(gca,'xtick',-5:1:5)
    set(gca,'ytick',-5:1:5)
    axis([-5 5 -5 5])
    hold on

    plot([-5 5],[0 0],'black','linewidth',1);
    hold on

    plot([0,0],[-5 5],'black','linewidth',1);
    hold on
    grid on
    plot([xMin,xMax,xMax,xMin,xMin],[yMin,yMin,yMax,yMax,yMin],'black','linewidth',1);
    hold on
end