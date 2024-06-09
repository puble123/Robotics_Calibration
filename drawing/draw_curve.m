function legend_list = draw_curve(ax,linkdata,jointdata,pathcurve,option)
%% function information (animation view)
% input ax        : draw space (vareiable)
%       linkdata  : [L1,L2,L3] -> pt = [L1,L2,L3];
%       jointdata : [t1,t2,t3]
%       pathcurve : [x,y,z]
%       option    : defualt "off", "on" The link of the robot is simply 
%                   expressed with a line.
%% =========================initial setting================================
Np= size(pathcurve,1);
L1 = linkdata(1); L2 = linkdata(2); L3 = linkdata(3);
cental = line(ax);
Pl = line(ax);
Jl = line(ax); 
Cl = line(ax);

Xdata=zeros(Np,1); Xdata(:)=nan; Ydata=Xdata; Zdata=Xdata;
set(cental,'xdata',[0,0],'ydata',[0,0],'zdata',[0,L3*5], ...
    'Linestyle','-.','Linewidth',1,'Color','black'); %robot's base z axis
set(Pl,'xdata',pathcurve(:,1),'ydata',pathcurve(:,2),...
    'zdata',pathcurve(:,3),'Linestyle','--','Linewidth',1,'Color','red');
%% ========================= Draw Curve ===================================
% using matlab animation

if option == "on"
    for k = 1:Np
        alpha = sum(jointdata(k,2:3)); theta2 =jointdata(k,2);
        xdata = [0,L2*cos(theta2),L2*cos(theta2)+L3*cos(alpha)];
        ydata = [0,L2*sin(theta2),L2*sin(theta2)+L3*sin(alpha)];
        zdata = [L1,L1,L1]+jointdata(k,1);
        set(Jl,'xdata',xdata,'ydata',ydata,'zdata',zdata,'Linewidth',1,'Color','black');
        Xdata(k)=xdata(end); Ydata(k)=ydata(end); Zdata(k)=zdata(end);
        set(Cl,'xdata',Xdata,'ydata',Ydata,'zdata',Zdata,'Linewidth',1,'Color','blue');
        drawnow();
    end
elseif option == "off"
    for k=1:Np
        alpha = sum(jointdata(k,2:3)); theta2 =jointdata(k,2);
        xdata = L2*cos(theta2)+L3*cos(alpha);
        ydata = L2*sin(theta2)+L3*sin(alpha);
        zdata = L1+jointdata(k,1);
        set(Jl,'xdata',xdata,'ydata',ydata,'zdata',zdata,'Linewidth',1,'Color','black');
        Xdata(k)=xdata; Ydata(k)=ydata; Zdata(k)=zdata;
        set(Cl,'xdata',Xdata,'ydata',Ydata,'zdata',Zdata,'Linewidth',1,'Color','blue');
        drawnow();
    end
else
    frpintf("option error : option on/off")
end
legend_list = [Pl,Cl];
end

