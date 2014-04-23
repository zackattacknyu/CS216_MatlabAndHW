imageName = 'dilbert1.jpg';

%for dilbert, it is already BW, so no need to call rgb2gray
imageData = im2double(imread(imageName));

figure
imshow(imageData)

%used to get the corner values of the square we care about 
%[xVals,yVals] = ginput(4)

%values for the "N" letter
rightX = 334;
leftX = 323;
bottomY = 69;
topY = 82;

nLetterImageData = imageData(bottomY:topY,leftX:rightX);
imwrite(nLetterImageData,'nLetter1_dilbert1.jpg','JPEG');

%values for the other "N" letter
rightX = 334;
leftX = 323;
bottomY = 32;
topY = 45;

nLetterImageData2 = imageData(bottomY:topY,leftX:rightX);
imwrite(nLetterImageData,'nLetter2_dilbert1.jpg','JPEG');