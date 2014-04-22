picname = 'zebraMod.jpg';
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

pic2name = 'simpsons.jpg';
image2Data = rgb2gray(imread(pic2name));
bwPic2Name = strcat('bw_',pic2name);
imwrite(image2Data,bwPic2Name,'JPEG');
image2FFT = fft2(image2Data);

magSpectrumImage2 = abs(image2FFT);
figure
imagesc(magSpectrumImage2);
title(strcat('Magnitude Spectrum Image: ',pic2name));
colorbar;

phaseSpectrumImage2 = angle(image2FFT);
figure
imagesc(phaseSpectrumImage2);
title(strcat('Phase Spectrum Image: ',pic2name));
colorbar;