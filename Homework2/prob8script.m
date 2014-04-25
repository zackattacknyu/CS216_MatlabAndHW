imageName = 'dilbert1.jpg';

%for dilbert, it is already BW, so no need to call rgb2gray
rawImageData = 1-im2double(imread(imageName));
imageData = double((rawImageData > 0.5));

%figure
%imshow(imageData)

%used to get the corner values of the square we care about 
%[xVals,yVals] = ginput(2)

%values for the word "Nine"
rightX = 386;
leftX = 375;
bottomY = 50;
topY = 64;

nLetterImageData = imageData(bottomY:topY,leftX:rightX);
imwrite(nLetterImageData,'nine_word_dilbert1.jpg','JPEG');

%correlation = xcorr2(imageData,nLetterImageData);
%correlation = xcorr2(nLetterImageData,imageData);
Template = flipud(fliplr(nLetterImageData));
correlation = conv2(imageData,Template,'same');
imagesc(correlation);
colorbar;

%does the thresholding
%this is the 1-D example. It needs to be extended to 2D
%threshold = mean(correlation(:)); %this is currently 387
threshold = 47;
L = (correlation(2:end-1,2:end-1) > correlation(1:end-2,2:end-1));
R = (correlation(2:end-1,2:end-1) > correlation(3:end,2:end-1));

%upper left, right, and middle ones
UL = (correlation(2:end-1,2:end-1) > correlation(1:end-2,1:end-2));
UM = (correlation(2:end-1,2:end-1) > correlation(2:end-1,1:end-2));
UR = (correlation(2:end-1,2:end-1) > correlation(3:end,1:end-2));

%lower left, right, and middle ones
LL = (correlation(2:end-1,2:end-1) > correlation(1:end-2,3:end));
LM = (correlation(2:end-1,2:end-1) > correlation(2:end-1,3:end));
LR = (correlation(2:end-1,2:end-1) > correlation(3:end,3:end));

T = (correlation(2:end-1,2:end-1) > threshold);
maxima = R & L & T & UL & UM & UR & LL & LM & LR;

%preps data for the overlay
%  for the grayscale to rgb, all the color channels are the same
imageDataSize = size(imageData);
rgbImageData = zeros(imageDataSize(1),imageDataSize(2),3);
rgbImageData(:,:,1) = imageData;
rgbImageData(:,:,2) = imageData;
rgbImageData(:,:,3) = imageData;
maximaInverted = 1-maxima;

%puts red dots at the maxima points
%  this is done by zeroing each channel at a maxima point
%  For the red channel, zeros are put at the maxima points 
%       and then a 1 value is put there
rgbImageData(2:end-1,2:end-1,1) = imageData(2:end-1,2:end-1).*maximaInverted + maxima;
rgbImageData(2:end-1,2:end-1,2) = imageData(2:end-1,2:end-1).*maximaInverted;
rgbImageData(2:end-1,2:end-1,3) = imageData(2:end-1,2:end-1).*maximaInverted;

figure
imshow(rgbImageData);
sizeMaxima = size(maxima);
sizeTemplate = size(Template);
horizSizeTemplate = sizeTemplate(2);
vertSizeTemplate = sizeTemplate(1);
for y = 1:sizeMaxima(1)
   for x = 1:sizeMaxima(2)
      if(maxima(y,x) > 0)
          xCoord = (x+1) - horizSizeTemplate/2;
          yCoord = (y+1) + vertSizeTemplate/2;
         rectangle('Position',[xCoord yCoord horizSizeTemplate vertSizeTemplate]);
      end
   end
end