clc;
clear;
close;

count = csvRead("C:\scilab_projects\user defined functions\count.dat");

mu = zeros(1, 3);      // Preallocate mean array
sigma = zeros(1, 3);   // Preallocate standard deviation array

for i = 1:3
    scf(); // Create new figure window

    mu(i) = mean(count(:, i));
    sigma(i) = stdev(count(:, i));

    histplot(24, count(:, i));
    xtitle("Histogram of Traffic Intersection " + string(i));
end

MeanTotal = mean(mean(count));

disp("Mean for individual Traffic Intersection is:");
disp(mu);

disp("Standard Deviation for individual Traffic Intersection is:");
disp(sigma);

disp("Overall Mean:");
disp(MeanTotal);
