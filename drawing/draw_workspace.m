function sca=draw_workspace(ax,PRR)

ax.View = [30,30];
ax.Subtitle = text(20,20,'WorkSpace');

u = [0,0,1]';
pt = [PRR.Link3.body.Vertices(end,:),1]';
N = 20;

th1 = linspace(0,5,N); % Height limit 0~5m;
th2 = linspace(0,2*pi,N);
th3  = th2;

dummypoint4 = zeros(4,1);
scatpoint = zeros(N*N*N,3);
index =1; temp=[];

for k1 =1:N
    for k2 =1:N
        for k3 = 1:N
     
        G1 = get_G(u,PRR.origion',0,th1(k1));
        G2 = get_G(u,PRR.p1',th2(k2),0);
        G3 = get_G(u,PRR.p2',th3(k3),0);

        dummypoint4(:) = G1*G2*G3*pt;
        scatpoint(index,:) = dummypoint4(1:3);
        index = index+1;
        
        end
    end
end

sca=scatter3(ax,scatpoint(:,1),scatpoint(:,2),scatpoint(:,3),'b*');
end

