imageData = im2double(imread('zebra_small.jpg'));
imageDataSize = size(imageData);
numRow = imageDataSize(1);
numColumn = imageDataSize(2);
numPixels = numRow*numColumn;
imageDataRow = reshape(imageData,[numPixels 3]);

%k-Means cluster
k=5;
[Indices,Colors] = kmeans(imageDataRow,k);
newImageDataRow = zeros([numPixels 3]);
for row = 1:numPixels
   newImageDataRow(row,:) = Colors(Indices(row),:);
end
newImageData = reshape(newImageDataRow,[numRow numColumn 3]);