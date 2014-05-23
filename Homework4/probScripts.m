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
%Itrain = im2double(rgb2gray(imread('pedSign3Train.jpg')));

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

%% Problem 3 Script

Itrain = im2double(imread('pedSignTemplate.jpg'));

template = hog(Itrain);
Itest = im2double(rgb2gray(imread('test3.jpg')));
currentTest= Itest;
resizeFactor = 0.7;
properTest = size(Itrain)<size(currentTest);
blockWidth = 128;
level = 0;
xVals = []; yVals = []; scoreVals = [];
while(properTest(1) && properTest(2))
    
    % find top 5 detections in Itest
    ndet = 5;
    [x,y,score] = detect(currentTest,template,ndet);
    newX = x./(resizeFactor^level);
    newY = y./(resizeFactor^level);
    xVals = [xVals newX];
    yVals = [yVals newY];
    scoreVals = [scoreVals score];

    %display top ndet detections
    %figure(3); clf; 
    figure
    imshow(currentTest);
    for i = 1:ndet
      % draw a rectangle.  use color to encode confidence of detection
      %  top scoring are green, fading to red
      hold on; 
      h = rectangle('Position',[x(i)-(blockWidth/2) y(i)-(blockWidth/2) blockWidth blockWidth],...
          'EdgeColor',[(i/ndet) ((ndet-i)/ndet)  0],...
          'LineWidth',3,'Curvature',[0.3 0.3]); 
      hold off;
    end
    
    blockWidth = blockWidth*resizeFactor;
    currentTest = imresize(currentTest,resizeFactor);
    properTest = size(Itrain)<size(currentTest);
    level = level + 1;
end

[val ind] = sort(score,'descend');
xFinal = xVals(ind);
yFinal = yVals(ind);

%display top ndet detections
figure
imshow(Itest);
blockWidth = 128;
for i = 1:ndet
  % draw a rectangle.  use color to encode confidence of detection
  %  top scoring are green, fading to red
  hold on; 
  h = rectangle('Position',[xFinal(i)-(blockWidth/2) yFinal(i)-(blockWidth/2) blockWidth blockWidth],...
      'EdgeColor',[(i/ndet) ((ndet-i)/ndet)  0],...
      'LineWidth',3,'Curvature',[0.3 0.3]); 
  hold off;
end

%% Problem 4 Script
% load a training example image
Itrain = im2double(rgb2gray(imread('test3.jpg')));

%have the user click on some training examples.  
% If there is more than 1 example in the training image (e.g. faces), you could set nclicks higher here and average together
nclick = 1;
figure(1); clf;
imshow(Itrain);
numRects = 8;
numPosRects = 3; %number of initial rectangles which will be used for positive template
patches = cell(1,numRects);
widthValues = zeros(1,numRects);
heightValues = zeros(1,numRects);

for num = 1:numRects
    rect = getrect(figure(1));
    xmin = floor(rect(1));
    ymin = floor(rect(2));
    width = floor(rect(3));
    height = floor(rect(4));
    patch = Itrain(ymin:(ymin+height),xmin:(xmin+width));
    widthValues(num) = width;
    heightValues(num) = height;
    patches{num} = patch;
end

aspectRatioValues = widthValues./heightValues;
resizeHeight = mean(heightValues);
avgAspectRatio = mean(aspectRatioValues);
resizeWidth = resizeHeight*avgAspectRatio;
numHeightBlocks = floor(resizeHeight/8);
numWidthBlocks = floor(resizeWidth/8);
resizeHeight = numHeightBlocks*8;
resizeWidth = numWidthBlocks*8;

resizedPatches = zeros(resizeHeight,resizeWidth,numRects);

for num = 1:numRects
   figure
   resizedPatch = imresize(patches{num},[resizeHeight resizeWidth]);
   resizedPatches(:,:,num) = resizedPatch;
   imshow(resizedPatch)
end

% compute the hog features
%f = hog(Itrain);

negTemplate = zeros(numHeightBlocks,numWidthBlocks,9);
posTemplate = zeros(numHeightBlocks,numWidthBlocks,9);
for i = 1:numPosRects
   f = hog(resizedPatches(:,:,i)); 
   posTemplate = posTemplate + f;
end
for i = numPosRects+1:numRects
   f = hog(resizedPatches(:,:,i)); 
   negTemplate = negTemplate + f;
end
posTemplate = posTemplate/numPosRects;
negTemplate = negTemplate/(numRects-numPosRects);
template = posTemplate-negTemplate;

%
% load a test image
%
Itest= im2double(rgb2gray(imread('test4.jpg')));

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



