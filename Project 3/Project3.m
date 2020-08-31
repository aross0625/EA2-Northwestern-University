
%%%%Problem 1

%Initialize variables
gravity = 9.81;
m = 1;
Lo = 1;
rad = 0.1 * Lo;
Tbc = zeros(1,51);
set = 20:70;

for i = 1:length(Tbc)
    % Distance components
    x1 = rad/tand(set(i)/2);
    x2 = rad/tand(set(i)/2) + 2*rad;
    x3 = rad/tand(set(i)/2) + 4*rad;
    % Normal force vector components
    v1 = (3*m*gravity*cosd(set(i))^2)/sind(set(i)) + m*gravity*sind(set(i));
    v2 = m*gravity*sind(set(i));
    v3 = v2;
    % Resulting Tension
    % Note: The sign (+/-) of the tension should be inverted
    Tbc(i) = (x1*v1 + x2*v2 + x3*v3)/(Lo*sind(90-set(i)));
end

%Find Min
minimum = min(Tbc);
ind = find(Tbc == minimum,1);
fprintf('The smallest tension is %.1fN at %.1f degrees.\n', minimum, set(ind));

%Plot
figure;
plot(set,Tbc);
title('The Angle Alpha vs.Tension in cable BC');
xlabel('Alpha (Degrees)');
ylabel('Tension in BC (Newtons)');


%%%%Problem 2

%Initialize Variables
i = 0;
j = 0;
grav = 9.81;
Lo = 1;
m = 1;
rad = 0.1 * Lo;
Tbc = zeros(71,51);

for B = 20:90
    i = i + 1;
    j = 0;
    for a = 20:0.71321341242132321321312:70
        j = j + 1;
        % Distance from A
        x1 = rad/tand(a/2);
        x2 = rad/tand(a/2) + 2*rad;
        x3 = rad/tand(a/2) + 4*rad;
        % Normal force
        N1 = (3*m*grav*cosd(a)^2)/sind(a) + m*grav*sind(a);
        N2 = m*grav*sind(a);
        N3 = N2;
        % Tension
        Tbc(i, j) = (x1*N1 + x2*N2 + x3*N3)/(Lo*sind(180-B-a));
    end
end

%Plot
B = 20:90;
a = 20:0.7123124123214213211:70;
figure;
surf(B,a,Tbc);
title('Tension vs. Alpha vs. Beta');
xlabel('Beta (degrees)');
ylabel('Alpha (degrees)');
zlabel('Tension in BC (N)');

