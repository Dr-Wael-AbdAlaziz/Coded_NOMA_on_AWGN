function coded2=encoder2(data2,data3)

for i=1:length(data2)
coded2(1,4*(i-1)+1)=data2(i);
coded2(1,4*(i-1)+2)=rem(data2(i)+1,2);
coded2(1,4*(i-1)+3)=data3(i);
coded2(1,4*(i-1)+4)=rem(data3(i)+1,2);
end