imname = 'simpsons.jpg';
imageData = im2double(imread(imname));
imageDataSize = size(imageData);
numRow = imageDataSize(1);
numColumn = imageDataSize(2);
numPixels = numRow*numColumn;
imageDataRow = reshape(imageData,[numPixels 3]);
imageDataRowRedEn = reshape(imageData,[numPixels 3]);
imageDataRowRedEn(:,1) = imageDataRowRedEn(:,1)*100;

%k-Means cluster
k=10;
[Indices,Colors] = kmeans(imageDataRow,k);
[IndicesRedEn,ColorsRedEn] = kmeans(imageDataRowRedEn,k);
newImageDataRow = zeros([numPixels 3]);
newImageDataRowRedEn = zeros([numPixels 3]);
for row = 1:numPixels
   newImageDataRow(row,:) = Colors(Indices(row),:);
   newImageDataRowRedEn(row,:) = ColorsRedEn(IndicesRedEn(row),:);
end
newImageData = reshape(newImageDataRow,[numRow numColumn 3]);
newImageDataRowRedEn(1,:) = newImageDataRowRedEn(1,:)./100;
newImageDataRedEn = reshape(newImageDataRowRedEn,[numRow numColumn 3]);

imageTitle = strcat(num2str(k),'-means_',imname);
imwrite(newImageData,imageTitle,'JPEG');

imageTitleRedEn = strcat(num2str(k),'-means_redEn_',imname);
imwrite(newImageDataRedEn,imageTitleRedEn,'JPEG');