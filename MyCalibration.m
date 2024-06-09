function data = MyCalibration(CP,R,N,linkdata,soltype)
%% 2021 12 15 CADCAM LAB Jinwoo Lee
% addpath forlder
addpath("data","body","calculate","kinematics","drawing")
% input data linkdata = [L1, L2, L3];
%            CP       = [Cx, Cy, Ho];
%            R        = Path radius;
%            N        = Number of point;
%            soltype  = 1 or 2 (solution 1 -> pi>theta3>0)
%                              (solution 2 -> 2pi>theta3>pi)
% output data Calibration Link length and Change of MSE
%% Path generate
[f0,PathData] = gen_path(CP,R,N);

%% Robot genrate
f1 = figure(); 
lm = [[-1,1]*sum(linkdata(2:3)),[-1,1]*sum(linkdata(2:3)),0,5*linkdata(1)];
ax1 = mysetax(f1,"3DOF PRR Robot",lm,["X[m]","Y[m]","Z[m]"],[0,0]);
PRR=Gen_PRR(ax1,linkdata,0.3,0.15,5,0.2,0.1); hold on;

%% workspace
sca=draw_workspace(ax1,PRR);
fprintf("Please Wait then clear Workspace\n"); pause(5);
delete(sca); ax1.Subtitle =[];

%%  Get Joint Angle
jointdata = get_joint(linkdata,PathData,soltype);
add_pathcurve(ax1,PathData)
moving_robot(ax1,PRR,jointdata);

f3 = figure(); 
ax2 = mysetax(f3,"Draw Path",lm,["X[m]","Y[m]","Z[m]"],[30,30]);
legend_list=draw_curve(ax2,linkdata,jointdata,PathData,"on");
err = get_Error(0.05,0.05,N,'on');
errcurve = err+PathData;
get_joint(linkdata,errcurve,soltype); %check Jacobian;
legend_list(end+1) = add_ecurve(ax2,errcurve);
ax2.Title=text(0.5,0.5,'Input Tool path and sensing Result');
legend(legend_list,"Input Curve","Generate Tool Path","Sensing Result");
add_ecurve(ax1,errcurve);

eps = Least_square(linkdata,jointdata,errcurve);
fprintf("Get Error Vector %f: \n",eps);

%% Calibration

f4 = figure();
calibrationlinkdata = linkdata + eps';
compare_curve(f4,jointdata,linkdata,calibrationlinkdata);
% ------------------------------plot theta---------------------------------
f5 = figure();
calibrationJointdata=get_joint(calibrationlinkdata,PathData,soltype);
compare_joint(f5,jointdata,calibrationJointdata);
[preMSE,postMSE]=compare_MSE(jointdata,linkdata,calibrationlinkdata,errcurve);
%% output data
data.calibrationlinkdata=calibrationlinkdata;
data.preMSE=preMSE;
data.postMSE=postMSE;
end