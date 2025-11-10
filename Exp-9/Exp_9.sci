clc;
clear;
n = input('Enter the codeword length in LBC (n): ');
k = input('Enter the number of message bits in LBC (m): ');
p = input('Enter the parity check matrix ');
g = [eye(k,k)p];
disp('Generator matrix',g);
d = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1]
c = modulo(d*g, 2);
disp('all codewords',c);
Hw = zeros(2^k, 1);
for i = 1:2^k
    wt = 0;
    for j = 1:n
        if c(i, j) == 1 then
            wt = wt + 1;
        end
    end
    Hw(i) = wt;
end
y = [c, Hw];
disp('code vector with hamming weight',y);
dmin = Hw(2);
for i = 2:2^k
    if dmin > Hw(i) then
        dmin = Hw(i);
    end
end
disp('Minimum Hamming Distance is ',dmin);
td = dmin - 1;
disp('Error Detection Capability of code(in bits) is ',td);
tc = (dmin - 1) / 2;
disp('Error Correctionn Capability of code(in bits) is ', tc);
disp('Transpose of parity matrix is ',p');
H = [p', eye(n - k, n - k)];
disp('Parity check matrix is ',H);
disp('Transpose of parity check matrix is ',H');
r = input('Enter the received codeword');
synd = modulo(r * H', 2);
disp('Syndrome for received codeword is ',synd);
for i = 1:size(H', 1)
    if H'(i, 1:n - k) == synd then
        r(i) = 1 - r(i);
        disp('By matching this syndrome with different rows of Traspose of parity check matrix, Error is at location ',i);
    end
end
disp('Corrected codeword is ',r);
