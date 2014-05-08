
imname = 'zebra_small.jpg';
imageData = im2double(rgb2gray(imread(imname)));
%
%h1 means horizontal derivative, sigma 1
%h2, h4, v1, v2, v4 follow the same thing
%g42 is gaussian 4-2, g21 is similar
[h1,v1,h2,v2,h4,v4,g42,g21] = get8FilterImages(imageData,imname);
figure
subplot(4,2,1)
imshow(h1)
subplot(4,2,2)
imshow(v1)
subplot(4,2,3)
imshow(h2)
subplot(4,2,4)
imshow(v2)
subplot(4,2,5)
imshow(h4)
subplot(4,2,6)
imshow(v4)
subplot(4,2,7)
imshow(g42)
subplot(4,2,8)
imshow(g21)