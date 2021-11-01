clear, clc

%Adjust the logistic equation and initial conditions
f = @(u, t) 0.1*(1 - u/500)*u;
U_0 = 100;  
T = 60;
dt = [T / 4, T / 8]; 
i = 1;

cont = 1;
while cont == 1
    %Compute numerical solutions of the logistic equation
    [u1, t1] = ode_FE(f, U_0, dt(1), T);
    [u2, t2] = ode_FE(f, U_0, dt(2), T);
    
    %Plot the solutions
    plot(t1, u1, t2, u2, '--');
    xlabel('t');  ylabel('N(t)');
    dt1 = string(dt(1));
    dt2 = string(dt(2));
    legend({'dt = ' + dt1, 'dt = ' + dt2}, 'Location', 'northwest') 
    print('Results', '-dpng');
    
    %Ask the user if the loop is to be continued
    fprintf('The time steps are %.3e and %.3e \n', dt1, dt2);
    cont = input('If you want to continue then input 1 and press Enter \n');
    
    dt(1) = dt(2);
    dt(2) = dt(1) / 2;
end
