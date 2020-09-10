import numpy as np
import matplotlib.pyplot as plt
v = np.loadtxt("C:\\Users\\joel\\Documents\\Vertices.txt")
TT= np.loadtxt("C:\\Users\\joel\\Desktop\\vertices21.txt")
k=3852
a=1931
l0=0
numedges=5784 #from matlab
#vertices
Vert=np.zeros(3*k)
for ii in range(0,k):
    for i in range(1,k-ii):
        (v1,v2,v3)=TT[ii,:]
        (vv1,vv2,vv3)=TT[ii+i,:]
# x=abs(rr-r)
# xx=abs(bbb-bb)
# xxx=abs(ccc-cc)
if (v1,v2,v3)==(vv1,vv2,vv3):
    TT[ii+i,:]=(0,0,0)
    l0=l0+1
if (v1,v2,v3)==(vv2,vv1,vv3):
    TT[ii+i,:]=(0,0,0)
    l0=l0+1
if (v1,v2,v3)==(vv3,vv2,vv1):
    TT[ii+i,:]=(0,0,0)
    l0=l0+1
if (v2,v1,v3)==(vv1,vv2,vv3):
    TT[ii+i,:]=(0,0,0)
    l0=l0+1
if (v2,v3,v1)==(vv1,vv2,vv3):
    TT[ii+i,:]=(0,0,0)
    l0=l0+1
if (v3,v2,v1)==(vv1,vv2,vv3):
    TT[ii+i,:]=(0,0,0)
    l0=l0+1
if (v2,v1,v3)==(vv2,vv1,vv3):
    TT[ii+i,:]=(0,0,0)
    l0=l0+1
if (v2,v3,v1)==(vv2,vv1,vv3):
    TT[ii+i,:]=(0,0,0)
    l0=l0+1
if (v3,v2,v1)==(vv2,vv1,vv3):
    TT[ii+i,:]=(0,0,0)
    l0=l0+1
for ii in range(0,k):
    Vert[ii]=TT[ii,1]
    Vert[ii+k]=TT[ii,0]
    Vert[ii+2*k]=TT[ii,2]
    Vertcount=np.count_nonzero(np.unique(Vert))
    Facecount=np.size(TT[:,1])
    Euler=Vertcount-numedges+Facecount
    print (Euler)
