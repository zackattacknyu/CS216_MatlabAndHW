function [] = writeStndDevImage( dirname, fileformat, outputImageName )
%WRITESTNDDEVIMAGE This writes and displays the standard deviation image
%
%   Input
%       dirname: name of directory to search
%       fileformat: file format string for images to put into set
%       outputImageName: name to use when writing output file


[~, grayscaleImages] = getImageSetData(dirname,fileformat);

%compute standard deviation
stndDevMatrix = std(grayscaleImages,1,3);

figure
imagesc(stndDevMatrix);
axis image;
colorbar;

minStndDev = min(stndDevMatrix(:));
maxStndDev = max(stndDevMatrix(:));
scaledStndDevMatrix = (stndDevMatrix-minStndDev)./(maxStndDev-minStndDev);
imwrite(scaledStndDevMatrix,outputImageName,'JPEG');

end

