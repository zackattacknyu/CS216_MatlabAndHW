image = im2double(imread('segtest2.jpg'));
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

%makes im, the labels
height = imageSize(1);
width = imageSize(2);
foreRGBdist = zeros(height,width);
backRGBdist = zeros(height,width);
for i = 1:imageSize(1)
   for j = 1:imageSize(2)
      
       pixel = reshape(image(i,j,:),[1 3]);
       foreRGBdist(i,j) = norm(pixel-foreColor);
       backRGBdist(i,j) = norm(pixel-backColor);
   end
end
im = double(foreRGBdist<backRGBdist);
noisy = foreRGBdist-backRGBdist;
maxNoisy = max(noisy(:));
minNoisy = min(noisy(:));
noisy = (noisy-minNoisy)./(maxNoisy-minNoisy);

figure
imshow(im)
figure
imagesc(noisy);
colorbar;

%prob5function(im,noisy)
