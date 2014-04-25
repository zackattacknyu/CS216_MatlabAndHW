picname = 'zebra1.jpg'; %specify which pic to use
imageData = im2double(rgb2gray(imread(picname)));
figure
imagesc(imageData);
colorbar
title('Original Image');

sigma = 3; %change this to sigma=2 for other example
gaussFilt = fspecial('gaussian',sigma);
filteredImageData = conv2(imageData,gaussFilt,'same');
figure
imagesc(filteredImageData);
colorbar
title('Filtered Image');

horizDerivFilter = [1 -1];
horizDerivImage = conv2(filteredImageData,horizDerivFilter,'same');
figure
imagesc(horizDerivImage);
colorbar;
title('Horizontal Derivative Image');

vertDerivFilter = transpose(horizDerivFilter);
vertDerivImage = conv2(filteredImageData,vertDerivFilter,'same');
figure
imagesc(vertDerivImage);
colorbar;
title('Vertical Derivative Image');

complexDerivImage = horizDerivImage + vertDerivImage.*1i;

figure
magDerivImage = abs(complexDerivImage);
imagesc(magDerivImage);
imwrite(magDerivImage,strcat('magGradient2_',picname),'JPEG');
colorbar;
title('Magnitude of the Gradient');

figure
orientationDerivImage = angle(complexDerivImage);
imagesc(orientationDerivImage);
imwrite(orientationDerivImage,strcat('orientGradient2_',picname),'JPEG');
colorbar;
title('Orientation of the Gradient');