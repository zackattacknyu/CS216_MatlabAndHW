function [] = writeAverageGrayscaleImage( dirname, fileformat, outputImageName )
%WRITEAVERAGEGRAYSCALEIMAGE This writes and displays the average grayscale image
%   Input
%       dirname: name of directory to search
%       fileformat: file format string for images to put into set
%       outputImageName: name to use when writing output file


[~, grayscaleImages] = getImageSetData(dirname,fileformat);
averageGrayscaleImage = mean(grayscaleImages,3);
imwrite(averageGrayscaleImage,outputImageName,'JPEG');

figure
imshow(averageGrayscaleImage);
axis image;

end


