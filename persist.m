function [num_simplices,intervals2,IND,INTlength] = persist(m_space, num_landmark_points, overflow,num_divisions)
%function you input a data matrix, number of landmarks, outputs intervals
%as a vector/array

clear stream;
clear landmark_selector;
clear options;
clear R;
clear persistence;
clear intervals;
clear intervals2;

import edu.stanford.math.plex4.*;
nu=1;
max_dimension = 2;
%num_divisions=length(Data(:,1));

landmark_selector = api.Plex4.createMaxMinSelector(m_space, num_landmark_points);
R = landmark_selector.getMaxDistanceFromPointsToLandmarks() %finds the optimum distance for filtration

%over flow protection, if it exceeds R it will use the overflow parameter
%provided in the function.

if 2*R>overflow
    max_filtration_value = overflow
end

if 2*R<overflow
    max_filtration_value = 2*R
end


% create a lazy witness stream
stream = streams.impl.LazyWitnessStream(landmark_selector.getUnderlyingMetricSpace(), landmark_selector, max_dimension, max_filtration_value, nu, num_divisions);
stream.finalizeStream()

% print out the size of the stream
num_simplices = stream.getSize()

% get persistence algorithm over Z/2Z
persistence = api.Plex4.getModularSimplicialAlgorithm(max_dimension, 2);
intervals2 = persistence.computeAnnotatedIntervals(stream);
% compute the intervals
%intervals = persistence.computeIntervals(stream);
intervals2M = edu.stanford.math.plex4.homology.barcodes.BarcodeUtility...
.getEndpoints(intervals2, 1, 0)

[L1 L2]=size(intervals2M);

RR=[0];

for i=1:L1;
    RR(i)=abs(intervals2M(i,2)-intervals2M(i,1));
end

[ii kk]=max(RR);

IND=ii;
INTlength=kk;
    
