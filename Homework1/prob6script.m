setname = 'set2';
dirname = strcat('imageSet/',setname,'/*.jpg');
set1list = dir(dirname);
numImages = length(set1list);
imnameStart = strcat('imageSet/',setname,'/');

%get info on first image
firstColorImage = imread([imnameStart set1list(1).name]);
firstGrayscaleImage = rgb2gray(firstColorImage);
colorImages = zeros([size(firstColorImage) numImages]);
grayscaleImages = zeros([size(firstGrayscaleImage) numImages]);

for i=1:numImages
   imname = [imnameStart set1list(i).name];
   currentColorImage = imread(imname);
   currentGrayscaleImage = rgb2gray(currentColorImage);
   colorImages(:,:,:,i) = im2double(currentColorImage);
   grayscaleImages(:,:,i) = im2double(currentGrayscaleImage);
end

totalColorImage = sum(colorImages,4);
totalGrayscaleImage = sum(grayscaleImages,3);
averageColorImage = totalColorImage./numImages;
averageGrayscaleImage = totalGrayscaleImage./numImages;

colorImageName = strcat(setname,'color.jpg');
grayscaleImageName = strcat(setname,'grayscale.jpg');
imwrite(averageColorImage,colorImageName,'JPEG');
imwrite(averageGrayscaleImage,grayscaleImageName,'JPEG');

%compute standard deviation
averageRepeated = repmat(averageGrayscaleImage,[1 1 numImages]);
squaredDifferences = (grayscaleImages-averageRepeated).^2;
totalVariance = sum(squaredDifferences,3);
meanSquaredError = totalVariance./numImages;
stndDevMatrix = sqrt(meanSquaredError);

imagesc(stndDevMatrix);
axis image;

minStndDev = min(stndDevMatrix(:));
maxStndDev = max(stndDevMatrix(:));
scaledStndDevMatrix = (stndDevMatrix-minStndDev)./(maxStndDev-minStndDev);
stndDevImageName = strcat(setname,'grayscaleStndDev.jpg');
imwrite(scaledStndDevMatrix,stndDevImageName,'JPEG');