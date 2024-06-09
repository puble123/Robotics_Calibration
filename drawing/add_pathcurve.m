function pl=add_pathcurve(ax,pathcurve)
%% function information (animation view)
% input ax        : draw space (vareiable)
%       linkdata  : [L1,L2,L3] -> pt = [L1,L2,L3];
%       jointdata : [t1,t2,t3]
%       pathcurve : [x,y,z]
%       option    : defualt "off", "on" The link of the robot is simply 
%                   expressed with a line.
%% =========================initial setting================================
Np= size(pathcurve,1);
Pl=line(ax);
set(Pl,'xdata',pathcurve(:,1),'ydata',pathcurve(:,2),...
    'zdata',pathcurve(:,3),'Linestyle','--','Linewidth',1,'Color','red');
end