A = rgb2gray(imread('modifiedImageProb5.jpg'));
A = im2double(A);
imwrite(A,'blackWhiteImage.jpg','JPEG');

%Part A
singleVectorA = A(:);
sortedValuesA = sort(singleVectorA);
figure
plot(sortedValuesA);
xlabel('Entry Number in Sorted Vector');
ylabel('Intensity Value');
title('Problem 5, Part A plot of sorted intensity values');

%Part B
figure
hist(singleVectorA,32);
xlabel('Intensity Bin');
ylabel('Number of Occurances');
title('Problem 5, Part B histogram of intensities');

%Part C
threshold = 0.65;
binaryA = zeros(size(A));
binaryA(A > threshold) = 1;
imwrite(binaryA,'partCimage.jpg','JPEG');

%Part D
sizeA = size(A);
sizeAhoriz = sizeA(1);
sizeAvert = sizeA(2);
bottomRightA = A(sizeAhoriz/2:sizeAhoriz,sizeAvert/2:sizeAvert);
imwrite(bottomRightA,'partDimage.jpg','JPEG');

%Part E
meanBrightness = mean(singleVectorA);
meanSubtractedA = A-meanBrightness;
meanSubtractedA( meanSubtractedA < 0) = 0;
imwrite(meanSubtractedA,'partEimage.jpg','JPEG');

%diceRoll_partF.m is part F

%Part G
y = [1:6];
z = reshape(y,3,2);

%Part H
x = min(singleVectorA);
[r,c] = find(A==x,1);

%Part I
v = [1 8 8 2 1 3 9 8];
sizeUniqueV = size(unique(v));
numUnique = sizeUniqueV(2);