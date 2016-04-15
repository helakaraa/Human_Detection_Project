tic
Filepos = dir('C:\Users\Hela\Documents\MATLAB\Our_work\CSLBPTest\pos\*.*');% the folder which contains positive images 
Filenegative=dir('C:\Users\Hela\Documents\MATLAB\Our_work\CSLBPTest\neg1\*.*');%the folder which contains negative images
% 
% for i = 1 : (length(Filepos)/2)
%      k=randi(length(Filepos)/2);
%      filename= strcat('C:\Users\Hela\Documents\MATLAB\Our_work\CSLBPTest\pos\',Filepos(i).name);
%      filen=strcat('C:\Users\Hela\Documents\MATLAB\Our_work\CSLBPTest\neg1\',Filenegative(i).name);
%      L=imread(filename);
%      K=imread(filen);
%      L=imresize(L,[128 64]);
%      K=imresize(K,[128 64]);
%      if(mod(k,2)==0)
%      I = imread(L);
%      Y(:,i)=ooo(I);
% %     [feature, hog] = extractHOGFeatures(filename);
% %      Y(:,i)=CSS(I);
%      else 
%      I1 = imread(K);
%      Y(:,i)=ooo(I1);
% % %      [feature, hog] = extractHOGFeatures(I1);
% %     Y(:,i)=CSS(I1);
%      end
%     
% %     figure, imshow(I);
% end
%     [idx,C]=kmeans(Y',2);
%     plot(idx,'*');



    for i = 1 :50
     file1= strcat('C:\Users\Hela\Documents\MATLAB\Our_work\CSLBPTest\pos\',Filepos(i).name);
     L=imread(file1);
     L=imresize(L,[128 64]);
     K=cs1lbp(L);
     Y(:,i)=HOG(K);
%     [feature, hog] = extractHOGFeatures(filename);
%      Y(:,i)=CSS(L);
    end 
  
     for i =1:50
     file2= strcat('C:\Users\Hela\Documents\MATLAB\Our_work\CSLBPTest\neg1\',Filenegative(i).name);
     L=imread(file2);
     L=imresize(L,[128 64]);
      K=cs1lbp(L);
     Z(:,i)=HOG(K);
% %     [feature, hog] = extractHOGFeatures(filename);
%      Z(:,i)=CSS(L);
     end 
    V=[Y,Z];
    [idx,C]=kmeans(V',2);
    plot(idx,'*');
   toc
   