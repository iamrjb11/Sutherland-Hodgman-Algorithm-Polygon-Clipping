function [] = polygonDisplayFunction(xMin,yMin,xMax,yMax)
    set(gca,'xtick',-10:1:10)
    set(gca,'ytick',-10:1:10)
    axis([-10 10 -10 10])
    hold on

    plot([-10 10],[0 0],'black','linewidth',1);
    hold on

    plot([0,0],[-10 10],'black','linewidth',1);
    hold on
    grid on
    plot([xMin,xMax,xMax,xMin,xMin],[yMin,yMin,yMax,yMax,yMin],'black','linewidth',1);
    hold on
end