function moving_robot(ax,PRR,jointdata)
u = [0,0,1]';
Nj = size(jointdata,1);
Link2_Vertices = PRR.Link2.body.Vertices;
Link3_Vertices = PRR.Link3.body.Vertices;
pt_line = line(ax,'LineStyle','-','Color','black','Marker','*',...
        'Markersize',0.5); 
pt_data = [];
ax.Title = text(20,20,"Moving Robot and Draw Path");

for k = 1:10:Nj
    G1 = get_G(u,PRR.origion',0,jointdata(k,1));
    G2 = get_G(u,PRR.p1',jointdata(k,2),0);
    G3 = get_G(u,PRR.p2',jointdata(k,3),0);

    % Link2 transform
    for k2 = 1:size(Link2_Vertices,1)
        dummy2 = G1*G2*[Link2_Vertices(k2,:)';1];
        PRR.Link2.body.Vertices(k2,:) = dummy2(1:3)';
    end
    % Link3 transform
    for k3 = 1:size(Link3_Vertices,1)
        dummy3 = G1*G2*G3*[Link3_Vertices(k3,:)';1];
        PRR.Link3.body.Vertices(k3,:) = dummy3(1:3)';
    end
    pt_data(end+1,:) = PRR.Link3.body.Vertices(end,:);
    set(pt_line,'xdata',pt_data(:,1),'ydata',pt_data(:,2),'zdata'...
        ,pt_data(:,3));
    set(PRR.Link3.prob,'xdata',PRR.Link3.body.Vertices(end-1:end,1),...
        'ydata',PRR.Link3.body.Vertices(end-1:end,2),...
        'zdata',PRR.Link3.body.Vertices(end-1:end,3));
    drawnow();
end