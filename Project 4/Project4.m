% EA2 Design Project 4

%Graph 1
theta=[10:1:70];
Ls=[0.5:0.1:6];
F=[]
F(1:56,1:61)=zeros;
for i=1:61;
    for j=1:56;
        thet=theta(i);
        L=Ls(j);
FAEW=(sqrt(1+8*(sind(thet)^2)))*((1/4)-(L/10)*(1-sind(thet)))
;
        Fmagnitude=norm(FAEW);
        F(j,i)=Fmagnitude;
    end
end
F
figure;
contourf(theta,Ls,F);
title('FAE/W vs L and theta');
xlabel('Angle Theta (degrees)');
ylabel('L (m)');
c=colorbar;
c.Label.String='Magnitude of F/W'

%Figure 2
figure;
contourf(theta,Ls,F',1);
xlabel('Theta (degrees)');
ylabel('L (m)');
zlabel('Force of AE (N)');
title('F vs L vs Theta');
c=colorbar;
c.Label.String='Magnitude of F/W'


