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
 * Abstract interface class protocol_SchedulerThreadControl for protocol SchedulerThreadControl.
 */

#ifndef protocol_SchedulerThreadControl_h_
#define protocol_SchedulerThreadControl_h_

// Includes from the 'includes' section of this protocol
#line 16 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/SchedulerThreadControlProtocol.lisa"

        #ifndef ARM_INCLUDE_SCHEDULERTHREADPARAMETERS_H
        #define ARM_INCLUDE_SCHEDULERTHREADPARAMETERS_H
        namespace sg
        {
            // SchedulerThread paameters.
            class SchedulerThreadParameters
            {
            public:
                SchedulerThreadParameters():
                stackSize(2*1024*1024) 
                {}
                
                /// Set stack size.
                void setStackSize(size_t stackSize_) { stackSize = stackSize_; }
                
                /// Get stack size.
                size_t getStackSize() const { return stackSize; }

            private:
                size_t stackSize;
            };
        }
        #endif /* ARM_INCLUDE_SCHEDULERTHREADPARAMETERS_H */
    
#line 47 "./Linux-Release-GCC-4.1/gen/protocol_SchedulerThreadControl.h"


// Abstract interface for protocol SchedulerThreadControl
class protocol_SchedulerThreadControl
{
public:
        virtual ~protocol_SchedulerThreadControl() {}
        // Abstract protocol members
	virtual void waitTicks(uint64_t ticks) = 0;
	virtual void setupThread(unsigned index, void* args, const sg::SchedulerThreadParameters* parameters) = 0;
	virtual void threadProc(unsigned index, void* args) = 0;

};

#endif /* protocol_SchedulerThreadControl_h_ */

