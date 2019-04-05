function crosscorrWindow()

clc; %% clearing the command window

%% taking inputs

I = rgb2gray(imread('input/input.jpg')); % input image with characters
temp = rgb2gray(imread('template_window/chartemp4.jpg')); %template to be matched

%% converting to [0 1]

S = im2double(I);
T = im2double(temp);

% S = [221,222,223,223,222,222,220;
%      221,222,222,221,221,221,220;
%      221,221,0,  220,0,  220,219;
%      220,221,221,0,  220,220,219;
%      220,221,0,  222,0,  221,219;
%      221,222,223,224,224,223,220;
%      222,223,223,223,224,223,221]-200;
%  
% T = [0, 220,0;
%      221,0, 220;
%      0, 222,0]-200;

% taking dimensions

[sRow, sCol] = size(S);
[tRow, tCol] = size(T);


%% R is the output image with matching
R = S;

%% x and y will hold the coordinate where matching found
x = 1;
y = 1;

%% flag will be 1 whenevr matching
flag = 0;

%% We need average of templates for cross correlation formula
meanT = mean(T(:));

%% the loop :)
for i = 1:sRow - tRow % each row, but end before boundary
   for j = 1:sCol - tCol % each column, but end before boundary
       
       %% extracting the local neighbors of input image
        a = S(i : i+tRow-1 , j : j+tCol-1);
        
        %% cross correlation
        meanA = mean(a(:)); % average of the local neighbors of input image
        r1 = a - meanA; 
        r2 = T - meanT;
        c1 = r1.^2;
        c2 = r2.^2;
        c = (sum(c1(:))*sum(c2(:)))^0.5;
        t = sum(sum(r1.*r2))/c;
        
        %% evaluation to find similarity
        
        if t > 0.97
            
            disp(strcat('correlation result:',num2str(t))); % strcat() concatenates string, num2str() converts numbers to string
            
            %% holding corrdinates (i,j) where matching
           
            x = i; 
            y = j;
            R(x:x+tRow-1, y:y+tCol-1) = 0;
            
            %% setting flag
            %flag = 1;
            %%
            break;
            
        end
        
   end 
   
   %% terminating outer loop
   %if flag == 1
       %break; 
   %end
   
end

%% assigning 0 to all the pixels of result image covered by the template
%R(x:x+tRow-1, y:y+tCol-1) = 0;

%% subplotiing: ploting multiple figures in one window
figure; 
subplot(3,1,1); 
imshow(S, [0 1]);
title('Input image');

subplot(3,1,2);
imshow(T, [0 1]);
title('Template image');

subplot(3,1,3);
imshow(R, [0 1]);
title('Template matching result');

end

