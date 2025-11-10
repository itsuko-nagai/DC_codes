exec('C:\Users\lenovo\Documents\TE\DC\awgn.sci'); 
data_bits = 100000; 
b = rand(1, data_bits) > 0.5; 
s = 2 * b - 1; 
SNRdB = 0:9; 
for k = 1:length(SNRdB) 
    y = awgn(s, SNRdB(k));
    error = 0;
    for c = 1:data_bits
        if ((y(c) > 0 & s(c) == -1) | (y(c) < 0 & s(c) == 1)) then 
            error = error + 1;
        end
    end  
    BER(k) = error / data_bits; 
 end    
SNR = 10.^(SNRdB / 10); 
BER_thBPSK = (1 / 2) * erfc(sqrt(SNR));
BER_thQPSK = erfc(sqrt(SNR));
scf(); 
semilogy(SNRdB, BER, 'r', 'LineWidth', 2);
xtitle(' * Name : Om Taur  Roll No. : E3125 * Probability of Error Graph', 'SNR (dB)', 'BER');
xgrid; 
semilogy(SNRdB, BER_thBPSK, 'k', 'LineWidth', 2);
semilogy(SNRdB, BER_thQPSK, 'b', 'LineWidth', 2);
legend('Simulated BPSK', 'Theoretical BPSK', 'Theoretical QPSK');
