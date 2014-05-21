
function [x,y,score] = detection(I,template,ndet)
%
% return top ndet detections found by applying template to the given image.
%   x,y should contain the coordinates of the detections in the image
%   score should contain the scores of the detections
%


% compute the feature map for the image
f = hog(I);

nori = size(f,3);

% cross-correlate template with feature map to get a total response
R = zeros(size(f,1),size(f,2));
width = size(f,2);
height = size(f,1);
for i = 1:nori
    %corrImage = xcorr2(f(:,:,i),template(:,:,i));
    %midpointCorrImage = size(corrImage)./2;
    %midRow = midpointCorrImage(1);
    %midCol = midpointCorrImage(2);
    %finalCorrImage = corrImage(midRow-(height/2):midRow+(height/2),...
    %    midCol-(width/2):midCol+(width/2));
    %R = R + finalCorrImage;
    corrImage = conv2(f(:,:,i),rot90(template(:,:,i)),'same');
    R = R + corrImage;
end

% now return locations of the top ndet detections

% sort response from high to low
[val,ind] = sort(R(:),'descend');

% work down the list of responses, removing overlapping detections as we go
i = 1;
detcount = 0;
addedBlocks = zeros(height,width);
x = ones(ndet)*(-100);
y = ones(ndet)*(-100);
score = ones(ndet)*(-100);

minDistSquared = 100;

while ((detcount <= ndet) && (i <= length(ind)))
  % convert ind(i) back to (i,j) values to get coordinates of the block
  index = ind(i);
  yblock = mod(index-1,height)+1;
  xblock = floor((index-1)/height)+1;

  assert(val(i)==R(yblock,xblock)); %make sure we did the indexing correctly

  % now convert yblock,xblock to pixel coordinates 
  ypixel = yblock*8;
  xpixel = xblock*8;

  % check if this detection overlaps any detections which we've already added to the list
  distSquared = (y-ypixel).^2 + (x-xpixel).^2;
  overlappingPixels = double(distSquared<minDistSquared);
  overlap = sum(overlappingPixels)>0;
  
  % if not, then add this detection location and score to the list we return
  if (~overlap)
      detcount = detcount+1;
      addedBlocks(yblock,xblock)=1;
      x(detcount) = xpixel;
      y(detcount) = ypixel;
      score(detcount) = R(yblock,xblock);
    
  end
  i = i + 1;
end

x = x(1:detcount);
y = y(1:detcount);
score = score(1:detcount);

end
