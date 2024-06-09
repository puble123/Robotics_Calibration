function eps = Least_square(linkdata,jointdata,err)

Np = size(jointdata,1);
A1 = eye(3); A2 = zeros(3);
A  = zeros(Np*3,3);
b  = zeros(Np*3,1);
L1 = linkdata(1); L2 = linkdata(2); L3=linkdata(3);

for k = 1:Np
    A2(2,3) = cos(jointdata(k,3)); 
    A2(3,2) = cos(jointdata(k,3));
    alpha = sum(jointdata(k,2:3));
    
    A(3*(k-1)+1:3*k,1:3) = A1 + A2;

    b(3*(k-1)+1:3*k) = [err(k,3) - jointdata(k,1)-L1;...
        err(k,1)*cos(jointdata(k,2))+err(k,2)*sin(jointdata(k,2))-L2-L3*cos(jointdata(k,3));...
        err(k,1)*cos(alpha)+err(k,2)*sin(alpha)-L2*cos(jointdata(k,3))-L3];
end

eps = inv(A'*A)*A'*b;
end
