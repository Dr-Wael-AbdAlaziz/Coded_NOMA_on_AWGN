function x_hat1=decoder1(y1,N)
for i=1:N
    y11(i)=y1(4*(i-1)+1);
    y22(i)=y1(4*(i-1)+2);
    y33(i)=y1(4*(i-1)+3);
    y44(i)=y1(4*(i-1)+4);
end
A=y11+y22+y33+y44;
for u=1:length(A)
    if A(u)<=0
        x_hat1(u)=0;
    else
        x_hat1(u)=1;
    end
end
end

    

