clear, clc

omega = 2;
P = 2*pi/omega;
dt = P/2000;
T = 3*P;
N_t = floor(T/dt);
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega^2*u(n);
end

plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
xlabel('t');
print('tmp', '-dpdf');  print('tmp', '-dpng');

%Calculate kinetic and potential energy
[E_potential, E_kinetic] = osc_energy(u, v, omega);
E_summ = E_potential + E_kinetic;

Total_energy = figure;
plot(t, E_summ);
xlabel('t');
ylabel('Total energy');
saveas(Total_energy, 'osc_FE_total_energy.png');