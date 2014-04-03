setname = 'set1';
dirname = strcat('imageSet/',setname,'/*.jpg');
set1list = dir(dirname);
numImages = length(set1list);
colorImages = cell(1,numImages);
grayscaleImages = cell(1,numImages);
imnameStart = strcat('imageSet/',setname,'/');
for i=1:numImages
   imname = [imnameStart set1list(i).name];
   currentColorImage = imread(imname);
   currentGrayscaleImage = rgb2gray(currentColorImage);
   colorImages{i} = im2double(currentColorImage);
   grayscaleImages{i} = im2double(currentGrayscaleImage);
end

totalColorImage = zeros(size(colorImages{1}));
totalGrayscaleImage = zeros(size(grayscaleImages{1}));
for i=1:numImages
   totalColorImage = colorImages{i} + totalColorImage;
   totalGrayscaleImage = grayscaleImages{i} + totalGrayscaleImage;
end

averageColorImage = totalColorImage./numImages;
averageGrayscaleImage = totalGrayscaleImage./numImages;

colorImageName = strcat(setname,'color.jpg');
grayscaleImageName = strcat(setname,'grayscale.jpg');
imwrite(averageColorImage,colorImageName,'JPEG');
imwrite(averageGrayscaleImage,grayscaleImageName,'JPEG');

%compute standard deviation
totalVariance = zeros(size(grayscaleImages{1}));
for i = 1:numImages
    totalVariance = totalVariance + (grayscaleImages{i}-averageGrayscaleImage).^2;
end
totalVariance = totalVariance./numImages;
stndDevMatrix = sqrt(totalVariance);

imagesc(stndDevMatrix);
axis image;

minStndDev = min(stndDevMatrix(:));
maxStndDev = max(stndDevMatrix(:));
scaledStndDevMatrix = (stndDevMatrix-minStndDev)./(maxStndDev-minStndDev);
stndDevImageName = strcat(setname,'grayscaleStndDev.jpg');
imwrite(scaledStndDevMatrix,stndDevImageName,'JPEG');