% % for i =1:10
% % Z(:,i)=randi(10);
% % end
function H1=ooo(I)
%  I=imread('1.jpg');
 I=rgb2gray(I);

[N M]=size(I);   
for i=1:(N-15)
    for j=1:(M-15)
        
     S=I(i:i+15,j:j+15);
     V=CSLBP(S);
%      L(1,1:3)=V(1:3);
%      L(2,1:3)=V(4:6);
%      L(3,1:3)=V(7:9);
% %      L(4,1:4)=V(13:16);
%      H(i:i+2,j:j+2)=[L];
%    
       H(:,j)=V;
      
    end
      H1=HOG(H);
     
end




   





