function [responses,meanResponse,imagePatch] = ...
    prob3function( imageData, centerX,centerY,radius,suppressOutput )
%PROB3FUNCTION Summary of this function goes here
%   Detailed explanation goes here
imagePatch = imageData( (centerY-radius/2):(centerY+radius/2),...
    (centerX-radius/2):(centerX+radius/2) );


responses = zeros(radius+1,radius+1,8);
[responses(:,:,1),responses(:,:,2),responses(:,:,3),...
    responses(:,:,4),responses(:,:,5),responses(:,:,6),...
    responses(:,:,7),responses(:,:,8)] = ...
    get8FilterImages(imagePatch);

meanResponse = zeros(1,8);
for i=1:8
    meanResponse(i) = mean(mean(abs(responses(:,:,i))));
end

if(suppressOutput ~= 1)
    figure
    bar(meanResponse);
    set(gca,'XTickLabel',{'Horiz_Sigma1', 'Vert_Sigma1',...
        'Horiz_Sigma2', 'Vert_Sigma2', 'Horiz_Sigma4',...
        'Vert_Sigma4', 'Sigma4-Sigma2', 'Sigma2-Sigma1'});
    ylabel('Response');
end


end

