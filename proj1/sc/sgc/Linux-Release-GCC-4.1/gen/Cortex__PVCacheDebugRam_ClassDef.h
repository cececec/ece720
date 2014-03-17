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
 * Class definition for protocol Cortex__PVCacheDebugRam.
 */

#ifndef Cortex__PVCacheDebugRam_ClassDef_h_
#define Cortex__PVCacheDebugRam_ClassDef_h_

#include <MxTypes.h>
#include <eslapi/eslapi_stdint.h>

#include <list>
#include "sg/SGPort.h"

#include "protocol_PVCacheDebugRam.h"

namespace Cortex_NMS {

class Cortex__PVCacheDebugRam;

// Abstract interface implementation for port
class protocol_PVCacheDebugRam__Implementation: public protocol_PVCacheDebugRam
{
public:
    protocol_PVCacheDebugRam__Implementation(): thisPort(0) {}

    void SetPort(Cortex__PVCacheDebugRam *port) { thisPort = port; }

    // Protocol members
	inline void getConfig(pv::PVCache_DebugConfig& config);
	inline bool peekLine(const pv::PVCache_DebugFilter& filter, pv::PVCache_DebugLine& buffer);
	inline bool pokeLine(const pv::PVCache_DebugFilter& filter, const pv::PVCache_DebugLine& buffer);


private:
    // Parent port this interface belongs to.
    Cortex__PVCacheDebugRam *thisPort;
};


// Protocol (port) class definition
class Cortex__PVCacheDebugRam: public sg::Port
{
private:
    
public:
    // Resources


    // Connector instances
	sg::SlaveConnector< void (pv::PVCache_DebugConfig&) > getConfig;
	sg::SlaveConnector< bool (const pv::PVCache_DebugFilter&,pv::PVCache_DebugLine&) > peekLine;
	sg::SlaveConnector< bool (const pv::PVCache_DebugFilter&,const pv::PVCache_DebugLine&) > pokeLine;


    Cortex__PVCacheDebugRam()
    {
        abstractInterface__.SetPort(this);
		define_behaviour(getConfig);
		define_behaviour(peekLine);
		define_behaviour(pokeLine);


    }

    // Set name (currently ignored here)
    void SetName__(const char *) {}

    // Abstract port interface for non-LISA C++ components
    protocol_PVCacheDebugRam__Implementation abstractInterface__;

    // Get abstract interface for non-LISA C++ components
    protocol_PVCacheDebugRam *getAbstractInterface() { return &abstractInterface__; }
};


// Abstract interface implementations
inline void protocol_PVCacheDebugRam__Implementation::getConfig(pv::PVCache_DebugConfig& config)
{
	return thisPort->getConfig(config);
}

inline bool protocol_PVCacheDebugRam__Implementation::peekLine(const pv::PVCache_DebugFilter& filter, pv::PVCache_DebugLine& buffer)
{
	return thisPort->peekLine(filter, buffer);
}

inline bool protocol_PVCacheDebugRam__Implementation::pokeLine(const pv::PVCache_DebugFilter& filter, const pv::PVCache_DebugLine& buffer)
{
	return thisPort->pokeLine(filter, buffer);
}




// Mapping object
// (these ports are implemented inside Cortex__PVCacheDebugRam__AddressablePort)
class Cortex__PVCacheDebugRam__AddressablePort_OutPort: public Cortex__PVCacheDebugRam
{
public:
    // constructor
    Cortex__PVCacheDebugRam__AddressablePort_OutPort(MxU32 inFirst,
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
class Cortex__PVCacheDebugRam__AddressablePort: public Cortex__PVCacheDebugRam
{
public:
    declare_slave_behaviour(mapRange, sg::Port*(MxU64 inFirst, MxU64 inLast, MxU64 outFirst, MxU64 outLast));
    declare_slave_behaviour(mapDefault, sg::Port*());
    declare_slave_behaviour(unmapRange, void(sg::Port*));
    declare_slave_behaviour(isMapped, bool(MxU64));

    Cortex__PVCacheDebugRam__AddressablePort():
    defaultOutPort__(0),
    portName__("(unknown name)")
    {
        define_behaviour(mapRange);
        define_behaviour(mapDefault);
        define_behaviour(unmapRange);
        define_behaviour(isMapped);
        bind_method(*this, mapRange, &Cortex__PVCacheDebugRam__AddressablePort::mapRange__, this);
        bind_method(*this, mapDefault, &Cortex__PVCacheDebugRam__AddressablePort::mapDefault__, this);
        bind_method(*this, unmapRange, &Cortex__PVCacheDebugRam__AddressablePort::unmapRange__, this);
        bind_method(*this, isMapped, &Cortex__PVCacheDebugRam__AddressablePort::isMapped__, this);

    }

    ~Cortex__PVCacheDebugRam__AddressablePort()
    {
        OutPortList__::iterator it;
        for (it = outPortList__.begin(); it != outPortList__.end(); ++it)
            delete *it;
        delete defaultOutPort__;
    }

    void SetName__(const char *name) { portName__ = name; }

    Cortex__PVCacheDebugRam__AddressablePort_OutPort *locateOutPort__(MxU32 &addr)
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
        Cortex__PVCacheDebugRam__AddressablePort_OutPort *masterPort =
            new Cortex__PVCacheDebugRam__AddressablePort_OutPort(inFirst, inLast, outFirst, outLast);
		this->getConfig.connectTo(&masterPort->getConfig);
		this->peekLine.connectTo(&masterPort->peekLine);
		this->pokeLine.connectTo(&masterPort->pokeLine);

        // push_front() because the first statement should have the lowest priority and the last statement should have the
        // highest priority, like PVBusDecoder
        outPortList__.push_front(masterPort);
        return masterPort;
    }

    // map default slave
    sg::Port* mapDefault__()
    {
        delete defaultOutPort__;
        defaultOutPort__ = new Cortex__PVCacheDebugRam__AddressablePort_OutPort(0, MxU32(0) - 1, 0, MxU32(0) - 1);
        return defaultOutPort__;
    }

    void unmapRange__(sg::Port* port)
    {
        outPortList__.remove((Cortex__PVCacheDebugRam__AddressablePort_OutPort*)port);
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
    typedef std::list<Cortex__PVCacheDebugRam__AddressablePort_OutPort*> OutPortList__;
    OutPortList__ outPortList__;
    Cortex__PVCacheDebugRam__AddressablePort_OutPort *defaultOutPort__;
    const char *portName__;
};

} // namespace Cortex_NMS

#endif

