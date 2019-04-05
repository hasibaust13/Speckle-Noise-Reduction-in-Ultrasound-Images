function first()
a = imread('coins.jpg');
ad  = im2double(a); %initialize final image to ad

%x = ad;
y =ad;

[r,c ] = size(ad); %stores the rows and coln in variable r and c and
                    %it is equal to size of x or ad -_-
factor = 2;  % Factor is C in equation
               

for i = 1:r  % loop across the row first
    for j= 1:c
       % x(i,j)=factor * log(1+ ad(i,j)); 
        %transformation
        %assigning the value x(i,j) overriding the value of my final matrix
        
        y(i,j) = factor *ad(i,j)^2; %(i,j) original image
                                       %Gamma functin,if we reduce it
                                       %it will be white.
                                       %if we increment it like 20,then it
                                       %will be darker one
    end
end

 plot(ad,y,'*');
 figure;
 imshow(y);
 

end