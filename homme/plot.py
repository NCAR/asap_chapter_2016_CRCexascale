#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np

keys = ['PAPI_TOT_INS', 'RESOURCE_STALLS', 'PAPI_L2_TCM', 'PAPI_L3_TCM', 'PAPI_TLB_DM', 'PAPI_VEC_DP']

for key in keys:
    y_axis_label = key+' rate(Mevents/s)'
    x_axis_label = 'Time (Normalized to % of Runtime)'

    scalar_fn = 'scalar.v1_mpi.codeblocks.fused.any.any.any.slope.csv'
    vec_858_fn = 'vector-len858_mpi.v1.codeblocks.fused.any.any.any.slope.csv'
    vec_64_fn = 'vector-len64_mpi.v1.codeblocks.fused.any.any.any.slope.csv'
    vec_small16_fn = 'vector-smallerArrays_16_mpi.v1.codeblocks.fused.any.any.any.slope.csv'


    values = {scalar_fn:[], vec_858_fn:[], vec_64_fn:[], vec_small16_fn:[]}
    times = {scalar_fn:[],  vec_858_fn:[], vec_64_fn:[], vec_small16_fn:[]}
    total_t = {scalar_fn:163.71, vec_858_fn:86.50, vec_64_fn:67.18}
    colors = {scalar_fn:'r', vec_858_fn:'b', vec_64_fn:'g', vec_small16_fn:'m'}
    labels = {scalar_fn:'s00', vec_858_fn:'v01', vec_64_fn:'v02', vec_small16_fn:'v03'}
    linestyles = {scalar_fn:':',vec_858_fn:'--',vec_64_fn:'-.',vec_small16_fn:'-'}
     
    files = [scalar_fn, vec_858_fn, vec_64_fn, vec_small16_fn]

    for fn in files:

        with open(fn) as f:
            for l in f:
                l_split = l.split(';')
                if key in l_split:
                    times[fn].append(float(l_split[len(l_split)-2]))#*total_t[fn])
                    values[fn].append(float(l_split[len(l_split)-1].rstrip('\n')))                 

    fig = plt.figure()
    ax = fig.add_axes([0.1, 0.1, 0.8, 0.8])
    ax.set_title(key+' Rate on Sandy Bridge')
    ax.set_xlabel(x_axis_label)
    ax.set_ylabel(y_axis_label)
    ax.set_xlim(0,times[scalar_fn][len(times[scalar_fn])-1])
#    for k in sorted(values.keys()):
    for k in files:
        ax.plot(times[k], values[k], label=labels[k], c='k', linestyle=linestyles[k],lw=2)
        print key, labels[k], sum(values[k])/float(len(values[k]))
    print '------------------\n\n'        

    box = ax.get_position()
    ax.set_position([box.x0, box.y0 + box.height * 0.1,
                     box.width, box.height * 0.9])
    ax.legend(loc='upper center', bbox_to_anchor=(0.5, -0.10),ncol=5, columnspacing=0.5, prop={'size':10})
    #plt.show()
    fig.savefig(key+'.png')


#for k in values.keys():
#    print k, len(values[k])
#    print values[k]
#    print '------------------------'

