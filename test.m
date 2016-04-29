% 
% 
% im=imread('092.png');
% 
% bgray=rgb2gray(im);
% 
% BW=im2bw(bgray);
% BW = ~BW; 
% 
% 
% st = regionprops(BW, 'BoundingBox' ); 
% for k = 1 : length(st)
%     thisBB = st(k).BoundingBox; 
% %     rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],'EdgeColor','r','LineWidth',2 );
% %         
% % end
%  
% 
% 
% 
%  Ftt = dir('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\photos\*.png');
% 
%  for i=1:length(Ftt)
%            file2= strcat('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\photos\',Ftt(i).name);
%            im=imread(file2);
%            im=imresize(im, [128,256]);


function RESULT=test(input)

for j=1:7
         Img=input(1:128,1+64*(j-1)-32*(j-1): 64*j-32*(j-1),:);
    if (SVMClassification(Img)==1)
          k=1+64*(j-1)-32*(j-1);
          rect = [k,  1, 64, 128];
          rgb = [255, 0 , 0];
          thickness = 3;
          RESULT=drawBox(input, rect, rgb, thickness);
         
    end       
         
end
    
end
%  end






