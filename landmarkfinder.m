
clear
AA=geosoftread('C:\Users\joel\Desktop\lungcancer.soft'); %upload data
Data=getfield(AA,'Data'); %call data
Data2=getfield(AA,'Identifier'); %call index
%[Data,Data2]=filtering2(Data,125,22, Data2);
    %Mass parallel split loop onto various cores if needed.
import edu.stanford.math.plex4.*;
    
di=20                   %landmark steps used to find the one with the longest loop use multiples of five, other ones may take too long unless you're using a good computer
start=100              %where the landmarks start usually about 65-75
End=180            %where the landmarks end, test beforehand to avoid memory errors 165 usually works well, can increase if it indicates there are evolving loops after 165
retest=2               %how many times to rerun to check for consistency, use 2 or 3 and after the longest loop is found rerun for the corresponding landmark value around 5-20 times to check for consistencw
iiend=int16((End-start)/di); 
    
m_space = metric.impl.EuclideanMetricSpace(Data);

%input for the loop is a data array from soft file    
for j=1:retest
    %number of times to recheck for consistency, outer loops reruns inner loop
    for ii=1:iiend          %this loop here makes a matrix of interval lengths for differnet landmark values, persist function is where the topology calculations happen
    i=di*ii+start;
    [d,a,b,c]=persist(m_space,i,5000,100);
    INTvector(ii)=b;
    Testvec(ii)=c;
    loops1(ii)={a};
    SIMPcount(ii,j)=d; %just extra inform   ation in case its needed
    end
loopmore((j-1)*iiend+1:iiend*j)=loops1; %
%[INDloop,RR]=max(INTvector);
MATRIX(j,:)=INTvector;
MAT2(j,:)=Testvec;
%loopmax(j)=loops1(INDloop);
INTvector=[];
Testvec=[];
end
%[INDEX1,VECT]=max(MATRIX); %index is the j index
%[INDEX2,AL]=max(VECT); %index2 is the i index
%call the loop we want
%they're flipped here i is reruns 
%Biggestloop=cell2mat(loopmore(INDEX2*(iiend-1)+INDEX1));




%output for the array is a matrix with interval lengths for different
%landmark values and reruns on top of that. Select the one with the longest
%interval length and rerun for that landmark value manyt imes to check for
%consistency.


%manually look at the arrays MATRIX and MAT2 to decide which landmark
%numbers yield the longest intervals, and either rerun the code for those
%values or create a vector of values to rerun. Recommended number of
%retests would be around 5-20 to test for consistency after the longest
%loop is found+



%Gvec=linspace(1,24,24);
%[ID1 ID2]=max(INTvector);
