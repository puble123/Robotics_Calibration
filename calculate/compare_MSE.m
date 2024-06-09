function [preMSE,postMSE]= compare_MSE(jointdata,linkdata,calibration,errpoint)
preMSE = 0;
postMSE =0;

point_data1=Forward(linkdata,jointdata);
point_data2=Forward(calibration,jointdata);

Np = size(jointdata,1);
v  = zeros(1,3);

for k = 1:Np

    preMSE = preMSE + sqrt(sum(point_data1(k,:)-errpoint(k,:))^2);
    postMSE= postMSE+ sqrt(sum(point_data2(k,:)-errpoint(k,:))^2);


end

preMSE=preMSE/Np;
postMSE=postMSE/Np;

end

