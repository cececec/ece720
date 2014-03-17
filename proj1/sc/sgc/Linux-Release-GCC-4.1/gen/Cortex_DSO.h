/*
 * 
 *
 * Copyright 2011 ARM Limited.
 *
 * All rights reserved.
 */

#ifndef INCLUDED_Cortex_DSO_NAMESPACE_H
#define INCLUDED_Cortex_DSO_NAMESPACE_H

#include <sg/Visibility.h>

#if defined(SG_BUILDING_DSO_Cortex)
    #define SG_Cortex_DSO SG_DSO_EXPORT
#else
    #define SG_Cortex_DSO SG_DSO_IMPORT
#endif

#endif
