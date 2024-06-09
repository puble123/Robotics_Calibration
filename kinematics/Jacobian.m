function JM = Jacobian(link_data,joint_data)
%% function information
% get Jacobian Matrix function:
% Jacobian Matrix size : row 6 and col 3
% input data : link data : row 1 and col 3 or row 3 and col 1             
%            : joint_data: row 1 and col 3 or row 1 and col 3
% output data: JM -> Jacobian Matrix
%% function start
JM = [];
if isempty(joint_data)
    fprintf("t_v(Joint Angle data) is empty so, Check Joint Anlge \n");
    return
else
    [n,m]=size(joint_data);
    if n*m~=3
        fprintf("t_v(Joint Angle data) is 1x3 or 3x1 so, Check Link Length data \n");
        return
    end
end

if isempty(link_data)
    fprintf("Link length vector is emtpy so, Check Link Length data \n");
    return
else
    [n,m]=size(link_data);
    if n*m == 3   
        JM = zeros(6,3);
        JM([3,6],:) = [1 0 0;0 1 1];
        alp = sum(joint_data(2:3)); th2 = joint_data(2);
        JM(1:2,2:3)=[-link_data(3)*sin(alp);link_data(3)*cos(alp)]*[1,1]...
            + [-link_data(2)*sin(th2);link_data(2)*cos(th2)]*[0,1];
    else
        fprintf("Link length vector is 1x3 or 3x1 so, Check Link Length data \n");
    end
end

    