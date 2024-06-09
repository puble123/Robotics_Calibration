function joint_data = get_joint(linkdata,pathcurve,sol)
Np = size(pathcurve,1);
joint_data = zeros(Np,3);
for k = 1:Np
    joint_data(k,:) = Invese(linkdata,pathcurve(k,:),sol);
    JM = Jacobian(linkdata,joint_data(k,:));
    if k ~= 1
        ND = det(JM([1,2],[2,3]));
        if PD * ND <=0
            fprintf("theta3 is zero so Changing Parameter\n")
        end
        PD = ND;
    else
        PD = det(JM([1,2],[2,3]));
    end
end


