#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np

#keys = ['PAPI_TOT_INS', 'RESOURCE_STALLS', 'PAPI_L2_TCM', 'PAPI_L3_TCM', 'PAPI_TLB_DM', 'PAPI_VEC_DP']
keys = ['PAPI_TOT_INS', 'RESOURCE_STALLS','PAPI_L2_DCM', 'PAPI_L3_TCM', 'PAPI_DP_OPS','PAPI_TLB_DM', 'PAPI_VEC_DP']

for key in keys:
    y_axis_label = key+' rate(Mevents/s)'
    x_axis_label = 'Time (Normalized to % of Runtime)'

    dungeon_fn = 'perfTest_dungeon.codeblocks.fused.any.any.any.slope.csv'
    ipcc_fn = 'perfTest_ipcc.codeblocks.fused.any.any.any.slope.csv'


    values = {ipcc_fn:[],dungeon_fn:[]}
    times = {ipcc_fn:[], dungeon_fn:[]}
    total_t = {ipcc_fn:15.93, dungeon_fn:9.83}
    colors = {ipcc_fn:'b',dungeon_fn:'r'}
    labels = {ipcc_fn:'ipcc', dungeon_fn:'dungeon'}
    linestyles = {ipcc_fn:'-.', dungeon_fn:'-'}
     
    files = [ipcc_fn, dungeon_fn]

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
    ax.set_xlim(0,times[ipcc_fn][len(times[ipcc_fn])-1])
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

