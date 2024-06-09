function point_data=Forward(linkdata,jointdata)
Np = size(jointdata,1);
L1 = linkdata(1); L2=linkdata(2); L3=linkdata(3);
point_data = zeros(Np,3);
for k = 1:Np
    alpha = sum(jointdata(k,2:3));
    point_data(k,1) = L2*cos(jointdata(k,2)) + L3*cos(alpha);
    point_data(k,2) = L2*sin(jointdata(k,2)) + L3*sin(alpha);
    point_data(k,3) = L1+jointdata(k,1);
end
end