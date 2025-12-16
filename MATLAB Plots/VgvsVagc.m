% Data
Vg_mV = [10 20 40 80 160 320 640 1280];
Vagc_V = [1.01 1.48 2.06 2.45 2.93 3.56 4.58 6.03];

% Linear fit on log10(x)
p = polyfit(log10(Vg_mV), Vagc_V, 1);

% Generate smooth x-values for fit curve
xfit = logspace(log10(min(Vg_mV)), log10(max(Vg_mV)), 200);
yfit = polyval(p, log10(xfit));

% Plot data and fit
figure;
semilogx(Vg_mV, Vagc_V, 'o-', ...
    'LineWidth', 1.2, ...
    'MarkerSize', 6, ...
    'Color', [0.2 0.6 1]);
hold on;

% Plot the best-fit line
semilogx(xfit, yfit, '-', ...
    'LineWidth', 0.9, ...
    'Color', 'r');

grid on;
xlabel('V_g (mV)');
ylabel('V_{AGC} (V)');
title('Graph of V_{AGC} as a function of V_g');

legend('Data', 'Best fit', 'Location', 'northwest');