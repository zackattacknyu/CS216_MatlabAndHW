%this code does the image experiments for problem 

%does the operations for the first image
picname = 'zebraMod.jpg';
%picname = 'dalmation1.jpg';
%picname = 'simpsons2.jpg';
imageData = im2double(rgb2gray(imread(picname)));
bwPicName = strcat('bw_',picname);
imwrite(imageData,bwPicName,'JPEG');
imageFFT = fft2(imageData);

magSpectrumImage = abs(imageFFT);
magSpectrumImageNorm = (magSpectrumImage - min(magSpectrumImage(:)))/max(magSpectrumImage(:));
figure
imagesc(magSpectrumImageNorm);
magImageName = strcat('magImage_',picname);
imwrite(magSpectrumImageNorm,magImageName,'JPEG');
title(strcat('Magnitude Spectrum Image: ',picname));
colorbar;

phaseSpectrumImage = angle(imageFFT);
figure
imagesc(phaseSpectrumImage);
phaseImageName = strcat('phaseImage_',picname);
imwrite(phaseSpectrumImage,phaseImageName,'JPEG');
title(strcat('Phase Spectrum Image: ',picname));
colorbar;

%does the operations for the second image
pic2name = 'simpsons.jpg';
%pic2name = 'southpark1.jpg';
%pic2name = 'southpark2.jpg';
image2Data = im2double(rgb2gray(imread(pic2name)));
bwPic2Name = strcat('bw_',pic2name);
imwrite(image2Data,bwPic2Name,'JPEG');
image2FFT = fft2(image2Data);

magSpectrumImage2 = abs(image2FFT);
magSpectrumImage2Norm = (magSpectrumImage2 - min(magSpectrumImage2(:)))/max(magSpectrumImage2(:));
figure
imagesc(magSpectrumImage2);
magImage2Name = strcat('magImage_',pic2name);
imwrite(magSpectrumImage2Norm,magImage2Name,'JPEG');
title(strcat('Magnitude Spectrum Image: ',pic2name));
colorbar;

phaseSpectrumImage2 = angle(image2FFT);
figure
imagesc(phaseSpectrumImage2);
phaseImage2Name = strcat('phaseImage_',pic2name);
imwrite(phaseSpectrumImage2,phaseImage2Name,'JPEG');
title(strcat('Phase Spectrum Image: ',pic2name));
colorbar;

%combine magnitude and phase
newFFTimage = magSpectrumImage.*exp(phaseSpectrumImage2.*1i);
newFFTimage2 = magSpectrumImage2.*exp(phaseSpectrumImage.*1i);
newImage = ifft2(newFFTimage);
newImage2 = ifft2(newFFTimage2);
imwrite(newImage,'mag_zebra_phase_simpsons.jpg','JPEG');
imwrite(newImage2,'mag_simpsons_phase_zebra.jpg','JPEG');