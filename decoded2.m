function x_hat11=decoded2(y2,N)
for i=1:N
    y11(i)=y2(4*(i-1)+1);
    y22(i)=y2(4*(i-1)+2);
    y33(i)=y2(4*(i-1)+3);
    y44(i)=y2(4*(i-1)+4);
end
A=y11-y22;
for ii=1:length(A)
    if A(ii)<=0;
        x_hat11(ii)=0;
    else
        x_hat11(ii)=1;
    end
end
