function [x, itr] = SOR(A,b,x,tol,w)
    n=size(x,1);
    normVal=Inf; 
    itr=0;
    while normVal>tol
        x_old=x;    
        for i=1:n        
            sigma=0;        
            for j=1:i-1
                    sigma=sigma+A(i,j)*x(j);
            end        
            for j=i+1:n
                    sigma=sigma+A(i,j)*x_old(j);
            end        
            x(i)=(1-w)*x_old(i)+(w/A(i,i))*(b(i)-sigma);
        end    
        itr=itr+1;
        normVal=norm(x_old-x,Inf);
    end
end