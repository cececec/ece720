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
 * Class definition for protocol Cortex__GICv3Comms.
 */

#ifndef Cortex__GICv3Comms_ClassDef_h_
#define Cortex__GICv3Comms_ClassDef_h_

#include <MxTypes.h>
#include <eslapi/eslapi_stdint.h>

#include <list>
#include "sg/SGPort.h"

#include "protocol_GICv3Comms.h"

namespace Cortex_NMS {

class Cortex__GICv3Comms;

// Abstract interface implementation for port
class protocol_GICv3Comms__Implementation: public protocol_GICv3Comms
{
public:
    protocol_GICv3Comms__Implementation(): thisPort(0) {}

    void SetPort(Cortex__GICv3Comms *port) { thisPort = port; }

    // Protocol members
	inline void sendTowardsCPU(uint8_t len, const uint8_t* data);
	inline void sendTowardsTopLevel(uint8_t len, const uint8_t* data);
	inline void setAXIMasterID(uint32_t master_id);


private:
    // Parent port this interface belongs to.
    Cortex__GICv3Comms *thisPort;
};


// Protocol (port) class definition
class Cortex__GICv3Comms: public sg::Port
{
private:
    
public:
    // Resources


    // Connector instances
	sg::SlaveConnector< void (uint8_t,const uint8_t*) > sendTowardsCPU;
	sg::MasterConnector< void (uint8_t,const uint8_t*) > sendTowardsTopLevel;
	sg::MasterConnector< void (uint32_t) > setAXIMasterID;


    Cortex__GICv3Comms()
    {
        abstractInterface__.SetPort(this);
		define_behaviour(sendTowardsCPU);
		define_behaviour(sendTowardsTopLevel);
		define_behaviour(setAXIMasterID);


    }

    // Set name (currently ignored here)
    void SetName__(const char *) {}

    // Abstract port interface for non-LISA C++ components
    protocol_GICv3Comms__Implementation abstractInterface__;

    // Get abstract interface for non-LISA C++ components
    protocol_GICv3Comms *getAbstractInterface() { return &abstractInterface__; }
};


// Abstract interface implementations
inline void protocol_GICv3Comms__Implementation::sendTowardsCPU(uint8_t len, const uint8_t* data)
{
	return thisPort->sendTowardsCPU(len, data);
}

inline void protocol_GICv3Comms__Implementation::sendTowardsTopLevel(uint8_t len, const uint8_t* data)
{
	return thisPort->sendTowardsTopLevel(len, data);
}

inline void protocol_GICv3Comms__Implementation::setAXIMasterID(uint32_t master_id)
{
	return thisPort->setAXIMasterID(master_id);
}




// Mapping object
// (these ports are implemented inside Cortex__GICv3Comms__AddressablePort)
class Cortex__GICv3Comms__AddressablePort_OutPort: public Cortex__GICv3Comms
{
public:
    // constructor
    Cortex__GICv3Comms__AddressablePort_OutPort(MxU32 inFirst,
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
class Cortex__GICv3Comms__AddressablePort: public Cortex__GICv3Comms
{
public:
    declare_slave_behaviour(mapRange, sg::Port*(MxU64 inFirst, MxU64 inLast, MxU64 outFirst, MxU64 outLast));
    declare_slave_behaviour(mapDefault, sg::Port*());
    declare_slave_behaviour(unmapRange, void(sg::Port*));
    declare_slave_behaviour(isMapped, bool(MxU64));

    Cortex__GICv3Comms__AddressablePort():
    defaultOutPort__(0),
    portName__("(unknown name)")
    {
        define_behaviour(mapRange);
        define_behaviour(mapDefault);
        define_behaviour(unmapRange);
        define_behaviour(isMapped);
        bind_method(*this, mapRange, &Cortex__GICv3Comms__AddressablePort::mapRange__, this);
        bind_method(*this, mapDefault, &Cortex__GICv3Comms__AddressablePort::mapDefault__, this);
        bind_method(*this, unmapRange, &Cortex__GICv3Comms__AddressablePort::unmapRange__, this);
        bind_method(*this, isMapped, &Cortex__GICv3Comms__AddressablePort::isMapped__, this);

    }

    ~Cortex__GICv3Comms__AddressablePort()
    {
        OutPortList__::iterator it;
        for (it = outPortList__.begin(); it != outPortList__.end(); ++it)
            delete *it;
        delete defaultOutPort__;
    }

    void SetName__(const char *name) { portName__ = name; }

    Cortex__GICv3Comms__AddressablePort_OutPort *locateOutPort__(MxU32 &addr)
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
        Cortex__GICv3Comms__AddressablePort_OutPort *masterPort =
            new Cortex__GICv3Comms__AddressablePort_OutPort(inFirst, inLast, outFirst, outLast);
		this->sendTowardsCPU.connectTo(&masterPort->sendTowardsCPU);
		this->sendTowardsTopLevel.connectTo(&masterPort->sendTowardsTopLevel);
		this->setAXIMasterID.connectTo(&masterPort->setAXIMasterID);

        // push_front() because the first statement should have the lowest priority and the last statement should have the
        // highest priority, like PVBusDecoder
        outPortList__.push_front(masterPort);
        return masterPort;
    }

    // map default slave
    sg::Port* mapDefault__()
    {
        delete defaultOutPort__;
        defaultOutPort__ = new Cortex__GICv3Comms__AddressablePort_OutPort(0, MxU32(0) - 1, 0, MxU32(0) - 1);
        return defaultOutPort__;
    }

    void unmapRange__(sg::Port* port)
    {
        outPortList__.remove((Cortex__GICv3Comms__AddressablePort_OutPort*)port);
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
    typedef std::list<Cortex__GICv3Comms__AddressablePort_OutPort*> OutPortList__;
    OutPortList__ outPortList__;
    Cortex__GICv3Comms__AddressablePort_OutPort *defaultOutPort__;
    const char *portName__;
};

} // namespace Cortex_NMS

#endif

