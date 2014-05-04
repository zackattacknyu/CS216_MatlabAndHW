imageData = imread('zebra_small.jpg');

%captures the neck
centerX = 90;
centerY = 60;
radius = 40;
prob4function(imageData,centerX,centerY,radius);

%the tree leaves above the zebra's back
centerX = 165;
centerY = 20;
radius = 30;
prob4function(imageData,centerX,centerY,radius);

%grass in front of the zebra
centerX = 136;
centerY = 224;
radius = 20;
prob4function(imageData,centerX,centerY,radius);

