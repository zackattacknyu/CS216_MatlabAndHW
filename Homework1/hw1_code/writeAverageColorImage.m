function [] = writeAverageColorImage( dirname, fileformat, outputImageName )
%WRITEAVERAGEGRAYSCALEIMAGE This writes and displays the average color image
%
%   Input
%       dirname: name of directory to search
%       fileformat: file format string for images to put into set
%       outputImageName: name to use when writing output file


[colorImages, ~] = getImageSetData(dirname,fileformat);
averageColorImage = mean(colorImages,4);
imwrite(averageColorImage,outputImageName,'JPEG');

figure
imshow(averageColorImage);
axis image;

end

