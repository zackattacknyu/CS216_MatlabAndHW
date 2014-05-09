function [horizDerivImage,vertDerivImage] = computeDerivImages( imageData,sigma,imname )
%COMPUTEDERIVIMAGES Summary of this function goes here
%   Detailed explanation goes here

gaussFilt = fspecial('gaussian',sigma);
rowNum = ceil(sigma/2);
gaussFilter = gaussFilt(rowNum,:);
filteredImageData = conv2(imageData,gaussFilter,'same');
horizDerivFilter = [1 -1];
horizDerivImage = conv2(filteredImageData,horizDerivFilter,'same');
vertDerivFilter = [1;-1];
vertDerivImage = conv2(filteredImageData,vertDerivFilter,'same');
%horizDerivImageName = strcat('sigma_',num2str(sigma),'_horizDeriv_',imname);
%vertDerivImageName = strcat('sigma_',num2str(sigma),'_vertDeriv_',imname);
%imwrite(horizDerivImage,horizDerivImageName,'JPEG');
%imwrite(vertDerivImage,vertDerivImageName,'JPEG');

end

