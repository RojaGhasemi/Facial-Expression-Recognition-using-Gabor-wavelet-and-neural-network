function Perf=Call_Performanc(a,DataSet,DataSet_Y)
 % classification rate
 [row col] = size(DataSet);
correct = 0;false=0;
for i=1:size(DataSet_Y,7)
    [I] = round(a(i));
    Class(i)=I;
    [II] =DataSet_Y (i);
    if I == II
        correct = correct + 1
    else
        false = false + 1; 
    end
end   
 Perf = correct*100
save('Class.mat','Class');
end

 
% % % % % % % % % % % % % % % % % % % % % % % % %  [row col] = size(DataSet);
% % % % % % % % % % % % % % % % % % % % % % % % %  correct = 0;false=0;
% % % % % % % % % % % % % % % % % % % % % % % % %  for i=1:size(DataSet_Y,2)
% % % % % % % % % % % % % % % % % % % % % % % % %     [I] = round(a(i));
% % % % % % % % % % % % % % % % % % % % % % % % %     [I1] = round(a1(i));
% % % % % % % % % % % % % % % % % % % % % % % % %     [I2] = round(a2(i));
% % % % % % % % % % % % % % % % % % % % % % % % % %     Class(i)=I;
% % % % % % % % % % % % % % % % % % % % % % % % %     [II] =DataSet_Y (i);
% % % % % % % % % % % % % % % % % % % % % % % % %     if (I == II) 
% % % % % % % % % % % % % % % % % % % % % % % % %        Class11='B';
% % % % % % % % % % % % % % % % % % % % % % % % %        break;
% % % % % % % % % % % % % % % % % % % % % % % % %     end
% % % % % % % % % % % % % % % % % % % % % % % % %     if (I1 == II) 
% % % % % % % % % % % % % % % % % % % % % % % % %        Class11='M';
% % % % % % % % % % % % % % % % % % % % % % % % %        break;
% % % % % % % % % % % % % % % % % % % % % % % % %     end
% % % % % % % % % % % % % % % % % % % % % % % % %         if (I2 == II) 
% % % % % % % % % % % % % % % % % % % % % % % % %        Class11='N';
% % % % % % % % % % % % % % % % % % % % % % % % %        break;
% % % % % % % % % % % % % % % % % % % % % % % % %     end
% % % % % % % % % % % % % % % % % % % % % % % % %    
% % % % % % % % % % % % % % % % % % % % % % % % % end   
% % % % % % % % % % % % % % % % % % % % % % % % % %  Perf = correct*100
% % % % % % % % % % % % % % % % % % % % % % % % %  save('Class11.mat','Class11');
% % % % % % % % % % % % % % % % % % % % % % % % % end

