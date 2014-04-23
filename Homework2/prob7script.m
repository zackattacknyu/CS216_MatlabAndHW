picname = 'simpsons.jpg';
imageData = im2double(rgb2gray(imread(picname)));
figure
imagesc(imageData);
colorbar
title('Original Image');

sigma = 3;
gaussFilt = ones(sigma,sigma).*(1/sigma^2);
filteredImageData = conv2(imageData,gaussFilt,'same');
figure
imagesc(filteredImageData);
colorbar
title('Filtered Image');

