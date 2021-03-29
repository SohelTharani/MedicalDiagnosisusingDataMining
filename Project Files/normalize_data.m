function [M]=normalize_data(M)

[r c]=size(M);
for ii=1:r
    %     Normalize age
    x=M(ii,1);
    if x >= 20 && x <= 34
        Age=1;
    elseif  x >= 35 && x <= 50
        Age=2;
    elseif x>= 51 && x <= 60
        Age=3;

    elseif x>= 61 && x <= 79
        Age=4;

    elseif x >= 80 ;
        Age=5;
    end

    M(ii,1)=Age;
end




    

