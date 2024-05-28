function FV=GetFeaturesCenter(F)
[x y z]=size(F);
Len=1;
for i=2:35
    for j=1:3
        for k=1:6
            tempFv1(k)=real(F(1,j).a(1,i).data{1,k}(2,2));%3*3  (2,2) is center
        end
        tempFV2(j,:)=tempFv1;
        tempFV1=[];
    end
    FV(Len:Len+18-1)=reshape(tempFV2,1,18);
    Len=Len+18;
    tempFV2=[];
end

end
