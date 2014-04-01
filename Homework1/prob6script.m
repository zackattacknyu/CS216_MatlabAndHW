set1list = dir('imageSet/set1/*.jpg');
numImages = length(set1list);
colorImages = cell(1,numImages);
grayscaleImages = cell(1,numImages);
for i=1:numImages
   imname = ['imageSet/set1/' set1list(i).name];
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

imwrite(averageColorImage,'set1color.jpg','JPEG');
imwrite(averageGrayscaleImage,'set1grayscale.jpg','JPEG');