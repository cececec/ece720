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
 * Class definition for protocol Cortex__PVBusRouterControl.
 */

#ifndef Cortex__PVBusRouterControl_ClassDef_h_
#define Cortex__PVBusRouterControl_ClassDef_h_

#include <MxTypes.h>
#include <eslapi/eslapi_stdint.h>

#include <list>
#include "sg/SGPort.h"

#include "protocol_PVBusRouterControl.h"

namespace Cortex_NMS {

class Cortex__PVBusRouterControl;

// Abstract interface implementation for port
class protocol_PVBusRouterControl__Implementation: public protocol_PVBusRouterControl
{
public:
    protocol_PVBusRouterControl__Implementation(): thisPort(0) {}

    void SetPort(Cortex__PVBusRouterControl *port) { thisPort = port; }

    // Protocol members
	inline unsigned filter(const pv::TransactionAttributes* attributes_, pv::bus_addr_t page_base_, bool is_read_);


private:
    // Parent port this interface belongs to.
    Cortex__PVBusRouterControl *thisPort;
};


// Protocol (port) class definition
class Cortex__PVBusRouterControl: public sg::Port
{
private:
    
public:
    // Resources


    // Connector instances
	sg::SlaveConnector< unsigned (const pv::TransactionAttributes*,pv::bus_addr_t,bool) > filter;


    Cortex__PVBusRouterControl()
    {
        abstractInterface__.SetPort(this);
		define_behaviour(filter);


    }

    // Set name (currently ignored here)
    void SetName__(const char *) {}

    // Abstract port interface for non-LISA C++ components
    protocol_PVBusRouterControl__Implementation abstractInterface__;

    // Get abstract interface for non-LISA C++ components
    protocol_PVBusRouterControl *getAbstractInterface() { return &abstractInterface__; }
};


// Abstract interface implementations
inline unsigned protocol_PVBusRouterControl__Implementation::filter(const pv::TransactionAttributes* attributes_, pv::bus_addr_t page_base_, bool is_read_)
{
	return thisPort->filter(attributes_, page_base_, is_read_);
}




// Mapping object
// (these ports are implemented inside Cortex__PVBusRouterControl__AddressablePort)
class Cortex__PVBusRouterControl__AddressablePort_OutPort: public Cortex__PVBusRouterControl
{
public:
    // constructor
    Cortex__PVBusRouterControl__AddressablePort_OutPort(MxU32 inFirst,
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
class Cortex__PVBusRouterControl__AddressablePort: public Cortex__PVBusRouterControl
{
public:
    declare_slave_behaviour(mapRange, sg::Port*(MxU64 inFirst, MxU64 inLast, MxU64 outFirst, MxU64 outLast));
    declare_slave_behaviour(mapDefault, sg::Port*());
    declare_slave_behaviour(unmapRange, void(sg::Port*));
    declare_slave_behaviour(isMapped, bool(MxU64));

    Cortex__PVBusRouterControl__AddressablePort():
    defaultOutPort__(0),
    portName__("(unknown name)")
    {
        define_behaviour(mapRange);
        define_behaviour(mapDefault);
        define_behaviour(unmapRange);
        define_behaviour(isMapped);
        bind_method(*this, mapRange, &Cortex__PVBusRouterControl__AddressablePort::mapRange__, this);
        bind_method(*this, mapDefault, &Cortex__PVBusRouterControl__AddressablePort::mapDefault__, this);
        bind_method(*this, unmapRange, &Cortex__PVBusRouterControl__AddressablePort::unmapRange__, this);
        bind_method(*this, isMapped, &Cortex__PVBusRouterControl__AddressablePort::isMapped__, this);

    }

    ~Cortex__PVBusRouterControl__AddressablePort()
    {
        OutPortList__::iterator it;
        for (it = outPortList__.begin(); it != outPortList__.end(); ++it)
            delete *it;
        delete defaultOutPort__;
    }

    void SetName__(const char *name) { portName__ = name; }

    Cortex__PVBusRouterControl__AddressablePort_OutPort *locateOutPort__(MxU32 &addr)
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
        Cortex__PVBusRouterControl__AddressablePort_OutPort *masterPort =
            new Cortex__PVBusRouterControl__AddressablePort_OutPort(inFirst, inLast, outFirst, outLast);
		this->filter.connectTo(&masterPort->filter);

        // push_front() because the first statement should have the lowest priority and the last statement should have the
        // highest priority, like PVBusDecoder
        outPortList__.push_front(masterPort);
        return masterPort;
    }

    // map default slave
    sg::Port* mapDefault__()
    {
        delete defaultOutPort__;
        defaultOutPort__ = new Cortex__PVBusRouterControl__AddressablePort_OutPort(0, MxU32(0) - 1, 0, MxU32(0) - 1);
        return defaultOutPort__;
    }

    void unmapRange__(sg::Port* port)
    {
        outPortList__.remove((Cortex__PVBusRouterControl__AddressablePort_OutPort*)port);
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
    typedef std::list<Cortex__PVBusRouterControl__AddressablePort_OutPort*> OutPortList__;
    OutPortList__ outPortList__;
    Cortex__PVBusRouterControl__AddressablePort_OutPort *defaultOutPort__;
    const char *portName__;
};

} // namespace Cortex_NMS

#endif
