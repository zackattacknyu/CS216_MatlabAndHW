function [mag,ori] = mygradient(I)
%
% compute image gradient magnitude and orientation at each pixel
%

horizDeriv = [1 -1];
vertDeriv = [1;-1];
horizDerivImage = conv2(I,horizDeriv,'same');
vertDerivImage = conv2(I,vertDeriv,'same');
complexImage = horizDerivImage + vertDerivImage*sqrt(-1);
mag = abs(complexImage);
ori = angle(complexImage);

