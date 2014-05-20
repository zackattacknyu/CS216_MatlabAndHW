%% Problem1script
imname = 'test1.jpg';
imageData = im2double(rgb2gray(imread(imname)));

ohist = hog(imageData);

for k=1:9
    figure
    imshow(ohist(:,:,k));
end

%% Problem2script
threshold=2;

