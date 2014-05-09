%script for problem 5, Part B

image = im2double(imread('segtest3.jpg'));
figure
imshow(image);
imageSize = size(image);
H = imageSize(1);
W = imageSize(2);
N = H*W;

[pointsX,pointsY] = ginput(2);
pointsX = floor(pointsX);
pointsY = floor(pointsY);
radius=1;

responses = zeros(H,W,8);
[responses(:,:,1),responses(:,:,2),responses(:,:,3),...
    responses(:,:,4),responses(:,:,5),responses(:,:,6),...
    responses(:,:,7),responses(:,:,8)] = ...
    get8FilterImages(rgb2gray(image));

responses = abs(responses);
foregroundVicinity = responses(pointsY(1)-radius:pointsY(1)+radius,...
    pointsX(1)-radius:pointsX(1)+radius,:);
foreSize = size(foregroundVicinity);
foreVic = reshape(foregroundVicinity,[foreSize(1)*foreSize(2) foreSize(3)]);
foreColor = mean(foreVic);

backgroundVicinity = responses(pointsY(2)-radius:pointsY(2)+radius,...
    pointsX(2)-radius:pointsX(2)+radius,:);
backSize = size(backgroundVicinity);
backVic = reshape(backgroundVicinity,[backSize(1)*backSize(2) backSize(3)]);
backColor = mean(backVic);

pixelData = reshape(image,[N 3]);
pixelResponseInfo = reshape(responses,[N 8]);

backColorMatrix = repmat(backColor,[N 1]);
foreColorMatrix = repmat(foreColor,[N 1]);
foreRGBdist = sqrt(sum(abs(foreColorMatrix-pixelResponseInfo),2));
backRGBdist = sqrt(sum(abs(backColorMatrix-pixelResponseInfo),2));

lambda = 0.001;
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
hold on
imshow(image);
plot(pointsX,pointsY,'x','LineWidth',2);
title('Original image');
hold off

subplot(212);
imagesc(reshape(labels,[H W]));
title('Min-cut');

