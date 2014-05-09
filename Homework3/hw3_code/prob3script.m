imageData = imread('zebra_small.jpg');

%captures the neck
centerX = 90;
centerY = 60;
radius = 40;
[~,~,imagePatch1] = prob3function(imageData,centerX,centerY,radius,0);

%the tree leaves above the zebra's back
centerX = 165;
centerY = 20;
radius = 30;
[~,~,imagePatch2] = prob3function(imageData,centerX,centerY,radius,0);

%grass in front of the zebra
centerX = 136;
centerY = 224;
radius = 20;
[~,~,imagePatch3] = prob3function(imageData,centerX,centerY,radius,0);

figure
subplot(1,3,1)
imshow(imagePatch1)
subplot(1,3,2)
imshow(imagePatch2)
subplot(1,3,3)
imshow(imagePatch3)

prob2function(imagePatch1);
prob2function(imagePatch2);
prob2function(imagePatch3);