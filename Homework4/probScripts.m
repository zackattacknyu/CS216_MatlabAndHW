%% Problem1script
imname = 'test1.jpg';
imageData = im2double(rgb2gray(imread(imname)));

ohist = hog(imageData);

for k=1:9
    figure
    imshow(ohist(:,:,k));
end

%% Problem2script
% load a training example image
%Itrain = im2double(rgb2gray(imread('pedSignTrain.jpg')));
Itrain = im2double(imread('pedSignTemplate.jpg'));

% compute the hog features
template = hog(Itrain);

%
% load a test image
%
Itest= im2double(rgb2gray(imread('test3.jpg')));


% find top 5 detections in Itest
ndet = 5;
[x,y,score] = detect(Itest,template,ndet);

%display top ndet detections
figure(3); clf; imshow(Itest);
for i = 1:ndet
  % draw a rectangle.  use color to encode confidence of detection
  %  top scoring are green, fading to red
  hold on; 
  h = rectangle('Position',[x(i)-64 y(i)-64 128 128],'EdgeColor',[(i/ndet) ((ndet-i)/ndet)  0],'LineWidth',3,'Curvature',[0.3 0.3]); 
  hold off;
end

