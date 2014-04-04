setname = 'set1';
dirname = strcat('imageSet/',setname);
fileformat = '/*.jpg';

[colorImages, grayscaleImages] = getImageSetData(dirname,fileformat);

colorImageName = strcat(setname,'color.jpg');
grayscaleImageName = strcat(setname,'grayscale.jpg');

writeAverageGrayscaleImage(dirname,fileformat,grayscaleImageName);
writeAverageColorImage(dirname,fileformat,colorImageName);

%compute standard deviation
stndDevMatrix = std(grayscaleImages,1,3);

imagesc(stndDevMatrix);
axis image;

minStndDev = min(stndDevMatrix(:));
maxStndDev = max(stndDevMatrix(:));
scaledStndDevMatrix = (stndDevMatrix-minStndDev)./(maxStndDev-minStndDev);
stndDevImageName = strcat(setname,'grayscaleStndDev.jpg');
imwrite(scaledStndDevMatrix,stndDevImageName,'JPEG');