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
 * Class definition for protocol Cortex__VisEventRecorderProtocol.
 */

#ifndef Cortex__VisEventRecorderProtocol_ClassDef_h_
#define Cortex__VisEventRecorderProtocol_ClassDef_h_

#include <MxTypes.h>
#include <eslapi/eslapi_stdint.h>

#include <list>
#include "sg/SGPort.h"

#include "protocol_VisEventRecorderProtocol.h"

namespace Cortex_NMS {

class Cortex__VisEventRecorderProtocol;

// Abstract interface implementation for port
class protocol_VisEventRecorderProtocol__Implementation: public protocol_VisEventRecorderProtocol
{
public:
    protocol_VisEventRecorderProtocol__Implementation(): thisPort(0) {}

    void SetPort(Cortex__VisEventRecorderProtocol *port) { thisPort = port; }

    // Protocol members
	inline bool getEvent(VisEvent* event);
	inline void putEvent(const VisEvent* event);
	inline void registerVisRegion(VisRegion* region, const char* regionName);
	inline void processEvents();


private:
    // Parent port this interface belongs to.
    Cortex__VisEventRecorderProtocol *thisPort;
};


// Protocol (port) class definition
class Cortex__VisEventRecorderProtocol: public sg::Port
{
private:
    
public:
    // Resources


    // Connector instances
	sg::SlaveConnector< bool (VisEvent*) > getEvent;
	sg::SlaveConnector< void (const VisEvent*) > putEvent;
	sg::SlaveConnector< void (VisRegion*,const char*) > registerVisRegion;
	sg::MasterConnector< void (void) > processEvents;


    Cortex__VisEventRecorderProtocol()
    {
        abstractInterface__.SetPort(this);
		define_behaviour(getEvent);
		define_behaviour(putEvent);
		define_behaviour(registerVisRegion);
		define_behaviour(processEvents);


    }

    // Set name (currently ignored here)
    void SetName__(const char *) {}

    // Abstract port interface for non-LISA C++ components
    protocol_VisEventRecorderProtocol__Implementation abstractInterface__;

    // Get abstract interface for non-LISA C++ components
    protocol_VisEventRecorderProtocol *getAbstractInterface() { return &abstractInterface__; }
};


// Abstract interface implementations
inline bool protocol_VisEventRecorderProtocol__Implementation::getEvent(VisEvent* event)
{
	return thisPort->getEvent(event);
}

inline void protocol_VisEventRecorderProtocol__Implementation::putEvent(const VisEvent* event)
{
	return thisPort->putEvent(event);
}

inline void protocol_VisEventRecorderProtocol__Implementation::registerVisRegion(VisRegion* region, const char* regionName)
{
	return thisPort->registerVisRegion(region, regionName);
}

inline void protocol_VisEventRecorderProtocol__Implementation::processEvents()
{
	return thisPort->processEvents();
}




// Mapping object
// (these ports are implemented inside Cortex__VisEventRecorderProtocol__AddressablePort)
class Cortex__VisEventRecorderProtocol__AddressablePort_OutPort: public Cortex__VisEventRecorderProtocol
{
public:
    // constructor
    Cortex__VisEventRecorderProtocol__AddressablePort_OutPort(MxU32 inFirst,
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
class Cortex__VisEventRecorderProtocol__AddressablePort: public Cortex__VisEventRecorderProtocol
{
public:
    declare_slave_behaviour(mapRange, sg::Port*(MxU64 inFirst, MxU64 inLast, MxU64 outFirst, MxU64 outLast));
    declare_slave_behaviour(mapDefault, sg::Port*());
    declare_slave_behaviour(unmapRange, void(sg::Port*));
    declare_slave_behaviour(isMapped, bool(MxU64));

    Cortex__VisEventRecorderProtocol__AddressablePort():
    defaultOutPort__(0),
    portName__("(unknown name)")
    {
        define_behaviour(mapRange);
        define_behaviour(mapDefault);
        define_behaviour(unmapRange);
        define_behaviour(isMapped);
        bind_method(*this, mapRange, &Cortex__VisEventRecorderProtocol__AddressablePort::mapRange__, this);
        bind_method(*this, mapDefault, &Cortex__VisEventRecorderProtocol__AddressablePort::mapDefault__, this);
        bind_method(*this, unmapRange, &Cortex__VisEventRecorderProtocol__AddressablePort::unmapRange__, this);
        bind_method(*this, isMapped, &Cortex__VisEventRecorderProtocol__AddressablePort::isMapped__, this);

    }

    ~Cortex__VisEventRecorderProtocol__AddressablePort()
    {
        OutPortList__::iterator it;
        for (it = outPortList__.begin(); it != outPortList__.end(); ++it)
            delete *it;
        delete defaultOutPort__;
    }

    void SetName__(const char *name) { portName__ = name; }

    Cortex__VisEventRecorderProtocol__AddressablePort_OutPort *locateOutPort__(MxU32 &addr)
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
        Cortex__VisEventRecorderProtocol__AddressablePort_OutPort *masterPort =
            new Cortex__VisEventRecorderProtocol__AddressablePort_OutPort(inFirst, inLast, outFirst, outLast);
		this->getEvent.connectTo(&masterPort->getEvent);
		this->putEvent.connectTo(&masterPort->putEvent);
		this->registerVisRegion.connectTo(&masterPort->registerVisRegion);
		this->processEvents.connectTo(&masterPort->processEvents);

        // push_front() because the first statement should have the lowest priority and the last statement should have the
        // highest priority, like PVBusDecoder
        outPortList__.push_front(masterPort);
        return masterPort;
    }

    // map default slave
    sg::Port* mapDefault__()
    {
        delete defaultOutPort__;
        defaultOutPort__ = new Cortex__VisEventRecorderProtocol__AddressablePort_OutPort(0, MxU32(0) - 1, 0, MxU32(0) - 1);
        return defaultOutPort__;
    }

    void unmapRange__(sg::Port* port)
    {
        outPortList__.remove((Cortex__VisEventRecorderProtocol__AddressablePort_OutPort*)port);
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
    typedef std::list<Cortex__VisEventRecorderProtocol__AddressablePort_OutPort*> OutPortList__;
    OutPortList__ outPortList__;
    Cortex__VisEventRecorderProtocol__AddressablePort_OutPort *defaultOutPort__;
    const char *portName__;
};

} // namespace Cortex_NMS

#endif

