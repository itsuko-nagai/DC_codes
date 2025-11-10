clc;
clear;
close;
// User info
disp("* Name –Om Taur Roll No. - E3125 *");

// ----- M-ary Modulation -----
N = 4;        // Number of bits per symbol
M = 2^N;      // Modulation order (16)

x = 0:M-1;    // Symbol values

// ----- PSK Modulation -----
theta = (2 * %pi * x) / M;   // Phase angles
z = exp(%i * theta);         // PSK points on unit circle

scf(0);
subplot(1,2,1);
scatter(real(z), imag(z), "fill");
h = gca();
h.data_bounds = [-1.5, 1.5, -1.5, 1.5];
xtitle('* Name-Om Vishnu Taur Roll no. - E3125 * M-ary PSK', 'In-phase', 'Quadrature');
// ----- QAM Modulation -----
m = sqrt(M);
a = -m + 1 : 2 : m - 1;      // Symbol positions
[yI, yQ] = ndgrid(a, a);
y = yI(:) + %i * yQ(:);      // Combine I and Q components
subplot(1,2,2);
scatter(real(y), imag(y), "fill");
h = gca();
h.data_bounds = [-3.5, 3.5, -3.5, 3.5];
xtitle('M-QAM', 'In-phase', 'Quadrature');
