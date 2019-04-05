function crosscorrWhole()

clc;
%% A = first image , B = second image. Examining there similarity

A = im2double(rgb2gray(imread('input/input.jpg')));
B = im2double(rgb2gray(imread('template_whole/chartemp1.jpg')));
 %B = im2double(rgb2gray(imread('template_whole/chartemp2.jpg')));
% B = im2double(rgb2gray(imread('template_whole/chartemp3.jpg')));
% B = im2double(rgb2gray(imread('template_whole/chartemp4.jpg')));

%%
%t = corrFunc(A, B); % correlation
t = nxcorrFunc(A, B); % normalized cross correlation

%% prinitng the similiarity. strcat() concatenates string, num2str() converts numbers to string
disp(strcat('similarity:',num2str(t*100), '%')); 


%% subplotiing: ploting multiple figures in one window
figure;
subplot(1,2,1);
imshow(A, [0 1]);
title('first image');

subplot(1,2,2);
imshow(B, [0 1]);
title('second image');

end


function t = corrFunc(A, B)

t = A.*B;
t = sum(t(:));

end

function t = nxcorrFunc(A, B)

meanA = mean(A(:));
meanB = mean(B(:));

r1 = A - meanA;
r2 = B - meanB;
c1 = r1.^2;
c2 = r2.^2;
c = (sum(c1(:))*sum(c2(:)))^0.5;
t = sum(sum(r1.*r2))/c;

end
