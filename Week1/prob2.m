% Week 1 Problem 2
% show cond(A) in Example 1.1.2 , 1.1.20 and 1.1.1
% cheng yu ge
% 12307110079

cond1 = zeros(1,100);
cond2 = zeros(1,100);
cond3 = zeros(1,100);
for i = 3 : 100
    A1 = eye(i) + diag([0,-3*ones(1,i-2)],-1) + diag(2*ones(1,i-2),-2);
    cond1(i) = cond(A1); % 1.1.2
    A2 = A1 + diag(-1, i-1);
    cond2(i) = cond(A2); % 1.1.20
    A3 = eye(i) + diag([0,-2*ones(1,i-2)],-1) + diag(ones(1,i-2),-2);
    cond3(i) = cond(A3); % 1.1.1
end
semilogy(1:100, cond1,'*');hold on;
semilogy(1:100, cond2,'*');
semilogy(1:100, cond3,'*');
h = legend('cond(A1(n))', 'cond(A2(n))', 'cond(A3(n))', 'Location', 'East');
set(h,'Fontsize', 22);
set(gca,'Fontsize', 16);