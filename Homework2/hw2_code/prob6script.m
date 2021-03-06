%this code does the plots for each of the functions

%first part
signal = zeros(1,100);
signal(50) = 1;
signalDFTmag = abs(fft(signal));

figure
plot(signalDFTmag);
xlabel('Index');
ylabel('Magnitude of Spectrum');
title('Frequency Spectrum Magnitude with single unit impulse');

%5 sample long spectrum magnitude
signal_5 = ones(1,5);
signal(48:52) = signal_5;
signalDFTmag_5 = abs(fftshift(fft(signal)));

figure
plot(signalDFTmag_5);
xlabel('Index');
ylabel('Magnitude of Spectrum');
title('Frequency Spectrum Magnitude with 5 sample impulse');

%10 sample long spectrum magnitude
signal_10 = ones(1,10);
signal(45:54) = signal_10;
signalDFTmag_10 = abs(fftshift(fft(signal)));

figure
plot(signalDFTmag_10);
xlabel('Index');
ylabel('Magnitude of Spectrum');
title('Frequency Spectrum Magnitude with 10 sample impulse');

%Gaussian function frequency plots
figure
gaussFunc_X = -50:1:50;
sigma = 1;
gaussFunc_Y = (1/(sigma*sqrt(2*pi)))*exp(-gaussFunc_X.^2/(2*sigma^2));
gaussFunc_freq = abs(fftshift(fft(gaussFunc_Y)));
plot(gaussFunc_freq);
xlabel('Index');
ylabel('Magnitude of Spectrum');
title('Frequency Spectrum Magnitude of Gaussian function. sigma=1');

%DFT of my favorite function, the parabola
parabola_input = -0.5:1/50:0.5-1/50;
parabola_signal = parabola_input.^2;
parabola_dft = abs(fftshift(fft(parabola_signal)));

figure
plot(parabola_input,parabola_dft);
xlabel('Parabola X Value');
ylabel('Magnitude of Spectrum');
title('Frequency Spectrum Magnitude with Parabola');