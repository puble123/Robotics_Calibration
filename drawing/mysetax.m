function ax = mysetax(f1,title,lm,label,view)
% data : [Title, axis limit, grid on/off, label]
ax = axes();
ax.Parent= f1;
ax.Title = text(0.5,0.5,title);
ax.XLim = lm(1:2);
ax.YLim = lm(3:4);
ax.ZLim = lm(5:6);
ax.XLabel=text(0.5,0.5,label(1));
ax.YLabel=text(0.5,0.5,label(2));
ax.ZLabel=text(0.5,0.5,label(3));
ax.DataAspectRatio = [1,1,1];
ax.XGrid = 'on';ax.YGrid = 'on';ax.ZGrid = 'on';
ax.Box = 'on';
ax.XLimMode = 'manual';ax.YLimMode = 'manual';ax.ZLimMode='manual';
ax.View = view;
end