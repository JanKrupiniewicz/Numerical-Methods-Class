function [xsolution,ysolution,iterations,xtab,xdif] = secant_method(a,b,max_iterations,ytolerance,fun)
% a - lewa granica przedziału poszukiwań miejsca zerowego (x0=a)
% b - prawa granica przedziału poszukiwań miejsca zerowego (x1=b)
% max_iterations - maksymalna liczba iteracji działania metody siecznych
% ytolerance - wartość abs(fun(xsolution)) powinna być mniejsza niż ytolerance
% fun - nazwa funkcji, której miejsce zerowe będzie wyznaczane
%
% xsolution - obliczone miejsce zerowe
% ysolution - wartość fun(xsolution)
% iterations - liczba iteracji wykonana w celu wyznaczenia xsolution
% xtab - wektor z kolejnymi kandydatami na miejsce zerowe, począwszy od x2
% xdiff - wektor wartości bezwzględnych z różnic pomiędzy i-tym oraz (i+1)-ym elementem wektora xtab; xdiff(1) = abs(xtab(2)-xtab(1));

    
    xsolution = [];
    ysolution = [];
    iterations = [];
    xtab = [];
    xdif = [];
    
    for k = 1:max_iterations
        c = b - (fun(b)*(b - a))/(fun(b) - fun(a));
        xtab = [xtab; c];

        if k > 1
            xdif(k - 1) = abs(xtab(k)-xtab(k - 1));
        end

        if abs(fun(c)) < ytolerance
            xsolution = c;
            ysolution = fun(c);
            iterations = k;
            break;
        end
        
        a = b;
        b = c;
    end
    xdif = xdif';
end