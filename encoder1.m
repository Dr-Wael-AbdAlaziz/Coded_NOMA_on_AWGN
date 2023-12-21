function coded1=encoder1(data1)

for i=1:length(data1)
coded1(1,4*(i-1)+1)=data1(i);
coded1(1,4*(i-1)+2)=data1(i);
coded1(1,4*(i-1)+3)=data1(i);
coded1(1,4*(i-1)+4)=data1(i);
end