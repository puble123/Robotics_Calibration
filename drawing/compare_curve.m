function compare_curve(fig,jointdata,linkdata,calibrationlinkdata)

point_data1=Forward(linkdata,jointdata);
point_data2=Forward(calibrationlinkdata,jointdata);
lb=get_box([point_data1;point_data2]);
ax1 = mysetax(fig,"Compare curve",lb,["X[m]","Y[m]","Z[m]"],[0,90]);
ax2 = mysetax(fig,"Compare curve",lb,["X[m]","Y[m]","Z[m]"],[30,45]);
path_line1 = line(ax1); path_line2 = line(ax2);
path_line3 = line(ax1); path_line4 = line(ax2);
subplot(1,2,1,ax1); subplot(1,2,2,ax2);
set(path_line1,'xdata',point_data1(:,1),'ydata',point_data1(:,2),...
    'zdata',point_data1(:,3),'Linestyle','-','color','red',...
    'linewidth',2);
set(path_line2,'xdata',point_data2(:,1),'ydata',point_data2(:,2),...
    'zdata',point_data2(:,3),'Linestyle','--','color','blue',...
    'linewidth',2);
legend(path_line1,'Robot Arm Path')
set(path_line4,'xdata',point_data1(:,1),'ydata',point_data1(:,2),...
    'zdata',point_data1(:,3),'Linestyle','-','color','red',...
    'linewidth',2);
set(path_line3,'xdata',point_data2(:,1),'ydata',point_data2(:,2),...
    'zdata',point_data2(:,3),'Linestyle','--','color','blue',...
    'linewidth',2);
legend([path_line1,path_line2],'Robot Arm Path','Calibration Path');

end

