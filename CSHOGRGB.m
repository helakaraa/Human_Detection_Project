function HO=CSHOGRGB(I)
  
I=double(I);

[m n k]=size(I);   

IcRR=zeros(128,1);
IcGG=zeros(128,1);
IcBB=zeros(128,1);
M=16;
M1=8;
mat=[];
cell_size=8;
for i=1:M
      for j=1:M1
            
            IcR=zeros(1);
            IcG=zeros(1);
            IcB=zeros(1);
            I_tempR=zeros(1);
            I_tempG=zeros(1);
            I_tempB=zeros(1);
          for x=cell_size*(i-1)+1:cell_size*i
              for y=cell_size*(j-1)+1:cell_size*j
                  
               I_tempR= (1/(cell_size*cell_size))*I(x,y,1);
               IcR= I_tempG+IcR;
        
           I_tempG= (1/(cell_size*cell_size))*I(x,y,2);
          IcG= I_tempG+ IcG;
          
           I_tempB= (1/(cell_size*cell_size))*I(x,y,3);
           IcB= I_tempB+ IcB;
           
              end
          end
          IcRR(cell_size*(i-1)+j)= IcR;
          IcGG(cell_size*(i-1)+j)= IcG;
          IcBB(cell_size*(i-1)+j)= IcB;
      end
end

s=zeros(128,64,3);
for i=1:M
    for j=1:M1

      s= sqrt( abs((IcRR(8*(i-1)+j)-I(:,:,1))).^2+ abs((IcGG(8*(i-1)+j)-I(:,:,2))).^ 2 + abs((IcBB(8*(i-1)+j)-I(:,:,3))).^2);
      H1=HOG(s);
    
      mat=[mat H1'];
              
    end
end

HO=mat';
