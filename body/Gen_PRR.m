function PRR=Gen_PRR(ax,link_data,ro,ri,H,h,w)
% function information
% input ax        : draw space (vareiable)
%       link_data : [L1,L2,L3] -> pt = [L1,L2,L3];
%       ro        : out radius (bigger than ri)
%       ri        : in radius (holes or pin size)
%       H         : Base's rod Height[m]
%       h         : pin's rod Height[m]
%       w         : pin - pin connect reactanguler size [m]
% ==========================setting Link===================================
L1 = link_data(1); L2 = link_data(2); L3 = link_data(3);
%ax.View = [0,0]; 
%ax.Title=text(0.5,0.5,'Initial Posture');
% ===========================gen Base======================================
react = [1,1]*(L2+L3);
Base = gen_Base(ax,react,ro,ri,H,L1-1.5*h);
% ===========================gen Link======================================
p1 = [0,0,L1-h];
Link2 = gen_Link2(ax,p1,L2,ro,ri,w,h);
% ===========================gen Link======================================
p2 = [L2,0,L1];
[Link3,pt] = gen_Link3(ax,p2,L3,ro,ri,w,h);

PRR.Base = Base;
PRR.Link2 = Link2;
PRR.Link3 = Link3;

PRR.origion = [0,0,0];
PRR.p1 = p1;
PRR.p2 = p2;
PRR.pt = pt;
end