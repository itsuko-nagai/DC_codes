clc;
clear;
n = input(&#39;Enter the codeword length in LBC (n): &#39;);
k = input(&#39;Enter the number of message bits in LBC (m): &#39;);
p = input(&#39;Enter the parity check matrix &#39;);
g = [eye(k,k)p];
disp(&#39;Generator matrix&#39;,g);
d = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1]
c = modulo(d*g, 2);
disp(&#39;all codewords&#39;,c);
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
disp(&#39;code vector with hamming weight&#39;,y);
dmin = Hw(2);
for i = 2:2^k
if dmin &gt; Hw(i) then
dmin = Hw(i);
end
end
disp(&#39;Minimum Hamming Distance is &#39;,dmin);
td = dmin - 1;

disp(&#39;Error Detection Capability of code(in bits) is &#39;,td);
tc = (dmin - 1) / 2;
disp(&#39;Error Correctionn Capability of code(in bits) is &#39;, tc);
disp(&#39;Transpose of parity matrix is &#39;,p&#39;);
H = [p&#39;, eye(n - k, n - k)];
disp(&#39;Parity check matrix is &#39;,H);
disp(&#39;Transpose of parity check matrix is &#39;,H&#39;);
r = input(&#39;Enter the received codeword&#39;);
synd = modulo(r * H&#39;, 2);
disp(&#39;Syndrome for received codeword is &#39;,synd);
for i = 1:size(H&#39;, 1)
if H&#39;(i, 1:n - k) == synd then
r(i) = 1 - r(i);
disp(&#39;By matching this syndrome with different rows of Traspose of parity check matrix, Error is
at location &#39;,i);
end
end
disp(&#39;Corrected codeword is &#39;,r);
