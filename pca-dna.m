% Clear things up
clear; close all; clc;

% Enter the data
GeneA = [1.1 0.5 27 1.4 1.9 2.6 3.2 8.1 4.1 0.4 9.4 13 14.1 9.1 18.2 2.1 5.3 ...
    16.4 7 21.1 0.3 7.5 17.1 5.2 13.1];

GeneB = [0.2 0.6 11 0.9 1.2 0.9 1.8 4.4 2.5 0.3 5.9 7.9 5.9 6.1 7.2 1.8 1.6 6.1 ...
    5 10.1 0.2 4.0 8.8 1.5 4.2];

% Create the component matrix
compMat = [GeneA; GeneB];

% Plot figure 1
figure(1)
scatter(compMat(1,:), compMat(2,:), 'filled')
axis([-10 30 -10 30])
grid on
title('Figure 1')
xlabel('GeneA expression leve')
ylabel('GeneB expression leve')

% Calculate the mean
m = mean(compMat');
compMatCent(1,:) = compMat(1,:) - m(1);
compMatCent(2,:) = compMat(2,:) - m(2);

% Plot figure 2
figure(2)
scatter(compMatCent(1,:), compMatCent(2,:), 'filled')
axis([-10 30 -10 30])
grid on
title('Figure 2')
xlabel('Centered geneA expression leve')
ylabel('Centered geneB expression leve')

%
variance = zeros(1, length(1:0.1:pi/2));
coordinates = zeros(1, size(compMatCent,2));
for i = 0:0.01:pi/2
    % Get the data points coordinates
    angle = [1 tan(i)]';
    angleBias = (1/sqrt(angle(1)^2+angle(2)^2)) * angle;
   
    for j = 1:length(compMatCent)
        coordinates(j) = dot(compMatCent(:, j), angleBias);
    end
    
    % Calculate the variance
    floor(i/0.01 + 1)
    variance(floor(i/0.01 + 1)) = sum(sum((coordinates-mean(coordinates)).^2/ ...
        (length(coordinates)-1)));
end

% Find the greatest variance
maxVar = find((variance == max(variance)));

% Plot the axis with greatest variance
figure(2)
hold on
x2 = (50*cos(0.01*(maxVar-1)));
y2 = (50*sin(0.01*(maxVar-1)));
plot([-x2 x2],[-y2 y2], 'b')

% Plot figure 3
figure(3)
scatter(compMatCent(1,:), compMatCent(2,:), 'filled')
hold on
x3 = (50*cos(0.01*(maxVar-1) + pi/2));
y3 = (50*sin(0.01*(maxVar-1) + pi/2));
x2 = (50*cos(0.01*(maxVar-1)));
y2 = (50*sin(0.01*(maxVar-1)));

plot([-x2 x2],[-y2 y2],'b')
plot([-x3 x3],[-y3 y3],'r')

axis([-10 30 -10 30])
grid on
title('Figure 3')
xlabel('Centered geneA expression leve')
ylabel('Centered geneB expression leve')
