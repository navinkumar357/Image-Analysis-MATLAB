%Butterworth

book=imread('bike.jpg');
%Convert to grayscale
book=rgb2gray(book); 
imshow(book)

%Determine good padding for Fourier transform
PQ = paddedsize(size(book));

%Create a btw Highpass filter 5% the width of the Fourier transform
D0 = 0.05*PQ(1);
H = hpfilter('btw', PQ(1), PQ(2), D0);

% Calculate the discrete Fourier transform of the image
F=fft2(double(book),size(H,1),size(H,2));

% Apply the highpass filter to the Fourier spectrum of the image
HPFS_book = H.*F;

% convert the result to the spacial domain.
HPF_book=real(ifft2(HPFS_book)); 

% Crop the image to undo padding
HPF_book=HPF_book(1:size(book,1), 1:size(book,2));

%Display the "Sharpened" image
figure, imshow(HPF_book, [])

% Display the Fourier Spectrum
% Move the origin of the transform to the center of the frequency rectangle.
Fc=fftshift(F);
Fcf=fftshift(HPFS_book);
% use abs to compute the magnitude and use log to brighten display
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S1,[])
figure, imshow(S2,[])
 
%Gaussian
D0 = 0.05*PQ(1);
H = hpfilter('gaussian', PQ(1), PQ(2), D0);

% Calculate the discrete Fourier transform of the image
F=fft2(double(book),size(H,1),size(H,2));

% Apply the highpass filter to the Fourier spectrum of the image
HPFS_book = H.*F;

% convert the result to the spacial domain.
HPF_book=real(ifft2(HPFS_book)); 

% Crop the image to undo padding
HPF_book=HPF_book(1:size(book,1), 1:size(book,2));

%Display the "Sharpened" image
figure, imshow(HPF_book, [])

% Display the Fourier Spectrum
% Move the origin of the transform to the center of the frequency rectangle.
Fc=fftshift(F);
Fcf=fftshift(HPFS_book);
% use abs to compute the magnitude and use log to brighten display
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S1,[])
figure, imshow(S2,[])
 




