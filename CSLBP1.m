
function filtered_img = cs1lbp(img)

%%  CSLBP image descriptor
[nrows, ncols] = size(img);

filtered_img = zeros(nrows, ncols, 'uint8');
T = 0;
for j = 2:ncols-1
    for i = 2:nrows-1
        nhood = nhood8(i, j);
        s=1;
        for k = 1:4
             
            filtered_img(i, j) = filtered_img(i, j) + ...
                (int8(img(nhood(s, 1), nhood(s,2)))-int8(img(nhood(s+1, 1), nhood(s+1,2))) >= T) * 2^(k-1);
              s=s+2;
        end
    end
end

end

function idx = nhood8(i, j)
%% Computes the 8-neighborhood of a pixel
idx = [
    i,j+1;
    i,j-1;
    
    i+1,j+1;
    i-1,j-1;
    
    
    i+1,j;
    i-1,j;
    
    i+1,j-1;
    i-1,j+1;
];

end

