function [] = writeAverageGrayscaleImage( dirname, fileformat, outputImageName )
%WRITEAVERAGEGRAYSCALEIMAGE This writes the average grayscale and color
%                           images
%   Input
%       dirname: name of directory to search
%       fileformat: file format string for images to put into set
%       outputImageName: name to use when writing output file


[~, grayscaleImages] = getImageSetData(dirname,fileformat);
averageGrayscaleImage = mean(grayscaleImages,3);
imwrite(averageGrayscaleImage,outputImageName,'JPEG');

end


