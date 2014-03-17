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
 * Abstract interface class protocol_SchedulerThreadEventControl for protocol SchedulerThreadEventControl.
 */

#ifndef protocol_SchedulerThreadEventControl_h_
#define protocol_SchedulerThreadEventControl_h_

// Includes from the 'includes' section of this protocol


// Abstract interface for protocol SchedulerThreadEventControl
class protocol_SchedulerThreadEventControl
{
public:
        virtual ~protocol_SchedulerThreadEventControl() {}
        // Abstract protocol members
	virtual void wait() = 0;
	virtual void notify() = 0;

};

#endif /* protocol_SchedulerThreadEventControl_h_ */

