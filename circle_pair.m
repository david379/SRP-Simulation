
% 
% circ_rad = [0.35, 0.5, 0.6, 0.75];
% circ_err = [3.05, 2.45, 2.4, 2.1];
% 
% circ_pair_rad = [0.6, 0.75];
% circ_pair_err = [2.33, 2.03];
% 
% circ_rad_dyn = [0.3, 0.5, 0.6, 0.75];
% circ_err_dyn = [2.28, 1.62, 1.495, 1.295];

%%

tmp = load(fullfile("data/graphs", 'circ_pairs_LPF_500_UAV_phatless_weightless.mat'));
circ_rad = tmp.circ_rad;
circ_err_mean = tmp.circ_err_mean
circ_err = tmp.circ_err;
circ_snr = tmp.SNR_dyn_mat;

figure(1)
hold on
for i = 1:size(circ_rad, 2)
    p = plot(circ_snr(i, :), circ_err(i, :), '.', 'DisplayName', ['circle with radius of ' num2str(circ_rad(i))]);
    [SNR_sorted, ind_sorted] = sort(circ_snr(i, :), 'descend');
    err_sorted = circ_err(i, ind_sorted);
    N = 50;
%     mat = [circ_snr(i, :); circ_err(i, :)];
    arr = movmean(err_sorted, [N-1 0]);
    plot(SNR_sorted, arr, 'LineWidth', 2, 'Color', p.Color, 'DisplayName', ['circle with radius of ' num2str(circ_rad(i)) ' Moving Average']);
end
legend()
xlabel('SNR (dB)')
ylabel('Error (Deg)')
title('UAV')
hold off

% tmp = load(fullfile("data/graphs", 'circ_pairs_LPF_100_sig'));
% circ_rad = tmp.circ_rad;
% circ_err_mean = tmp.circ_err_mean
% circ_err = tmp.circ_err;
% circ_snr = tmp.SNR_dyn_mat;
% 
% figure(2)
% hold on
% for i = 1:size(circ_rad, 2)
%     plot(circ_snr(i, :), circ_err(i, :), '.', 'DisplayName', ['circle with radius of ' num2str(circ_rad(i))]);
% end
% legend()
% xlabel('SNR (dB)')
% ylabel('Error (Deg)')
% title('Explosion')
% hold off
