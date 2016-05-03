 
 function det=SVMClassification(Img)

% the folder which contains positive images
 Filepos = dir('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\trainingpos\*.jpg');
 %the folder which contains negative samples
 Fileneg=  dir('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\training1\*.jpg');

 
% % %  %the folder which contains Testing images
% % %  Ftesting= dir('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\Testhela1\*.jpg');
 
 N=length(Filepos)+length(Fileneg);

 
%appliquer le descripteur sur les images positives de trainnig 
     for i=1:length(Filepos)
           file2= strcat('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\trainingpos\',Filepos(i).name);
           L=imread(file2);
%            imwrite(L, 'File.jpg');
           I=imresize(L,[128 64]);
%            K=CSLBP1(I);
           DataSet2(i,:)=HOG(I);

      end
 
 %Appliquer le descripteur sur les images negatives de trainnig 

  for i=1:length(Fileneg)
          file1= strcat('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\training1\',Fileneg(i).name);
          L=imread(file1);
          I=imresize(L,[128 64]);
          %K=cs1lbp(I);
%           K=CSLBP1(I);
          DataSet1(i,:)=HOG(I);

  end
  
 DataSet=[DataSet1;DataSet2];
  %generer les labels du test 

 train_label= zeros(size(N,1),1);
 train_label(1:length(Filepos),1)  = 1;         % 1 = positive images 
  train_label(length(Filepos):N,1)  = 0;         % 1 = positive images 


 
%Appliquer le descripteur sur les images de test 

%  for j = 1 : (length(Ftesting)-1)
%         fil=strcat('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\Testhela1\',Ftesting(j).name);
%         L = imread(fil);
%         I=imresize(L,[128 64]);
%         %   K=cs1lbp(I);
%         K=CSLBP1(I);
%         TestSet(j,:)=HOG(K);
%  end



%tester une image pour determiner si elle est human or not 
%  L = imread(Img);
 I=imresize(Img,[128 64]);
 %K=cs1lbp(I);
%  K=CSLBP1(I);
 TestSet=HOG(I);


%Appliquer le classifieur SVM
 options.MaxIter = 100000;
 SVMStruct = svmtrain(DataSet, train_label,'Kernel_Function', 'linear','Options',options);
 [classes,f]= svmclassify(SVMStruct, TestSet');

  det=classes;

% % % % Affichage de la courbe ROC 
% % f=-f;
% % true_label=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% % [X,Y,T,AUC]=perfcurve(true_label,f,1);
% % plot(X,Y);
% % xlabel('False positive rate');
% % ylabel('True positive rate');
% % title('ROC for Classification');


% % % % % Implementation de courbe ROC 2eme méthode
% % vx=[1:80];
% % y=0;
% % hold on 
% % plot(vx,y,'o-r') 
% % plot(vx,f,'o-b') 
% % legend('y=0','f');
% % 
% % 
% V1=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% V2=V1';
% N=43;
% P=37;
% TP=0;
% TN=0;
% FN=0;
% FP=0;
% sens = [];
% spec = [];
% 
% for i=1:80
%     
%    switch(V2(i))
%     case 0
%        if (classes(i)==0) 
%        TN=TN+1;
%        else
%        FN=FN+1;
%        end 
%     case 1
%         if (classes(i)==1)
%             TP=TP+1;
%         else 
%             FP=FP+1;
%         end
%    end  
%    
%     spec(i)=(TN/TN+FP);
%     sens(i)= (TP/TP+FN);
% end
% perfcurve
%     
% cspec=1-spec;
% plot(cspec,sens);
% xlabel('FALSE POSITIVE RATE');
% ylabel('TRUE POSITIVE RATE');
% title('RECEIVER OPERATING CHARACTERISTIC (ROC)');

end