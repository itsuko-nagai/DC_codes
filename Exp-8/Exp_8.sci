clc;
clear all;
P_XY=input('enter joint probability matrix ');
[m,n]=size(P_XY);

for i=1:m
    px(i)=0;
    for j=1:n
        px(i)=px(i)+P_XY(i,j);
    end
end
disp('P(X) matrix is:')
disp(px);
hx=sum(-px.*log2(px));
disp('Input entropy H(X) is:')
disp(hx);

for i=1:n
    py(i)=0;
    for j=1:m
        py(i)=py(i)+P_XY(j,i);
    end
end
disp('P(Y) matrix is:')
disp(py);
hy=sum(-py.*log2(py));
disp('Output entropy H(Y) is:')
disp(hy);
h_xy=0;
for i=1:m
    for j=1:n
    h_xy=h_xy+P_XY(i,j)*log2(1/P_XY(i,j));
end
end
disp('Entropy H(XY) is:')
disp(h_xy);
hxby=h_xy-hy;
hybx=h_xy-hx;
ixy=hx+hy-h_xy;
disp('Mutual Information I(X,Y) is:')
disp(ixy);
