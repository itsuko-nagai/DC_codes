clc;
clear all;
P_XY=input(&#39;enter joint probability matrix &#39;);
[m,n]=size(P_XY);
for i=1:m
px(i)=0;
for j=1:n
px(i)=px(i)+P_XY(i,j);
end
end
disp(&#39;P(X) matrix is:&#39;)
disp(px);
hx=sum(-px.*log2(px));
disp(&#39;Input entropy H(X) is:&#39;)
disp(hx);
for i=1:n
py(i)=0;
for j=1:m
py(i)=py(i)+P_XY(j,i);
end
end
disp(&#39;P(Y) matrix is:&#39;)
disp(py);
hy=sum(-py.*log2(py));
disp(&#39;Output entropy H(Y) is:&#39;)
disp(hy);
h_xy=0;
for i=1:m
for j=1:n
h_xy=h_xy+P_XY(i,j)*log2(1/P_XY(i,j));
end
end
disp(&#39;Entropy H(XY) is:&#39;)
disp(h_xy);
hxby=h_xy-hy;
hybx=h_xy-hx;
ixy=hx+hy-h_xy;
disp(&#39;Mutual Information I(X,Y) is:&#39;)
disp(ixy);
