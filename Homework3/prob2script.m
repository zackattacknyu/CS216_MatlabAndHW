
imname = 'zebra_small.jpg';
imageData = im2double(rgb2gray(imread(imname)));
computeDerivImages(imageData,1,imname);
computeDerivImages(imageData,2,imname);
computeDerivImages(imageData,4,imname);
computeGaussDiff(imageData,1,2,imname);
computeGaussDiff(imageData,2,4,imname);