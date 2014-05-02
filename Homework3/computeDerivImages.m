function [magDerivImage,horizDerivImage,vertDerivImage] = computeDerivImages( imageData,sigma,imname )
%COMPUTEDERIVIMAGES Summary of this function goes here
%   Detailed explanation goes here

gaussFilt = fspecial('gaussian',sigma);
filteredImageData = conv2(imageData,gaussFilt,'same');
horizDerivFilter = [1 -1];
horizDerivImage = conv2(filteredImageData,horizDerivFilter,'same');
vertDerivFilter = transpose(horizDerivFilter);
vertDerivImage = conv2(filteredImageData,vertDerivFilter,'same');
complexDerivImage = horizDerivImage + vertDerivImage.*1i;
magDerivImage = abs(complexDerivImage);

magDerivImageName = strcat('sigma_',num2str(sigma),'_magDeriv_',imname);
horizDerivImageName = strcat('sigma_',num2str(sigma),'_horizDeriv_',imname);
vertDerivImageName = strcat('sigma_',num2str(sigma),'_vertDeriv_',imname);

imwrite(magDerivImage,magDerivImageName,'JPEG');
imwrite(horizDerivImage,horizDerivImageName,'JPEG');
imwrite(vertDerivImage,vertDerivImageName,'JPEG');

end

