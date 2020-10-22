%% Thrust requirements for thrust:weight ratio = 2 for triangle omni-directional drone

clear all
close
clc

m = 11; %weight of drone structure x2 to model thrust:weight ratio = 2 in [kg];
m_O = 2; %object weight x2 to model thrust:weight ratio = 2 [kg]
n = 50;
x_prop = 0.6; %distance between back propeller to front propeller [m];
xs = linspace(0.2, 0.5,n);
x_O = 0.35; %lever from front propeller to gripped object [m];

g = 9.81; %gravitational acceleration [m/s²]

l_back = (xs); %lever from back propeller to COM
l_front = (x_prop-xs); %lever from back propeller to COM

xs_O = (m_O/2*(l_front+x_O))/(m_O/2+m/2); %when object is gripped, COM changes position [m]

% Forces
F_g = m*g;
F_g_O = m_O*g;

% Thrust forces without object, calculated with force and torque balance equations
F_back = zeros(1,n);
F_front = zeros(1,n);
for c = 1:n
    A = [1.6 1.6; 1.6*l_back(c) -l_front(c)*1.6];
    B = [F_g 0]';
    F = inv(A)*B;
    F_back(c) = F(1);
    F_front(c) = F(2);
end


% Thrust forces with object, calculated with force and torque balance equations
F_back_O = zeros(1,n);
F_front_O = zeros(1,n);
for c = 1:n
    A = [1.6 1.6; 1.6*l_back(c)+xs_O(c) -l_front(c)*1.6-xs_O(c)];
    B = [F_g+F_g_O 0]';
    F = inv(A)*B;
    F_back_O(c) = F(1);
    F_front_O(c) = F(2);
end

figure;
sz = 50;
scatter(xs,F_back,sz,'r','filled')
hold on
grid on
scatter(xs,F_front,sz,'b','s','filled')
scatter(xs,F_back_O,sz,'r','filled')
scatter(xs,F_front_O,sz,'b','s')

%% Thrust requirements for thrust:weight ratio = 2 for triangle omni-directional drone

clear all

clc

m = 11; %weight of drone structure x2 to model thrust:weight ratio = 2 in [kg];
m_O = 2; %object weight x2 to model thrust:weight ratio = 2 [kg]
n = 50;
x_prop = 0.6; %distance between back propeller to front propeller [m];
xs = linspace(0.2, 0.5,n);
x_O = 0.35; %lever from front propeller to gripped object [m];

g = 9.81; %gravitational acceleration [m/s²]

l_back = (xs); %lever from back propeller to COM
l_front = (x_prop-xs); %lever from back propeller to COM

xs_O = (m_O/2*(l_front+x_O))/(m_O/2+m/2); %when object is gripped, COM changes position [m]

% Forces
F_g = m*g;
F_g_O = m_O*g;

% Thrust forces without object, calculated with force and torque balance equations
F_back = zeros(1,n);
F_front = zeros(1,n);
for c = 1:n
    A = [1.6 3.2; 1.6*l_back(c) -l_front(c)*3.2];
    B = [F_g 0]';
    F = inv(A)*B;
    F_back(c) = F(1);
    F_front(c) = F(2);
end


% Thrust forces with object, calculated with force and torque balance equations
F_back_O = zeros(1,n);
F_front_O = zeros(1,n);
for c = 1:n
    A = [1.6 3.2; 1.6*l_back(c)+xs_O(c) -l_front(c)*3.2-xs_O(c)];
    B = [F_g+F_g_O 0]';
    F = inv(A)*B;
    F_back_O(c) = F(1);
    F_front_O(c) = F(2);
end

figure;
sz = 50;
scatter(xs,F_back,sz,'r','filled')
hold on
grid on
scatter(xs,F_front,sz,'b','s','filled')
scatter(xs,F_back_O,sz,'r')
scatter(xs,F_front_O,sz,'b','s')
