function Out=FeatureVector(t1,t2,t3,t4)
Tempi=[t1;t2;t3;t4;];
L=1;
for counter=1:4
     [Ec Er]=size(Tempi(counter,1).data{1,1});
    O=MyGetCenter(Tempi(counter,:),Ec,Er);
    Out(L:L+length(O)-1)=O;
    L=L+length(O);
end
end