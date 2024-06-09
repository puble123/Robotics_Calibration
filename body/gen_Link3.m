function [Link3,pt] = gen_Link3(ax,po,l,ro,ri,w,h)
% function information
% input ax        : draw space (vareiable)
%       po        : po(local origin);
%       l         : length
%       ro        : out radius (bigger than ri)
%       ri        : in radius (holes or pin size)
%       w         : pin - pin connect reactanguler size [m] 
%       h         : pin - pin connect reactanguler  size [m]
% output pt       : 종단부 point
%% 원 정보
theta = 0:pi/4:2*pi-pi/4;
CO = zeros(8,2);
po = reshape(po,1,3);

for k = 1:length(theta)
    CO(k,:) = [ro*cos(theta(k)),ro*sin(theta(k))]+po(1:2);
end
Ci = zeros(8,2);
for k = 1:length(theta)
    Ci(k,:) = [ri*cos(theta(k)),ri*sin(theta(k))]+po(1:2);
end
%% Generate Vertex

Vertices=zeros(44,3);
Vertices(1:16,:) = [[CO;CO],[ones(8,1)*(po(3)-0.5*h);ones(8,1)*(po(3)+0.5*h)]];
Vertices(17:32,:)= [[Ci;Ci],[ones(8,1)*(po(3)-0.5*h);ones(8,1)*(po(3)-1.5*h)]];
b = ([-1 -1 -1 1 1 1]*(0.5*w)+po(3))';
Vertices(33:38,:)= [Vertices([8,1,2,10,9,16],1:2),b];
Vertices(39:42,:)= [Vertices([8,2,10,16],1:2),b(2:5)];
Vertices(39:42,1)= Vertices(39:42,1)+0.5*l;
p1 = po+[ro+0.5*l,0,0]; pt = p1+[0.5*l-ro,0,0];  p = [p1;pt];
Vertices(43,:) = p1;
Vertices(44,:) = pt;
probe=line(ax);set(probe,'xdata',Vertices(end-1:end,1),...
    'ydata',Vertices(end-1:end,2),...
    'zdata',Vertices(end-1:end,3),...
    "MarkerFaceColor",'red','Markersize',5,'Marker','s')

%% Genrate Faces
Faces = zeros(12,11); Faces(:,:) = nan;
Faces(1,1:11) = [1:5,21:-1:17,1];
Faces(2,1:11) = [5:8,1,17,24:-1:21,5];
Faces(3,1:9) = [25:32,25];
Faces(4,1:11) = [1:5,13:-1:9,1];
Faces(5,1:11) = [1,8:-1:5,13:16,9,1];
Faces(6,1:11) = Faces(4,1:11)+16;
Faces(7,1:11) = Faces(5,1:11)+16;
Faces(7,1:9) = Faces(3,1:9)-16;
Faces(8,1:6) = [36:38,42,41,36];
Faces(9,1:6) = [33:35,40,39,33];
Faces(10,1:5)= [35 36 41 40 35];
Faces(11,1:5)= [33 38 42 39 33];
Faces(12,1:5)= [39:42,39];
Link3.body=patch(ax,"Faces",Faces,'Vertices',Vertices,'FaceColor','green');
Link3.prob=probe;
end
