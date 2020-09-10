%boundary matrix 2
%this will use edgeattachments predominately given matrix of trignulation
%and will return the 2nd boundary matrix or d_2

clear
T=readmatrix('C:\Users\joelc\Documents\bottle.txt');

%T(:,1)=[];
%T(:,4)=[];
TV=readmatrix("C:\Users\joelc\Documents\Spinevertices.txt");
TT=triangulation(T,TV);
Edges=edges(TT);
dim1=size(T);
dim2=dim1(1);
V=edges(TT);
dim4=size(V);
dim3=dim4(1);

%for ii=1:dim3
  %  Etest=cell2mat(edgeAttachments(TT,V(ii,:)));
     % for iii=1:length(Etest)
       %     M(Etest(iii),ii)=1;
     % end
%end

for i=1:1932
    if length(cell2mat(vertexAttachments(TT,i)))~=0 VVV(i)=1; else
        VVV(i)=0;
    end
end
VVV=nonzeros(VVV);

for i=1:length(Edges(:,1))
    xx=cell2mat(edgeAttachments(TT,Edges(i,1),Edges(i,2))); % xx is triangles for edge E(i)
    %xloc contains vector indices for Triangle abc etc
    for ii=1:length(xx)
        B3(i,xx(ii))=1; %assign these locations to 'l's in the matrix
    end
end

B3=transpose(B3); %the indices are reversed so we take the tranpose to match it up for consistency may not be required
    
    


BdB=BoundaryMatrix1(T,TV); %boundary matrix is a function I made, it needs to be saved as a file with the name BoundaryMatrix1

%betti number is Z_n-b_N
%Boundary matrix of D_n gives Z_n and B_n-1

%Bdb is second boundary m
%VVV is 1st boundary matrix
%M is third boundary matrix

writematrix(BdB, 'boundary2.txt');
writematrix(VVV, 'boundary1.txt');%to transfer to python
writematrix(B3,'boundary3.txt');
%now go to python and run the code make sure to change the file path, and
%it will reutrn the smith normal form


