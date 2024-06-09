function [f,pathcurvepoint] = gen_path(CP,R,N,varargin)
% x->x(t), y->y(t) z->z(t)
% CP is Circle Center Point -> [Cx,Cy,Zo], R;
% Parameter -> t
R=abs(R);
pathcurvepoint = zeros(N,3);
t = linspace(0,4*pi,N);

for k = 1:N
    pathcurvepoint(k,:) = [CP(1)+R*cos(t(k)),CP(2)+R*sin(t(k)),...
        CP(3)+R*sin(0.5*t(k))];
end

f=figure();
lm=[-1,1,-1,1,-1,1]*R+[CP(1),CP(1),CP(2),CP(2),CP(3),CP(3)];
ax1 = mysetax(f,'Check Path curve XY plane',lm,["X[m]","Y[m]","Z[m]"],[0,90]);
ax2 = mysetax(f,'Check Path curve 3D plot',lm,["X[m]","Y[m]","Z[m]"],[30,30]);
path_line1 = line(ax1); path_line2 = line(ax2);
subplot(1,2,1,ax1); subplot(1,2,2,ax2);
set(path_line1,'xdata',pathcurvepoint(:,1),'ydata',pathcurvepoint(:,2),...
    'zdata',pathcurvepoint(:,3),'Linestyle','-','color','black',...
    'linewidth',2);
set(path_line2,'xdata',pathcurvepoint(:,1),'ydata',pathcurvepoint(:,2),...
    'zdata',pathcurvepoint(:,3),'Linestyle','-','color','black',...
    'linewidth',2);
end






