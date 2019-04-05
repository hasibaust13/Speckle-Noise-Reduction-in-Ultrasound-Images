function n=neighbour(m,i,j,R)
ma=floor(m/2);
rs=i-ma;
re=i+ma;
cs=j-ma;
ce=j+ma;
[r s]=size(R);

if(rs<1)
    rs=1;
end
if(cs<1)
    cs=1;
end
if(re>r)
    re=r;
end

if(ce>s)
    ce=s;
end
n=R(rs:re,cs:ce);
end

    


    
    