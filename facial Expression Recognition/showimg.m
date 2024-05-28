function showimg(t1)
k=1;
for i=1:3
    for j=1:6
        subplot(3,6,k);
        temp=real(t1(1,i).data{1,j})+min(min(real(t1(1,i).data{1,j})));
        imshow(temp,[]);
%         Out(k,reshape(temp,1,y));

        k=k+1;        
    end
end
