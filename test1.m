


 Ftt = dir('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\photos\*.png');

 for i=1:length(Ftt)
           file2= strcat('C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\photos\',Ftt(i).name);
           im=imread(file2);
           im=imresize(im, [128,256]);
for j=1:7
         Img=im(1:128,1+64*(j-1)-32*(j-1): 64*j-32*(j-1),:);
    if (SVMClassification(Img)==1)
          k=1+64*(j-1)-32*(j-1);
          rect = [k,  1, 64, 128];
          rgb = [255, 0 , 0];
          thickness = 3;
          im = drawBox(im, rect, rgb, thickness);
         
    end       
         
end
  imwrite(im,['frame' num2str(i) '.png']);
    
end