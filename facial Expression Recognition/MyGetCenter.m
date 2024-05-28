function Out=MyGetCenter(Input,ECol,ERow)
Col=2:3:ECol;
Row=2:3:ERow;
L=1;
k=1;
for i=1:3
    for j=1:6
        temp=real(Input(1,i).data{1,j})+min(min(real(Input(1,i).data{1,j})));
        [x y]=size(temp(Col,Row));
        Center(L:L+x*y-1)=reshape(temp(Col,Row),1,x*y);
        L=L+x*y;
        k=k+1;     
    end
end
Out=Center;
end
