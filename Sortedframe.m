

directoryPath='C:\Users\Hela\Documents\MATLAB\Human_Detection_Project\walking_person';
Listing = dir(fullfile(directoryPath, '*.png'));
names = {Listing.name}';
names = sort_nat(names);
fullNames = cellfun(@(x) fullfile(directoryPath, x), names, 'UniformOutput', 0);

% for i=1:250
%     A=imread(fullNames{i});
%     sequence(:,:,:,i)=A;
%     
% end    
% save('Walkperson','sequence');