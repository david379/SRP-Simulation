function [] = randPoints()

    num_of_points = 500;
%     s = zeros(num_of_points, 3);
    true_loc = zeros(num_of_points, 3);
%     true_loc(:, 1:2) = (rand(num_of_points , 2))*(680) + 20;
    true_loc(:, 1) = 10 * 10 .^ (rand(num_of_points , 1)*2);
    true_loc(:, 2) = (rand(num_of_points , 1))*(2*pi);
    true_loc(:, 3) = (rand(num_of_points , 1))*(200);
    [true_loc(:, 1), true_loc(:, 2), true_loc(:, 3)] = pol2cart(true_loc(:, 2), true_loc(:, 1), true_loc(:, 3));
%     for j = 1 : num_of_points
%       s(j, 1:2) = datasample([-1,1], 2);
%       s(j, 3) = 1;
%     end
%     true_loc = true_loc.*s;
    save(fullfile("data/locations",'randLoc.mat'),'true_loc')

end