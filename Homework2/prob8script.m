imageName = 'dilbert1.jpg';

%for dilbert, it is already BW, so no need to call rgb2gray
imageData = im2double(imread(imageName));

%figure
%imshow(imageData)

%used to get the corner values of the square we care about 
%[xVals,yVals] = ginput(4)

%values for the "N" letter
rightX = 334;
leftX = 323;
bottomY = 69;
topY = 82;

nLetterImageData = imageData(bottomY:topY,leftX:rightX);
imwrite(nLetterImageData,'nLetter1_dilbert1.jpg','JPEG');

correlation = xcorr2(imageData,nLetterImageData);
%correlation = xcorr2(nLetterImageData,imageData);
imagesc(correlation);
colorbar;

%does the thresholding
%this is the 1-D example. It needs to be extended to 2D
threshold = mean(correlation(:));
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

figure
imagesc(maxima);
colorbar;


%values for the other "N" letter
rightX = 334;
leftX = 323;
bottomY = 32;
topY = 45;

nLetterImageData2 = imageData(bottomY:topY,leftX:rightX);
imwrite(nLetterImageData,'nLetter2_dilbert1.jpg','JPEG');