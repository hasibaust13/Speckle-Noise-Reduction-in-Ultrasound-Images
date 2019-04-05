
I=rgb2gray(imread('coins.jpg'));
figure(1);imshow(I);
J=imnoise(I,'salt & pepper',.01);
figure(2);imshow(J);
[row,col]=size(J);
win=3;
for i=1:row;
    for j=1:col
      if(J(i,j)==255||J(i,j)==0)
          offsetr=i+win-1;
          offsetc=j+win-1;
        if(offsetr>row||offsetc>col)
           if(offsetr>row&&offsetc<=col)
             N=J(i:i,j:offsetc);
           elseif(offsetc>col&&offsetr<=row)
             N=J(i:offsetr,j:j);
           elseif(offsetr>row&&offsetc>col)
              N=J(i:i,j:j);
           end
        else
             N=J(i:offsetr,j:offsetc);   
        end
        N=N(:);
        [r,c]=size(N);
        N=N(2:r,:);
        med=median(N(:));
        J(i,j)=med;               
     
     end
   end
end
    figure; imshow(J);
  %{
    As the window size increases , noise 
reduction becomes less effective as amount of noise in the output image
 increases with increasing window .
    %}