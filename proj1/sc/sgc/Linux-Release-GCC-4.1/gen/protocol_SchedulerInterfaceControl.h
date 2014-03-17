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
 * Abstract interface class protocol_SchedulerInterfaceControl for protocol SchedulerInterfaceControl.
 */

#ifndef protocol_SchedulerInterfaceControl_h_
#define protocol_SchedulerInterfaceControl_h_

// Includes from the 'includes' section of this protocol


// Abstract interface for protocol SchedulerInterfaceControl
class protocol_SchedulerInterfaceControl
{
public:
        virtual ~protocol_SchedulerInterfaceControl() {}
        // Abstract protocol members
	virtual void waitTicks(uint64_t ticks) = 0;

};

#endif /* protocol_SchedulerInterfaceControl_h_ */

