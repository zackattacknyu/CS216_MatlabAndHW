function [  ] = prob4function(imageData)
%PROB4FUNCTION Summary of this function goes here
%   Detailed explanation goes here

imageDataSize = size(imageData);
numRow = imageDataSize(1);
numColumn = imageDataSize(2);

responses = zeros(numRow,numColumn,8);
[responses(:,:,1),responses(:,:,2),responses(:,:,3),...
    responses(:,:,4),responses(:,:,5),responses(:,:,6),...
    responses(:,:,7),responses(:,:,8)] = ...
    get8FilterImages(imageData);

numPixels = numRow*numColumn;
imageDataRow = reshape(responses,[numPixels 8]);

%k-Means cluster
k=20;
[Indices,~] = kmeans(imageDataRow,k);
labelData = reshape(Indices,[numRow numColumn]);
figure
imagesc(labelData);
colormap jet
colorbar
end

