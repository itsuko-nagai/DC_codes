clc;
close;
clear;
D = poly (0, &#39;D&#39; );
g = 1+D+0+D ^3; // generator polynomial
m = (D^3) *(1+0+0+ D^3); //message sequence
[r,q] = pdiv (m,g);
p = coeff (r);
disp (r, &#39; remainder in polynomial form &#39; )
disp (p, &#39; Parity bits are : &#39; )
disp ( &#39; Table 8.3 Contents of the Shift Register in the Encoder of fig 8.7 for Message Sequence (1 0 0
1 ) &#39;)
disp ( &#39;--------------------------------------------------------------------&#39;)
disp ( &#39; Shift Input Register Contents &#39; )
disp ( &#39;-----------------------------------------------&#39; )
disp ( &#39; 1 1 1 1 0 &#39; )
disp ( &#39; 2 0 0 1 1 &#39; )
disp ( &#39; 3 0 1 1 1 &#39; )
disp ( &#39; 4 1 0 1 1 &#39; )

disp ( &#39;--------------------------&#39; )

//syndrome calculator for the(7,4) Cyclic Hamming Code
C1=0+D+D^2+D^3+0+0+D^6;// e r r o r f r e ecodeword
C2=0+D+D^2+0+0+0+D^6;//middl e b i t i s e r r o r
[r1,q1]=pdiv(C1,g);
S1=coeff(r1);
S1=modulo(S1,2);
disp(r1,&#39; remainder in polynomial form &#39;)
disp(S1,&#39; Syndrome bits for error free codeword are : &#39;)
[r2,q2]=pdiv(C2,g);
S2=coeff(r2);
S2=modulo(S2,2);
disp(r2,&#39; remainder in polynomial form for erroredcodeword &#39;)
disp(S2,&#39; Syndrome bits for erroredcodeword are : &#39;)
