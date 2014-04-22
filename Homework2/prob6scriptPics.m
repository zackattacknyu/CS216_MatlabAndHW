picname = 'zebra1.jpg';
imageData = rgb2gray(imread(picname));
bwPicName = strcat('bw_',picname);
imwrite(imageData,bwPicName,'JPEG');
imageFFT = fft2(imageData);

magSpectrumImage = abs(imageFFT);
figure
imagesc(magSpectrumImage);
title(strcat('Magnitude Spectrum Image: ',picname));
colorbar;

phaseSpectrumImage = angle(imageFFT);
figure
imagesc(phaseSpectrumImage);
title(strcat('Phase Spectrum Image: ',picname));
colorbar;