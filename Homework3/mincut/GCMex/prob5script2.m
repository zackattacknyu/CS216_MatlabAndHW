image = im2double(imread('segtest2.jpg'));
figure
subplot(3,1,1)
imshow(image);

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
foreColorToShow = zeros(1,1,3);
foreColorToShow(1,1,:) = foreColor;
subplot(3,1,2)
imshow(foreColorToShow)

backgroundVicinity = image(pointsY(2)-radius:pointsY(2)+radius,...
    pointsX(2)-radius:pointsX(2)+radius,:);
backVicRed = backgroundVicinity(:,:,1);
backVicGreen = backgroundVicinity(:,:,2);
backVicBlue = backgroundVicinity(:,:,3);
backColor = [mean(backVicRed(:)) mean(backVicGreen(:)) mean(backVicBlue(:))];
backColorToShow = zeros(1,1,3);
backColorToShow(1,1,:) = backColor;
subplot(3,1,3)
imshow(backColorToShow)