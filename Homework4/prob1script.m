imname = 'test1.jpg';
imageData = im2double(rgb2gray(imread(imname)));

horizDeriv = [1 -1];
vertDeriv = [1 -1];

imageDataSize = size(imageData);
vertSize = imageDataSize(1);
horizSize = imageDataSize(2);

numBlocksHoriz = floor(horizSize/8);
numBlocksVert = floor(vertSize/8);

ohist = zeros(numBlocksVert,numBlocksHoriz,9);

for i = 0:numBlocksVert-1
   for j = 0:numBlocksHoriz-1
       rowStart = 8*i + 1;
       rowEnd = 8*i + 8;
       colStart = 8*j + 1;
       colEnd = 8*j + 8;
       
       imageDataBlock = imageData(rowStart:rowEnd,colStart:colEnd);
       
       horizDerivImage = conv2(imageDataBlock,horizDeriv,'same');
       vertDerivImage = conv2(imageDataBlock,vertDeriv,'same');
       complexImage = horizDerivImage + vertDerivImage*sqrt(-1);
       orientImage = angle(complexImage);

       bins = (-pi/2+pi/18):pi/9:(pi/2-pi/18);
       binInfo = hist(orientImage(:),bins);
       
       ohist(i+1,j+1,:) = binInfo;
   end
end

