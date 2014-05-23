function ohist = hog(I)
%
% compute orientation histograms over 8x8 blocks of pixels
% orientations are binned into 9 possible bins
%
% I : grayscale image of dimension HxW
% ohist : orinetation histograms for each block. ohist is of dimension (H/8)x(W/8)x9
%

[h,w] = size(I); %size of the input
h2 = ceil(h/8); %the size of the output
w2 = ceil(w/8);
heightPadding = h2*8 - h;
widthPadding = w2*8 - w;
nori = 9;       %number of orientation bins

[initMag,initOri] = mygradient(I);

paddedMag = padarray(initMag,[heightPadding widthPadding]);
mag = paddedMag(heightPadding+1:end,widthPadding+1:end);


paddedOri = padarray(initOri,[heightPadding widthPadding]);
ori = paddedOri(heightPadding+1:end,widthPadding+1:end);

thresh = 0.1*max(max(mag));  %threshold for edges

edgePixels = (mag>thresh);
binMins = (-pi/2):pi/9:(pi/2-pi/9);
binMaxs = (-pi/2+pi/9):pi/9:(pi/2);

% separate out pixels into orientation channels
ohist = zeros(h2,w2,nori);
for i = 1:nori
    
    minVal = binMins(i);
    maxVal = binMaxs(i);
    
  % create a binary image containing 1's for the pixels that are edges at this orientation
  B = edgePixels & (ori>=minVal) & (ori<=maxVal);
  
    for row = 0:h2-1
       for col = 0:w2-1
           rowStart = 8*row + 1;
           rowEnd = 8*row + 8;
           colStart = 8*col + 1;
           colEnd = 8*col + 8;
           
           %number of edges in this block at this orientation
           numOrientEdges = sum(sum(double(B(rowStart:rowEnd,colStart:colEnd))));
           
           %number of edges total in this block
           numTotalEdges = sum(sum(double(edgePixels(rowStart:rowEnd,colStart:colEnd))));
            
           if(numTotalEdges < 1)
            ohist(row+1,col+1,i) = 0;
           else
               ohist(row+1,col+1,i) = numOrientEdges/numTotalEdges;
           end
           
       end
    end
                     
end

end

