
function M = BoundaryMatrix1(T,TV)
trep = triangulation(T,TV);
VV=edges(trep);
numvertt=size(TV);
numvert=numvertt(1);

for i=1:numvert
    TRT=[];
    TRIME=[];
    V=i;
    %find triangles for v=1
    TIL = vertexAttachments(trep, V);
    Trianglevec=cell2mat(TIL);
    dim1=size(Trianglevec);
    dim=dim1(2);
    for ii=1:dim
        TRT(ii,:)=T(Trianglevec(ii),:);
    end
    if size(TRT)>0
    TRIM=triangulation(TRT,TV);
    TRIME=edges(TRIM);
    dim5=size(TRIME);
    dimm5=dim5(1);
    transpose(TRIME);
    for ii=1:dimm5
        VEL=[];
        VEL=TRIME(ii,:);
        a=VEL(1);
        b=VEL(2);
        if a==i || b==i TRIME(ii,:)=[a,b];
        else TRIME(ii,:)=[0,0];
        end
    end
    TRIME=TRIME(any(TRIME,2),:); %this is the matrix representing which edges correspond to vertex V=i
    dimm7=length(TRIME);
    for ii=1:dimm7
      a=findvector(VV,TRIME(ii,:)); %this finds what e(n) corresopnds to the vectors in TRIME
      dimm=size(a);
      dim4=dimm(2);
      for iii=1:dim4
          M(i,a(iii))=1;
      end
    end
    end
end
end

        
    
    
    
    %TI = vertexAttachments(TR, VI)