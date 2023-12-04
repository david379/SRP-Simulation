
% grid_dim = icogrid
tmp = load(fullfile("data/icogrids", "icogrid_6_alpha_0.mat"));
% G = tmp.G;
M = tmp.M;

% circ_rad = [0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2, 2.5, 3, 3.5, 4];
circ_rad = [0.3, 0.5];

for circ = 1:size(circ_rad, 2)
    
%     tmp = load(fullfile("data/mic_arrays", 'circle_0.75_pairs_mic_array.mat'));
    tmp = load(fullfile("data/mic_arrays", ['circle_' num2str(circ_rad(circ)) '_pairs_mic_array.mat']));
    micPos = tmp.micPos;
    
    c = 343;
    DOA_list = {};
    Delta_list = {};
    m = size(micPos,1);
    P = m*(m-1)/2;

    for i = 1:(size(M, 2))

            L = M{1, i};
            DOA_i = L;
            Delta_t_i = zeros(size(L, 1), P, size(L, 3));

            for j = 1:size(L, 3)

                    Delta_t_i(:, :, j) = gen_searchIcoGrid(micPos, L(:, :, j), c);
            end
    %     end

        Delta_list{end + 1} = Delta_t_i;
        DOA_list{end + 1} = DOA_i;
    end

%     save(fullfile("data/DOAs", 'DOA.mat'), "DOA_list", "Delta_list");
    save(fullfile("data/DOAs", ['DOA_' num2str(circ_rad(circ)) '_pairs_mic_array.mat']), "DOA_list", "Delta_list");
end

%%

% tmp = load(fullfile("data/DOAs", 'DOA.mat'));
% 
% DOA = tmp.DOA_list;
% 
% delta = tmp.Delta_list;


