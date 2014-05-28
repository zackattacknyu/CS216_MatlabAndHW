%script for part A

imageInit = im2double(imread('image1.jpg'));
figure
imshow(imageInit);
imageSize = size(imageInit);

foreColorBWVal = max(max(imageInit));
backColorBWVal = min(min(imageInit));

foreColor = [foreColorBWVal foreColorBWVal foreColorBWVal];
backColor = [backColorBWVal backColorBWVal backColorBWVal];

H = imageSize(1);
W = imageSize(2);

image = zeros(H,W,3);
image(:,:,1) = imageInit;
image(:,:,2) = imageInit;
image(:,:,3) = imageInit;


N = H*W;
pixelData = reshape(image,[N 3]);
backColorMatrix = repmat(backColor,[N 1]);
foreColorMatrix = repmat(foreColor,[N 1]);
foreRGBdist = sqrt(sum(abs(foreColorMatrix-pixelData),2));
backRGBdist = sqrt(sum(abs(backColorMatrix-pixelData),2));

lambda = 0.5;
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
imagesc(reshape(labels,[H W]));


