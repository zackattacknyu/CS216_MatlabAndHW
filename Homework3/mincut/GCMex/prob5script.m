im = imread('demo.png');
im = double(im);
noisy = im + randn(size(im));
prob5function(im,noisy);
