function [  ] = prob4function( imageData,centerX,centerY,radius )
%PROB4FUNCTION Summary of this function goes here
%   Detailed explanation goes here

[responses,~] = prob3function(imageData,centerX,centerY,radius,1);

imageDataSize = size(responses);
numRow = imageDataSize(1);
numColumn = imageDataSize(2);
numPixels = numRow*numColumn;
imageDataRow = reshape(responses,[numPixels 8]);

%k-Means cluster
k=20;
[Indices,~] = kmeans(imageDataRow,k);
labelData = reshape(Indices,[numRow numColumn]);
figure
imagesc(labelData);
colorbar;
end

