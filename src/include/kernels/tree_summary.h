/**
 * @brief Kernels for computing summary of a quad tree.
 *
 * @file apply_forces.cu
 * @author Roshan Rao
 * @date 2018-05-08
 * Copyright (c) 2018, Regents of the University of California
 */
#ifndef SRC_INCLUDE_KERNELS_TREE_SUMMARY_H_
#define SRC_INCLUDE_KERNELS_TREE_SUMMARY_H_

#include "include/common.h"
#include "include/options.h"
#include "include/tsne_vars.h"
#include "include/util/cuda_utils.h"

namespace tsnecuda {
namespace bh {
__global__
void SummarizationKernel(
                               volatile int * __restrict cell_counts, 
                               volatile float * __restrict cell_mass, 
                               volatile float * __restrict x_pos_device, 
                               volatile float * __restrict y_pos_device,
                               const int * __restrict children,
                               const int num_nodes,
                               const int num_points,
                               const int gpu_summary_threads);

void SummarizeTree(tsnecuda::GpuOptions &gpu_opt,
                        thrust::device_vector<int> &cell_counts,
                        thrust::device_vector<int> &children,
                        thrust::device_vector<float> &cell_mass,
                        thrust::device_vector<float> &pts_device,
                        const int num_nodes,
                        const int num_points,
                        const int num_blocks);
}
}

#endif
