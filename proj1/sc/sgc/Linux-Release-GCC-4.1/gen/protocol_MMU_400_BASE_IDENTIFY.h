/*
 * 
 *
 * This is an automatically generated file. Do not edit.
 *
 * Copyright 2007 ARM Limited.
 * Copyright 2011 ARM Limited.
 *
 * All rights reserved.
 */

/** \file
 * Abstract interface class protocol_MMU_400_BASE_IDENTIFY for protocol MMU_400_BASE_IDENTIFY.
 */

#ifndef protocol_MMU_400_BASE_IDENTIFY_h_
#define protocol_MMU_400_BASE_IDENTIFY_h_

// Includes from the 'includes' section of this protocol
#line 16 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/SMMU_400_BASE.lisa"

namespace pv
{
    class TransactionAttributes;
}
    
#line 28 "./Linux-Release-GCC-4.1/gen/protocol_MMU_400_BASE_IDENTIFY.h"


// Abstract interface for protocol MMU_400_BASE_IDENTIFY
class protocol_MMU_400_BASE_IDENTIFY
{
public:
        virtual ~protocol_MMU_400_BASE_IDENTIFY() {}
        // Abstract protocol members
	virtual void identify(const pv::TransactionAttributes* attributes_, bool is_read_, unsigned* stream_id_, unsigned* ssd_or_ssd_index_) = 0;

};

#endif /* protocol_MMU_400_BASE_IDENTIFY_h_ */

