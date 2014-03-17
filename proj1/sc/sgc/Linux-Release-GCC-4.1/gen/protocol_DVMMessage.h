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
 * Abstract interface class protocol_DVMMessage for protocol DVMMessage.
 */

#ifndef protocol_DVMMessage_h_
#define protocol_DVMMessage_h_

// Includes from the 'includes' section of this protocol
#line 19 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/DVMProtocol.lisa"

        #include <pv/DVM.h>
    
#line 25 "./Linux-Release-GCC-4.1/gen/protocol_DVMMessage.h"


// Abstract interface for protocol DVMMessage
class protocol_DVMMessage
{
public:
        virtual ~protocol_DVMMessage() {}
        // Abstract protocol members
	virtual DVM::error_response_t send(DVM::Message* ) = 0;

};

#endif /* protocol_DVMMessage_h_ */

