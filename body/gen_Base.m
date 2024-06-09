function Base = gen_Base(ax,react,ro,ri,H,h)
% function information
% input 
%       react     : [base,height]
%       ro        : Link1 rod radius
%       ri        : base rod radius
%       H         : base rod Height
%       h         : base rod height
% output
%       Base      : One bord(reactanguler) and One rod, one Link1(rod)
%                 : Origin is global origin (0,0,0) and bord center same
%                 : rod height is H and radius ri
%                 : Link1 height is h radius is ro
%========================function==========================================
%% 사각형 생성
react = abs(react); react = react+0.01; %0 방지;
Box = [-0.5*react(1),-0.5*react(2);...
    0.5*react(1),-0.5*react(2);...
    0.5*react(1),0.5*react(2);...
    -0.5*react(1),0.5*react(2)];
%% 로드 원 정보
theta = 0:pi/4:2*pi-pi/4;
CO = zeros(8,2);
for k = 1:length(theta)
    CO(k,:) = [ro*cos(theta(k)),ro*sin(theta(k))];
end
Ci = zeros(8,2);
for k = 1:length(theta)
    Ci(k,:) = [ri*cos(theta(k)),ri*sin(theta(k))];
end
%% Generate Vertex
Vertices = zeros(36,3);
Vertices(1:4,:) = [Box,zeros(4,1)];
Vertices(5:20,:) = [[CO;CO],[zeros(8,1);ones(8,1)*h]];
Vertices(21:36,:) = [[Ci;Ci],[ones(8,1)*h;ones(8,1)*H]];

%% Generate Face information
Faces = zeros(7,11); Faces(:,:) = nan; %빈공간은 nan처리.
Faces(1,1:5) = [1:4,1];
Faces(2,1:9) = [13:20,13];
Faces(3,:)   = [5:9,17:-1:13,5];
Faces(4,:)   = [9:12,5,13,20:-1:17,9];
Faces(5,1:9) = Faces(2,1:9) + 16;
Faces(6:7,:) = Faces(3:4,:) + 16;

Base.body=patch(ax,"Faces",Faces,'Vertices',Vertices,'FaceColor','red');
end

