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
 * Class definition for protocol Cortex__Builtin__AddressablePortProtocol.
 */

#ifndef Cortex__Builtin__AddressablePortProtocol_ClassDef_h_
#define Cortex__Builtin__AddressablePortProtocol_ClassDef_h_

#include <MxTypes.h>
#include <eslapi/eslapi_stdint.h>

#include <list>
#include "sg/SGPort.h"

#include "protocol_Builtin__AddressablePortProtocol.h"

namespace Cortex_NMS {

class Cortex__Builtin__AddressablePortProtocol;

// Abstract interface implementation for port
class protocol_Builtin__AddressablePortProtocol__Implementation: public protocol_Builtin__AddressablePortProtocol
{
public:
    protocol_Builtin__AddressablePortProtocol__Implementation(): thisPort(0) {}

    void SetPort(Cortex__Builtin__AddressablePortProtocol *port) { thisPort = port; }

    // Protocol members
	inline sg::Port* mapRange(MxU64 , MxU64 , MxU64 , MxU64 );
	inline sg::Port* mapDefault();
	inline void unmapRange(sg::Port* );


private:
    // Parent port this interface belongs to.
    Cortex__Builtin__AddressablePortProtocol *thisPort;
};


// Protocol (port) class definition
class Cortex__Builtin__AddressablePortProtocol: public sg::Port
{
private:
    
public:
    // Resources


    // Connector instances
	sg::SlaveConnector< sg::Port* (MxU64,MxU64,MxU64,MxU64) > mapRange;
	sg::SlaveConnector< sg::Port* (void) > mapDefault;
	sg::SlaveConnector< void (sg::Port*) > unmapRange;


    Cortex__Builtin__AddressablePortProtocol()
    {
        abstractInterface__.SetPort(this);
		define_behaviour(mapRange);
		define_behaviour(mapDefault);
		define_behaviour(unmapRange);


    }

    // Set name (currently ignored here)
    void SetName__(const char *) {}

    // Abstract port interface for non-LISA C++ components
    protocol_Builtin__AddressablePortProtocol__Implementation abstractInterface__;

    // Get abstract interface for non-LISA C++ components
    protocol_Builtin__AddressablePortProtocol *getAbstractInterface() { return &abstractInterface__; }
};


// Abstract interface implementations
inline sg::Port* protocol_Builtin__AddressablePortProtocol__Implementation::mapRange(MxU64 param0__, MxU64 param1__, MxU64 param2__, MxU64 param3__)
{
	return thisPort->mapRange(param0__, param1__, param2__, param3__);
}

inline sg::Port* protocol_Builtin__AddressablePortProtocol__Implementation::mapDefault()
{
	return thisPort->mapDefault();
}

inline void protocol_Builtin__AddressablePortProtocol__Implementation::unmapRange(sg::Port* param0__)
{
	return thisPort->unmapRange(param0__);
}




// Mapping object
// (these ports are implemented inside Cortex__Builtin__AddressablePortProtocol__AddressablePort)
class Cortex__Builtin__AddressablePortProtocol__AddressablePort_OutPort: public Cortex__Builtin__AddressablePortProtocol
{
public:
    // constructor
    Cortex__Builtin__AddressablePortProtocol__AddressablePort_OutPort(MxU32 inFirst,
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
class Cortex__Builtin__AddressablePortProtocol__AddressablePort: public Cortex__Builtin__AddressablePortProtocol
{
public:
    declare_slave_behaviour(mapRange, sg::Port*(MxU64 inFirst, MxU64 inLast, MxU64 outFirst, MxU64 outLast));
    declare_slave_behaviour(mapDefault, sg::Port*());
    declare_slave_behaviour(unmapRange, void(sg::Port*));
    declare_slave_behaviour(isMapped, bool(MxU64));

    Cortex__Builtin__AddressablePortProtocol__AddressablePort():
    defaultOutPort__(0),
    portName__("(unknown name)")
    {
        define_behaviour(mapRange);
        define_behaviour(mapDefault);
        define_behaviour(unmapRange);
        define_behaviour(isMapped);
        bind_method(*this, mapRange, &Cortex__Builtin__AddressablePortProtocol__AddressablePort::mapRange__, this);
        bind_method(*this, mapDefault, &Cortex__Builtin__AddressablePortProtocol__AddressablePort::mapDefault__, this);
        bind_method(*this, unmapRange, &Cortex__Builtin__AddressablePortProtocol__AddressablePort::unmapRange__, this);
        bind_method(*this, isMapped, &Cortex__Builtin__AddressablePortProtocol__AddressablePort::isMapped__, this);

    }

    ~Cortex__Builtin__AddressablePortProtocol__AddressablePort()
    {
        OutPortList__::iterator it;
        for (it = outPortList__.begin(); it != outPortList__.end(); ++it)
            delete *it;
        delete defaultOutPort__;
    }

    void SetName__(const char *name) { portName__ = name; }

    Cortex__Builtin__AddressablePortProtocol__AddressablePort_OutPort *locateOutPort__(MxU32 &addr)
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
        Cortex__Builtin__AddressablePortProtocol__AddressablePort_OutPort *masterPort =
            new Cortex__Builtin__AddressablePortProtocol__AddressablePort_OutPort(inFirst, inLast, outFirst, outLast);
		this->mapRange.connectTo(&masterPort->mapRange);
		this->mapDefault.connectTo(&masterPort->mapDefault);
		this->unmapRange.connectTo(&masterPort->unmapRange);

        // push_front() because the first statement should have the lowest priority and the last statement should have the
        // highest priority, like PVBusDecoder
        outPortList__.push_front(masterPort);
        return masterPort;
    }

    // map default slave
    sg::Port* mapDefault__()
    {
        delete defaultOutPort__;
        defaultOutPort__ = new Cortex__Builtin__AddressablePortProtocol__AddressablePort_OutPort(0, MxU32(0) - 1, 0, MxU32(0) - 1);
        return defaultOutPort__;
    }

    void unmapRange__(sg::Port* port)
    {
        outPortList__.remove((Cortex__Builtin__AddressablePortProtocol__AddressablePort_OutPort*)port);
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
    typedef std::list<Cortex__Builtin__AddressablePortProtocol__AddressablePort_OutPort*> OutPortList__;
    OutPortList__ outPortList__;
    Cortex__Builtin__AddressablePortProtocol__AddressablePort_OutPort *defaultOutPort__;
    const char *portName__;
};

} // namespace Cortex_NMS

#endif

