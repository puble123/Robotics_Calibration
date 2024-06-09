function Link2 = gen_Link2(ax,po,l,ro,ri,w,h)
% function information
% input ax        : draw space (vareiable)
%       po        : po(local origin);
%       l         : length
%       ro        : out radius (bigger than ri)
%       ri        : in radius (holes or pin size)
%       w         : pin - pin connect reactanguler size [m] 
%       h         : pin - pin connect reactanguler  size [m]
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
Vertices=zeros(92,3);
Vertices(1:16,:) = [[CO;CO],[ones(8,1)*(po(3)-0.5*h);ones(8,1)*(po(3)+0.5*h)]];
Vertices(17:32,:)= [[Ci;Ci],[ones(8,1)*(po(3)-0.5*h);ones(8,1)*(po(3)+0.5*h)]];
Vertices(33:48,:)= [Vertices(1:16,1)+l,Vertices(1:16,2:3)];
Vertices(49:64,:)= [Vertices(17:32,1)+l,Vertices(17:32,2:3)];
Vertices(65:80,:)= [Vertices(49:64,1:2),Vertices(49:64,3)+h];
b = ([-1 -1 -1 1 1 1]*(0.5*w)+po(3))';
Vertices(81:86,:)= [Vertices([8,1,2,10,9,16],1:2),b];
Vertices(87:92,:)= [Vertices([46:-1:44,36:38],1:2),flip(b)];


%% Genrate Faces
Faces = zeros(20,13); Faces(:,:) = nan;
Faces(1,1:11) = [1:5,21:-1:17,1];
Faces(2,1:11) = [5:8,1,17,24:-1:21,5];
Faces(3,1:11) = Faces(1,1:11)+8;
Faces(4,1:11) = Faces(2,1:11)+8;
Faces(5,1:11) = Faces(1,1:11)+32;
Faces(6,1:11) = Faces(2,1:11)+32;
Faces(7,1:11) = Faces(5,1:11)+8;
Faces(8,1:11) = Faces(6,1:11)+8;
Faces(9,1:11) = [1:5,13:-1:9,1];
Faces(10,1:11) = [5:8,1,9,16:-1:13,5];
Faces(11,1:11) = Faces(9,1:11)+16;
Faces(12,1:11) = Faces(10,1:11)+16;
Faces(13,1:11) = Faces(9,1:11)+32;
Faces(14,1:11) = Faces(10,1:11)+32;
Faces(15,1:11) = Faces(13,1:11)+8;
Faces(16,1:11) = Faces(14,1:11)+8;
Faces(17,1:5) = [81 86 87 92 81];
Faces(18,1:5)= [83 84 89 90 83];
Faces(19,1:7)= [84:89,84];
Faces(20,1:7)= [81 82 83 90 91 92 81];

Link2.body=patch(ax,"Faces",Faces,'Vertices',Vertices,'FaceColor','blue');
end

