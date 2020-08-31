x=-0.6:.01:1.0;
y=-0.4:.01:1.2;
Tension1=zeros(length(x),length(y));
Tension2=zeros(length(x),length(y));
Tension3=zeros(length(x),length(y));
TotalForce=[0; 0; 6400];

for ii=1:length(x)
    for jj=1:length(y)
       Matrix = [3*((94)^.5)/47 -4/9 x(ii)/sqrt((x(ii))^2+(y(jj))^2+1.75^2);
        -3/sqrt(94) -4/9 y(jj)/sqrt((x(ii))^2+(y(jj))^2+1.75^2);
        7/sqrt(94) 7/9 1.75/sqrt((x(ii))^2+(y(jj))^2+1.75^2)];

        Final = Matrix\TotalForce;

        Tension1(ii,jj)=Final(1,1);
        Tension3(ii,jj)=Final(2,1);
        Tension2(ii,jj)=Final(3,1);
    end
end


figure
surf(x,y,Tension1','edgecolor','none');
colormap(jet)
title('Tension AD')
xlabel('x')
ylabel('y')
zlabel('Tension AD')


figure
surf(x,y,Tension3','edgecolor','none');
colormap(jet)
title('Tension AC')
xlabel('x')
ylabel('y')
zlabel('Tension AC')


figure
surf(x,y,Tension2','edgecolor','none');
colormap(jet)
title('Tension AB')
xlabel('x')
ylabel('y')
zlabel('Tension AB')





mininum = 100000000000000000;
NetCost=zeros(length(x),length(y));
Xpos=0;
Ypos=0;

for ii=1:length(x)
    for jj = 1:(length(y))
%          if (NetCost(ii,jj)<mininum)
        
%         NetCost(ii,jj)=Tension2(ii,jj)*(norm(Tension1))^2;
%             if (NetCost(ii,jj)<mininum)
%                 mininum=NetCost(ii,jj);
%             end

         if((Tension1(ii,jj)>0 && Tension3(ii,jj)>0 && Tension2(ii,jj)>0))
            NetCost(ii,jj)=Tension2(ii,jj)*((x(ii)^2+y(jj)^2+1.75^2));
            mininum=NetCost(ii,jj);
            Xpos=x(ii);
            Ypos=y(jj);
         else
             NetCost(ii,jj)= NaN;
         end
            
        end
        
     end
        
% end
    
 
figure
surf(x,y,NetCost','edgecolor','none');
colormap(jet)
title('Cost of AB')
xlabel('x')
ylabel('y')
zlabel('Cost of AB')
fprintf(Xpos+" "+Ypos);
fprintf(" " + min(min(NetCost)));
