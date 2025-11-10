clc;
clear;
close;
count = csvRead('C:\Users\lenovo\Documents\TE\DC\count.dat');
for i = 1:3
    scf();
    mu(i) = mean(count(:, i));
    sigma(i) = stdev(count(:, i)); 
    histplot(24,count(:, i));
    xtitle('Histogram of Traffic Intersection ' + string(i));
end
MeanTotal = mean(mean(count));
disp('Mean for individual Traffic Intersection is =', mu);
disp('Standard Deviation for individual Traffic Intersection is =',sigma);
disp('Overall Mean=',MeanTotal);
