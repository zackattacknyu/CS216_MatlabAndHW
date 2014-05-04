function [responses,meanResponse] = ...
    prob3function( imageData, centerX,centerY,radius,suppressOutput )
%PROB3FUNCTION Summary of this function goes here
%   Detailed explanation goes here
imagePatch = imageData( (centerY-radius/2):(centerY+radius/2),...
    (centerX-radius/2):(centerX+radius/2) );


responses = zeros(radius+1,radius+1,8);
[responses(:,:,1),responses(:,:,2),responses(:,:,3),...
    responses(:,:,4),responses(:,:,5),responses(:,:,6),...
    responses(:,:,7),responses(:,:,8)] = ...
    get8FilterImages(imagePatch,'zebra_small_patch.jpg');

meanResponse = mean(responses,3);

if(suppressOutput ~= 1)
    figure
    imshow(imagePatch); 
    figure
    imshow(meanResponse);
    figure
    bar(meanResponse,10);
end


end

