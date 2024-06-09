function err = get_Error(sigma,mu,n,option)

err = normrnd(mu,sigma,[n,3]);

% varagin is add plotting option
if nargin >= 4
    if option == "on"
        f=figure(100); hold on; box on; pbaspect([1,1,1]); grid on;
        axis([mu-3*sigma,mu+3*sigma,0,200]);
        title("Error(Normal Distridution)");
        xlabel("Error[m]"); ylabel("Number")
        a = histfit(reshape(err,1,n*3));
    elseif option == "off"
        fprintf("Error Normar Distrubution ploting option off\n")
    else
        fprintf("option Error -> input value on or off \n")
    end
end


