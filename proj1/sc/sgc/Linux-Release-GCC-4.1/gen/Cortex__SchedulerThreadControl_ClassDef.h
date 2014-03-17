/*
 * 
 *
 * This is an automatically generated file. Do not edit.
 *
 * Copyright 2005 ARM Limited.
 * Copyright 2011 ARM Limited.
 *
 * All rights reserved.
 */

/** \file
 * Class definition for protocol Cortex__SchedulerThreadControl.
 */

#ifndef Cortex__SchedulerThreadControl_ClassDef_h_
#define Cortex__SchedulerThreadControl_ClassDef_h_

#include <MxTypes.h>
#include <eslapi/eslapi_stdint.h>

#include <list>
#include "sg/SGPort.h"

#include "protocol_SchedulerThreadControl.h"

namespace Cortex_NMS {

class Cortex__SchedulerThreadControl;

// Abstract interface implementation for port
class protocol_SchedulerThreadControl__Implementation: public protocol_SchedulerThreadControl
{
public:
    protocol_SchedulerThreadControl__Implementation(): thisPort(0) {}

    void SetPort(Cortex__SchedulerThreadControl *port) { thisPort = port; }

    // Protocol members
	inline void waitTicks(uint64_t ticks);
	inline void setupThread(unsigned index, void* args, const sg::SchedulerThreadParameters* parameters);
	inline void threadProc(unsigned index, void* args);


private:
    // Parent port this interface belongs to.
    Cortex__SchedulerThreadControl *thisPort;
};


// Protocol (port) class definition
class Cortex__SchedulerThreadControl: public sg::Port
{
private:
    
public:
    // Resources


    // Connector instances
	sg::SlaveConnector< void (uint64_t) > waitTicks;
	sg::SlaveConnector< void (unsigned,void*,const sg::SchedulerThreadParameters*) > setupThread;
	sg::MasterConnector< void (unsigned,void*) > threadProc;


    Cortex__SchedulerThreadControl()
    {
        abstractInterface__.SetPort(this);
		define_behaviour(waitTicks);
		define_behaviour(setupThread);
		define_behaviour(threadProc);


    }

    // Set name (currently ignored here)
    void SetName__(const char *) {}

    // Abstract port interface for non-LISA C++ components
    protocol_SchedulerThreadControl__Implementation abstractInterface__;

    // Get abstract interface for non-LISA C++ components
    protocol_SchedulerThreadControl *getAbstractInterface() { return &abstractInterface__; }
};


// Abstract interface implementations
inline void protocol_SchedulerThreadControl__Implementation::waitTicks(uint64_t ticks)
{
	return thisPort->waitTicks(ticks);
}

inline void protocol_SchedulerThreadControl__Implementation::setupThread(unsigned index, void* args, const sg::SchedulerThreadParameters* parameters)
{
	return thisPort->setupThread(index, args, parameters);
}

inline void protocol_SchedulerThreadControl__Implementation::threadProc(unsigned index, void* args)
{
	return thisPort->threadProc(index, args);
}




// Mapping object
// (these ports are implemented inside Cortex__SchedulerThreadControl__AddressablePort)
class Cortex__SchedulerThreadControl__AddressablePort_OutPort: public Cortex__SchedulerThreadControl
{
public:
    // constructor
    Cortex__SchedulerThreadControl__AddressablePort_OutPort(MxU32 inFirst,
                                                 MxU32 inLast,
                                                 MxU32 outFirst,
                                                 MxU32 outLast):
    inFirst__(inFirst),
    inLast__(inLast),
    outFirst__(outFirst),
    outSize__(outLast - outFirst + 1)
    {
    }

    bool isCovered__(MxU32 address) const
    {
        return (address >= inFirst__) && (address <= inLast__);
    }

    void remapAddress__(MxU32 &address) const
    {
        if(outSize__)
            address = ((address - inFirst__) % outSize__) + outFirst__;
    }

private:
    MxU32 inFirst__;
    MxU32 inLast__;
    MxU32 outFirst__;
    MxU32 outSize__;
};


// Addressable protocol class definition
class Cortex__SchedulerThreadControl__AddressablePort: public Cortex__SchedulerThreadControl
{
public:
    declare_slave_behaviour(mapRange, sg::Port*(MxU64 inFirst, MxU64 inLast, MxU64 outFirst, MxU64 outLast));
    declare_slave_behaviour(mapDefault, sg::Port*());
    declare_slave_behaviour(unmapRange, void(sg::Port*));
    declare_slave_behaviour(isMapped, bool(MxU64));

    Cortex__SchedulerThreadControl__AddressablePort():
    defaultOutPort__(0),
    portName__("(unknown name)")
    {
        define_behaviour(mapRange);
        define_behaviour(mapDefault);
        define_behaviour(unmapRange);
        define_behaviour(isMapped);
        bind_method(*this, mapRange, &Cortex__SchedulerThreadControl__AddressablePort::mapRange__, this);
        bind_method(*this, mapDefault, &Cortex__SchedulerThreadControl__AddressablePort::mapDefault__, this);
        bind_method(*this, unmapRange, &Cortex__SchedulerThreadControl__AddressablePort::unmapRange__, this);
        bind_method(*this, isMapped, &Cortex__SchedulerThreadControl__AddressablePort::isMapped__, this);

    }

    ~Cortex__SchedulerThreadControl__AddressablePort()
    {
        OutPortList__::iterator it;
        for (it = outPortList__.begin(); it != outPortList__.end(); ++it)
            delete *it;
        delete defaultOutPort__;
    }

    void SetName__(const char *name) { portName__ = name; }

    Cortex__SchedulerThreadControl__AddressablePort_OutPort *locateOutPort__(MxU32 &addr)
    {
        OutPortList__::iterator it;
        for (it = outPortList__.begin(); it != outPortList__.end(); ++it)
        {
            if ((*it)->isCovered__(addr)) {
                (*it)->remapAddress__(addr);
                return *it;
            }
        }
        return defaultOutPort__;
    }

    sg::Port* mapRange__(MxU64 inFirst, MxU64 inLast, MxU64 outFirst, MxU64 outLast)
    {
        Cortex__SchedulerThreadControl__AddressablePort_OutPort *masterPort =
            new Cortex__SchedulerThreadControl__AddressablePort_OutPort(inFirst, inLast, outFirst, outLast);
		this->waitTicks.connectTo(&masterPort->waitTicks);
		this->setupThread.connectTo(&masterPort->setupThread);
		this->threadProc.connectTo(&masterPort->threadProc);

        // push_front() because the first statement should have the lowest priority and the last statement should have the
        // highest priority, like PVBusDecoder
        outPortList__.push_front(masterPort);
        return masterPort;
    }

    // map default slave
    sg::Port* mapDefault__()
    {
        delete defaultOutPort__;
        defaultOutPort__ = new Cortex__SchedulerThreadControl__AddressablePort_OutPort(0, MxU32(0) - 1, 0, MxU32(0) - 1);
        return defaultOutPort__;
    }

    void unmapRange__(sg::Port* port)
    {
        outPortList__.remove((Cortex__SchedulerThreadControl__AddressablePort_OutPort*)port);
        if(defaultOutPort__ == port)
        {
            delete defaultOutPort__;
            defaultOutPort__ = 0;
        }
    }

    bool isMapped__(MxU64 addr)
    {
        OutPortList__::iterator it;
        for (it = outPortList__.begin(); it != outPortList__.end(); ++it)
        {
            if ((*it)->isCovered__(static_cast<MxU32>(addr)))
                return true;
        }
        return false;
    }

    // Wrapper functions for protocol behaviors


private:
    typedef std::list<Cortex__SchedulerThreadControl__AddressablePort_OutPort*> OutPortList__;
    OutPortList__ outPortList__;
    Cortex__SchedulerThreadControl__AddressablePort_OutPort *defaultOutPort__;
    const char *portName__;
};

} // namespace Cortex_NMS

#endif

