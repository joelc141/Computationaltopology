# -*- coding: utf-8 -*-
"""
Created on Thu Sep 10 13:29:11 2020

@author: joelc
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
v = np.loadtxt("C:\\Users\\joel\\Documents\\Vertices.txt")
T= np.loadtxt("C:\\Users\\joel\\Desktop\\vertices21.txt")
#TT1= np.delete(T,0,1)
#TT2= np.delete(T,2,1)
#TT3= np.delete(T,1,1)
k=3852
Line=np.zeros((3*k,2))
Line=np.zeros((3*k,2))
TT=np.zeros((k+1,3))
#AT = [tuple(row) for row in T]
#AT2 = np.unique(new_array)
#Assigns the vertices to their numerical values.
for i in range(0,k):
    a=int(T[i,0])
    b=int(T[i,1])
    c=int(T[i,2])
    TT[i,:]=(v[a-1,0],v[b-1,1],v[c-1,2])
#TT[k,:]=(v[T[k,0],0],v[T[k,1],1],v[T[k,2],2])
#TT[:,k]=(v[0,T[0,k]],v[1,T[1,k]],v[2,T[2,k]])
#Creates An array showing all linesegments
for i in range (0,k):
    Line[i,:]=(T[i,0],T[i,1])
    Line[i+k,:]=(T[i,1],T[i,2])
    Line[i+2*k,:]=(T[i,2],T[i,1])
    q=0
#Scans the array and removes duplicates [a,b]=[b,a]
#q represents the number of borders which is related to the repetition of linesegments
for ii in range (0,k):
    for i in range(1,k-ii):
        (rr,r)=Line[ii,:]
        (bbb,bb)=Line[ii+i,:]
# x=abs(rr-r)
# xx=abs(bbb-bb)
# xxx=abs(ccc-cc)
if (rr,r)==(bb,bbb)!=(0,0):
    Line[ii+i,:]=(0,0)
    q=q+1
if (rr,r)==(bbb,bb)!=(0,0):
    Line[ii+i,:]=(0,0)
    q=q+1
