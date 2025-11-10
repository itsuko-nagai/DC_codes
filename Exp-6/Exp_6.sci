clc;
clear;
close;

exec("C:\scilab_projects\user defined functions\pskmod.sci");
exec("C:\scilab_projects\user defined functions\qammod.sci");

N = 4; // number of bits to be grouped
M = 2^N;

x = 0:M-1;

z = pskmod(x, M);

scf(); // create a new figure

subplot(1, 2, 1);
scatter(real(z), imag(z), "fill");

h = gca(); // get current axes
h.data_bounds = [-1.5, 1.5; -1.5, 1.5]; // corrected syntax

xtitle("M-ary PSK", "In-phase", "Quadrature");

y = qammod(x, M);

subplot(1, 2, 2);
scatter(real(y), imag(y), "fill"); // lowercase 'scatter'

h = gca(); // corrected from 'gcal' to 'gca'
h.data_bounds = [-3.5, 3.5; -3.5, 3.5]; // corrected syntax

xtitle("M-QAM", "In-phase", "Quadrature");
