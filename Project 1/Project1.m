%Question 4

%Initialize the Variables
k = 500;
L = 1;
a = 0:pi/100:(5*pi/12);
theta = acos((cos(a)).^(1/3));
Pc = -1*2*k*L.*sin(theta).*((1./cos(theta))-(1./cos(a)));

%Plots
figure
plot(a*180/pi,theta*180/pi);
title("Plot of Theta against Alpha at different values");
xlabel(['Alpha angles (' 176 ')']);
ylabel(['Theta angles (' 176 ')']);

figure
plot(a,Pc)
title("Pc versus Alpha at different values");
xlabel(['Alpha angles (' 176 ')']);
ylabel(['Pc angles']);

%Question 5

%Initialize the Variables
k = [0:0.004:750];
L = 1;
L0 = [1:0.004:2];
m = zeros(length(k),length(L0));
limit = zeros(length(k), length(L0));

%Solve
for ii = 1:length(k)
    for jj = 1:length(L0)
        limit(ii,jj) = k(ii)*2*L*((sin(acos((L./L0(jj)).^(1/3)))/(L./L0(jj))) - tan(acos(((L./L0(jj)).^(1/3)))));
        if limit(ii,jj) >= 250 && limit(ii,jj) <= 500
            m(ii,jj) = 1;
        end
    end
end

%Plot
contourf(k,L0,m',1);


