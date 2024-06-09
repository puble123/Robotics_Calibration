function compare_joint(fig,Jointdata,calibrationJointdata)

Xdata = 1:size(Jointdata,1);

ax1 = axes(fig); ax2=axes(fig); ax3=axes(fig);
ax1.XLabel = text(20,20,'number of data');
ax2.XLabel = text(20,20,'number of data');
ax3.XLabel = text(20,20,'number of data');

ax1.YLabel = text(20,20,'\theta_{1} [m]');
ax2.YLabel = text(20,20,'\theta_{2} [rad]');
ax3.YLabel = text(20,20,'\theta_{3} [rad]');

ax1.Title=text(20,20,'Comparing Change Joint Angle \theta_{1}');
ax2.Title=text(20,20,'Comparing Change Joint Angle \theta_{2}');
ax3.Title=text(20,20,'Comparing Change Joint Angle \theta_{3}');

ax1.XGrid="on"; ax1.YGrid="on";
ax2.XGrid="on"; ax2.YGrid="on";
ax3.XGrid="on"; ax3.YGrid="on";

t1 = line(ax1); c1 = line(ax1);
t2 = line(ax2); c2 = line(ax2);
t3 = line(ax3); c3 = line(ax3);

subplot(3,1,1,ax1)
legend(ax1,[t1,c1],["befor \theta_{1}","after \theta_{1}"])
subplot(3,1,2,ax2)
legend(ax2,[t2,c2],["befor \theta_{2}","after \theta_{2}"]);
subplot(3,1,3,ax3)
legend(ax3,[t3,c3],["befor \theta_{3}","after \theta_{3}"]);

set(t1,'xdata',Xdata,'ydata',Jointdata(:,1),'color','red');
set(t2,'xdata',Xdata,'ydata',Jointdata(:,2),'color','red');
set(t3,'xdata',Xdata,'ydata',Jointdata(:,3),'color','red');
set(c1,'xdata',Xdata,'ydata',calibrationJointdata(:,1),'color','blue');
set(c2,'xdata',Xdata,'ydata',calibrationJointdata(:,2),'color','blue');
set(c3,'xdata',Xdata,'ydata',calibrationJointdata(:,3),'color','blue');

legend()


