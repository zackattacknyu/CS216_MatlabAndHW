%does the operations for the first image
%picname = 'zebraMod.jpg';
%picname = 'dalmation1.jpg';
picname = 'simpsons2.jpg';
imageData = im2double(rgb2gray(imread(picname)));
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

%does the operations for the second image
%pic2name = 'simpsons.jpg';
%pic2name = 'southpark1.jpg';
pic2name = 'southpark2.jpg';
image2Data = im2double(rgb2gray(imread(pic2name)));
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

%combine magnitude and phase
newFFTimage = magSpectrumImage.*exp(phaseSpectrumImage2.*1i);
newFFTimage2 = magSpectrumImage2.*exp(phaseSpectrumImage.*1i);
newImage = ifft2(newFFTimage);
newImage2 = ifft2(newFFTimage2);
imwrite(newImage,'mag_simpsons2_phase_southpark2.jpg','JPEG');
imwrite(newImage2,'mag_southpark2_phase_simpsons2.jpg','JPEG');