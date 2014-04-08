setname = 'set1';
dirname = strcat('imageSet/',setname);
fileformat = '/*.jpg';

colorImageName = strcat(setname,'color.jpg');
grayscaleImageName = strcat(setname,'grayscale.jpg');
stndDevImageName = strcat(setname,'grayscaleStndDev.jpg');

writeAverageGrayscaleImage(dirname,fileformat,grayscaleImageName);
writeAverageColorImage(dirname,fileformat,colorImageName);
writeStndDevImage(dirname,fileformat,stndDevImageName);