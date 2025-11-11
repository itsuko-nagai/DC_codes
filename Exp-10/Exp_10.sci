 clc;
 clear;
 exec('C:\scilab_projects\user defined functions\deconv.sci');
 n = input('Enter the length of codeword : ');
 k = input('Enter the length of message : ');
 gen_coff = input('Enter the generator coefficient : ');
 m = input('Enter the message : ');
 y2 = [1];
 a = zeros(1, n - k);
 z1 = [y2 a];
 x = conv(z1, m);
 x1 = pmodulo(x, 2);
 [q, r] = deconv(x1,gen_coff);
 r1 = [zeros(1, length(x1) - length(r)),r];
 codeword = bitxor(x1,r1); //codeword = (x1 & ~r1) | (~x1 & r1);
 disp('CYCLIC CODEWORD= ',codeword*1);
 rec = input('Enter the received codeword : ');
 [q,r] = deconv(rec, gen_coff);
 syn = pmodulo(r, 2);
 disp('Syndrome for received codeword is:',syn);
 if syn == 0 then
 disp('No error in received code, No need of correction ');
 else
 disp('Non zero syndrome indicates Error in received code');
 syn = [zeros(1, length(x1) - length(syn)),syn];
 y2 = zeros(n, n);
 e = eye(n, n);
 for i = 1:n
 [q, r] = deconv(e(i,:),gen_coff);
 r1 = [zeros(1,n - length(r)),r];
 y2(i,:) = pmodulo(r1, 2);
 end
 for i = 1:n
 if syn == y2(i,:) then
 break
 end
 end
 correctedCode=bitxor(rec,e(i,:));
 disp('CORRECTED CODEWORD= ',correctedCode*1);
 end
