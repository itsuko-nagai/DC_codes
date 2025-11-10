clc;
clear;
close;
count = csvRead(&#39;C:\scilab_projects\user defined functions\count.dat&#39;);
for i = 1:3
scf();
mu(i) = mean(count(:, i));
sigma(i) = stdev(count(:, i));
histplot(24,count(:, i));
xtitle(&#39;Histogram of Traffic Intersection &#39; + string(i));
end
MeanTotal = mean(mean(count));
disp(&#39;Mean for individual Traffic Intersection is =&#39;, mu);
disp(&#39;Standard Deviation for individual Traffic Intersection is =&#39;,sigma);
disp(&#39;Overall Mean=&#39;,MeanTotal);
