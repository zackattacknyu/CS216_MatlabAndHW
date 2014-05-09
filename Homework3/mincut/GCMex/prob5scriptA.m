%script for part A

image = im2double(imread('segtest1.jpg'));
figure
imshow(image);
imageSize = size(image);

[pointsX,pointsY] = ginput(2);
pointsX = floor(pointsX);
pointsY = floor(pointsY);
radius=1;

foregroundVicinity = image(pointsY(1)-radius:pointsY(1)+radius,...
    pointsX(1)-radius:pointsX(1)+radius,:);
foreVicRed = foregroundVicinity(:,:,1);
foreVicGreen = foregroundVicinity(:,:,2);
foreVicBlue = foregroundVicinity(:,:,3);
foreColor = [mean(foreVicRed(:)) mean(foreVicGreen(:)) mean(foreVicBlue(:))];

backgroundVicinity = image(pointsY(2)-radius:pointsY(2)+radius,...
    pointsX(2)-radius:pointsX(2)+radius,:);
backVicRed = backgroundVicinity(:,:,1);
backVicGreen = backgroundVicinity(:,:,2);
backVicBlue = backgroundVicinity(:,:,3);
backColor = [mean(backVicRed(:)) mean(backVicGreen(:)) mean(backVicBlue(:))];

H = imageSize(1);
W = imageSize(2);
N = H*W;
pixelData = reshape(image,[N 3]);
backColorMatrix = repmat(backColor,[N 1]);
foreColorMatrix = repmat(foreColor,[N 1]);
foreRGBdist = sqrt(sum(abs(foreColorMatrix-pixelData),2));
backRGBdist = sqrt(sum(abs(backColorMatrix-pixelData),2));

lambda = 1;
segclass = zeros(N,1);
pairwise = sparse(N,N);

% Define binary classification problem
labelcost = [0 1;1 0]*lambda;
unary = [foreRGBdist backRGBdist]';

%add all horizontal links
for x = 1:W-1
  for y = 1:H
    node  = 1 + (y-1) + (x-1)*H;
    right = 1 + (y-1) + x*H;
    dist = norm(pixelData(node,:)-pixelData(right,:));
    pairwise(node,right) = dist;
    pairwise(right,node) = dist;
  end
end

%add all vertical nbr links
for x = 1:W
  for y = 1:H-1
    node = 1 + (y-1) + (x-1)*H;
    down = 1 + y + (x-1)*H;
    dist = norm(pixelData(node,:)-pixelData(down,:));
    pairwise(node,down) = dist;
    pairwise(down,node) = dist;
  end
end

[labels E Eafter] = GCMex(segclass, single(unary), pairwise, single(labelcost),0);

figure

subplot(211);
imagesc(image);
title('Original image');

subplot(212);
imagesc(reshape(labels,[H W]));
title('Min-cut');

%}
