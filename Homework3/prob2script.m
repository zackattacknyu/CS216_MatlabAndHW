
imname = 'zebra_small.jpg';
imageData = im2double(rgb2gray(imread(imname)));
%
%h1 means horizontal derivative, sigma 1
%h2, h4, v1, v2, v4 follow the same thing
%g42 is gaussian 4-2, g21 is similar
[h1,v1,h2,v2,h4,v4,g42,g21] = get8FilterImages(imageData,imname);
figure

subplot(2,4,1)
imshow(h1,[])
title('Horiz,sigma=1');

subplot(2,4,2)
imshow(h2,[])
title('Horiz,sigma=2');

subplot(2,4,3)
imshow(h4,[])
title('Horiz,sigma=4');

subplot(2,4,4)
imshow(g42,[])
title('G_4 - G_2');

subplot(2,4,5)
imshow(v1,[])
title('Vert,sigma=1');

subplot(2,4,6)
imshow(v2,[])
title('Vert,sigma=2');

subplot(2,4,7)
imshow(v4,[])
title('Vert,sigma=4');

subplot(2,4,8)
imshow(g21,[])
title('G_2-G_1');