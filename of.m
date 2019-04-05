R =imread('coins.jpg');
R = rgb2gray(R);
R =im2double(R);
   
figure;imshow(R);
[r s]=size(R);
m=50;


for i= 1:r
    for j= 1:s
       n=neighbour(m,i,j,R);
       [p,q]=size(n);
       y=ones(p,q)/(p*q);
       val=n.*y;
       R(i,j)=sum(val(:));
    end
end
    
figure;imshow(R);