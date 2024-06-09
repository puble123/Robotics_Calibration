function errpathcurve=add_ecurve(ax,errpathdata)

Np = size(errpathdata,1);
errpathcurve = line(ax);
errpathcurve.XData = [errpathdata(:,1);errpathdata(1,1)];
errpathcurve.YData = [errpathdata(:,2);errpathdata(1,2)];
errpathcurve.ZData = [errpathdata(:,3);errpathdata(1,3)];
set(errpathcurve,'LineStyle','none','Marker','s',...
    'MarkerEdgeColor','r','Markersize',3)
end

