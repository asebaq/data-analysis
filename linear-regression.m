%% Basic Statistics
x = [6.395 6.435 6.485 6.495 6.505 6.515 6.555 ...
    6.555 6.565 6.575 6.595 6.605 6.615 6.625 ...
    6.625 6.635 6.655 6.655 6.665 6.685 6.715 ...
    6.715 6.755 6.775];

format short g

m_x = mean(x);
med_x = median(x);
mod_x = mode(x);


min_x = min(x);
max_x = max(x);

range = max(x) - min(x);

var_x = var(x);
std_x = std(x);

s = x;

[n, x] = hist(s);
hist(s)

%% Random Number Generation
% r_uniform = low + (up - low) * rand(m, n)
% Exmple #1
clc, format short g
n = 1000;
t = 4;
m = 68.1;
g = 9.81;
cd = 0.25;
min_cd = cd - 0.25;
max_cd = cd + 0.25;
r = rand(n, 1);

rand_cd = min_cd + (max_cd - min_cd) * r;
mean_cd = mean(rand_cd);
std_cd = std(rand_cd);
delta_cd = (max_cd - min_cd) / mean_cd / 2 * 100;
subplot(2, 1, 1);
hist(rand_cd), title('(a) Distribution of drag')
xlabel('cd (kg/m)')

rand_v = sqrt(g*m./rand_cd).*tanh(sqrt(g*rand_cd/m)*t);
mean_v = mean(rand_v);
delta_v = (max(rand_v) - min(rand_v)) / mean_v / 2 * 100;
subplot(2, 1, 2);
hist(rand_v), title('(b) Distribution of velocity')
xlabel('v (m/s)')

%% Random Number Generation(Monte Carlo simulation)
% r_normal = mn + s * randn(m, n)
% Exmple #2
clc, format short g
n = 1000;
t = 4;
m = 68.1;
g = 9.81;
cd = 0.25;
stdev = 0.01443;
r = randn(n, 1);

randn_cd = cd + stdev * r;
mean_cd = mean(randn_cd);
stdev_cd = std(randn_cd);
cv_cd = stdev_cd / mean_cd * 100;
subplot(2, 1, 1);
hist(randn_cd), title('(a) Distribution of drag')
xlabel('cd (kg/m)')

randn_v = sqrt(g*m./randn_cd).*tanh(sqrt(g*randn_cd/m)*t);
mean_v = mean(randn_v);
stdev_v = std(randn_v);
cv_v = stdev_v / mean_v * 100;
subplot(2, 1, 2);
hist(randn_v), title('(b) Distribution of velocity')
xlabel('v (m/s)')

%% Best Fit Line
x = 10:10:80;
y = [25 70 380 550 610 1220 830 1450];


