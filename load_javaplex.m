% This script prepares the javaplex library for use

clc; clear all; close all;
% clear import;

javaaddpath('./lib/javaplex.jar');
import edu.stanford.math.plex4.*;

javaaddpath('./lib/plex-viewer.jar');
import edu.stanford.math.plex_viewer.*;

cd './utility';
addpath(pwd);
cd '..';


point_cloud = examples.PointCloudExamples.getRandomFigure8Points(1000);
num_landmark_points = 1000;
random_selector = api.Plex4.createRandomSelector(point_cloud, num_landmark_points);
maxmin_selector = api.Plex4.createMaxMinSelector(point_cloud, num_landmark_points);
maxmin_points = point_cloud(maxmin_selector.getLandmarkPoints() + 1, :);
subplot(1, 2, 1);
scatter(maxmin_points(:,1), maxmin_points(:, 2));
title('Maxmin landmark selection');
subplot(1, 2, 2);
scatter(maxmin_points(:,1), maxmin_points(:, 2));
title('Maxmin landmark selection');
