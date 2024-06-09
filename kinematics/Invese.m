function joint_data = Invese(link_data,point_data,sol)
%% function information
% get Joint angle -> invesekinematics
% input data  : link data  row 3 and col 1 [L1;L2;L3];
%             : point data row 3 and col 1 [px;py;pz];           
%             : sol   -1 -> theta3 is pi< theta3 <2pi
%             : sol    1 -> theta3 is 0<=theta3<=pi
% output data:: joint data row 3 and col 1 [theta1; theta2; theta3];

joint_data = zeros(3,1);
x= point_data(1); y=point_data(2); z=point_data(3);
L1=link_data(1); L2 = link_data(2); L3 = link_data(3);
joint_data(1) = z - L1;
joint_data(3) = acos((x^2+y^2-L2^2-L3^2)/(2*L2*L3));

if sol == -1
    joint_data(3) =  -joint_data(3);
end

% Check
if ~isreal(joint_data(3))
    fprintf("warnning: theta3 is no real %f \n",joint_data(3));
    fprintf("Check this number x^{2}+y^{2}-L_{2}^{2}-L_{3}^{2}>=0: %f\n"...
        ,x^2+y^2-L2^2-L3^2);
    joint_data=[];
    return
end

k1 = L2+L3*cos(joint_data(3));
k2 = L3*sin(joint_data(3));
joint_data(2) = atan2(-k2*x+k1*y,k1*x+k2*y);
end


