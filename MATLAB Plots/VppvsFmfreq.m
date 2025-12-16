% Frequency (Hz)
f = [100, 1300, 2500, 3700, 4900, 6100, 7300, 8500, 10000];

% Vpp (mV)
g = [492, 420, 432, 388, 380, 368, 372, 360, 356];

% ---- POLYNOMIAL FIT (4th ORDER) ----
p = polyfit(f, g, 4);
f_fit = linspace(min(f), max(f), 20000);
g_fit = polyval(p, f_fit);

% ---- PLOT ----
figure;
hold on;

% Blue circular data points
plot(f, g, 'o', ...
    'Color', [0.2 0.6 1], ...
    'MarkerSize', 6, ...
    'LineWidth', 1.2);

% Thin red fitted curve
plot(f_fit, g_fit, 'r', 'LineWidth', 1);

xlim([100, 10000]);

% Axis labels
xlabel('Frequency (Hz)');
ylabel('Vpp (mV)');

% Grid
grid on;
ax = gca;
ax.GridLineStyle = ':';
ax.MinorGridLineStyle = ':';
ax.MinorGridColor = [0.85 0.85 0.85];
ax.GridAlpha = 0.35;
ax.MinorGridAlpha = 0.25;
ax.XMinorGrid = 'on';
ax.YMinorGrid = 'on';

% Legend
legend({'data','fitted curve'}, ...
        'Location','northeast', 'Box','on');

set(gca, 'FontName', 'Helvetica', 'FontSize', 12);
hold off;