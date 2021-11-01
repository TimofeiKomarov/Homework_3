function [E_potential, E_kinetic] = osc_energy(u, v, omega)

E_potential = omega .* omega .* u .* u / 2;
E_kinetic = v .* v / 2;