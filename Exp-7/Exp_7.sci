exec(&#39;C:\scilab_projects\user defined functions\awgn.sci&#39;);
data_bits = 100000;
b = rand(1, data_bits) &gt; 0.5;
s = 2 * b - 1;
SNRdB = 0:9;
for k = 1:length(SNRdB)
y = awgn(s, SNRdB(k));
error = 0;
for c = 1:data_bits
if ((y(c) &gt; 0 &amp; s(c) == -1) | (y(c) &lt; 0 &amp; s(c) == 1)) then
error = error + 1;
end
end
BER(k) = error / data_bits;
end
SNR = 10.^(SNRdB / 10);
BER_thBPSK = (1 / 2) * erfc(sqrt(SNR));
BER_thQPSK = erfc(sqrt(SNR));
scf();
semilogy(SNRdB, BER, &#39;r&#39;, &#39;LineWidth&#39;, 2);
xtitle(&#39;Probability of Error Graph&#39;, &#39;SNR (dB)&#39;, &#39;BER&#39;);
xgrid;
semilogy(SNRdB, BER_thBPSK, &#39;k&#39;, &#39;LineWidth&#39;, 2);
semilogy(SNRdB, BER_thQPSK, &#39;b&#39;, &#39;LineWidth&#39;, 2);
legend(&#39;Simulated BPSK&#39;, &#39;Theoretical BPSK&#39;, &#39;Theoretical QPSK&#39;);
