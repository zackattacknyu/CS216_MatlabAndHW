function [filterDiffImageData] = computeGaussDiff( imageData,sigma1,sigma2,imname )
%COMPUTEDERIVIMAGES Summary of this function goes here
%   Detailed explanation goes here

gaussFilt1 = fspecial('gaussian',sigma1);
gaussFilt2 = fspecial('gaussian',sigma2);
filteredImageData1 = conv2(imageData,gaussFilt1,'same');
filteredImageData2 = conv2(imageData,gaussFilt2,'same');
filterDiffImageData = filteredImageData2-filteredImageData1;
%filterDiffImageName = strcat('sigma2_',num2str(sigma2),'_sigma1_',...
%    num2str(sigma1),'_gaussDiff_',imname);

%imwrite(filterDiffImageData,filterDiffImageName,'JPEG');

end

