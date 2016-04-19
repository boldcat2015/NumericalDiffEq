%% complex plane
re = -8 : 0.01 : 8 ;
im = -8 : 0.01 : 8 ;
[Re , Im] = meshgrid(re , im );
z = complex( Re , Im );

%% improved Euler scheme
z(abs((2+z)./(2-z))>1) = NaN;
h = plot(z ,'Color',[0.7 0.9 1]);
title('absolutely stable region of improved Euler scheme');
grid on ;
axis equal ;
axis([-4,4,-4,4]);

%% modified Euler scheme
z(abs(1+z+z.^2./2)>1) = NaN;
plot(z ,'Color',[0.7 0.9 1]);
title('absolutely stable region of modified Euler scheme');
grid on ;
axis equal ;
axis([-4,4,-4,4]);