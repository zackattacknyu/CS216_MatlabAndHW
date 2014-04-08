function [ colorImages, grayscaleImages ] = getImageSetData( dirname, fileformat )
%GETIMAGESETDATA This gets the multi-dimensional array of color image data
%                and grayscale image data. All images must be same size
%   Input
%       dirname: name of directory to search
%       fileformat: file format string for images to put into set
%   Output
%       colorImages: color data array
%       grayscaleImages: grayscale data array

dirString = strcat(dirname,fileformat);
setList = dir(dirString);
numImages = length(setList);
imnameStart = strcat(dirname,'/');

%get info on first image
firstColorImage = imread([imnameStart setList(1).name]);
firstGrayscaleImage = rgb2gray(firstColorImage);
colorImages = zeros([size(firstColorImage) numImages]);
grayscaleImages = zeros([size(firstGrayscaleImage) numImages]);

for i=1:numImages
   imname = [imnameStart setList(i).name];
   currentColorImage = imread(imname);
   currentGrayscaleImage = rgb2gray(currentColorImage);
   colorImages(:,:,:,i) = im2double(currentColorImage);
   grayscaleImages(:,:,i) = im2double(currentGrayscaleImage);
end

end

