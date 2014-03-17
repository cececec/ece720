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
 * Class definition for protocol Cortex__TZFilterControl.
 */

#ifndef Cortex__TZFilterControl_ClassDef_h_
#define Cortex__TZFilterControl_ClassDef_h_

#include <MxTypes.h>
#include <eslapi/eslapi_stdint.h>

#include <list>
#include "sg/SGPort.h"

#include "protocol_TZFilterControl.h"

namespace Cortex_NMS {

class Cortex__TZFilterControl;

// Abstract interface implementation for port
class protocol_TZFilterControl__Implementation: public protocol_TZFilterControl
{
public:
    protocol_TZFilterControl__Implementation(): thisPort(0) {}

    void SetPort(Cortex__TZFilterControl *port) { thisPort = port; }

    // Protocol members
	inline bool checkPermission(const pv::TransactionAttributes* attributes_, pv::bus_addr_t page_base_, bool is_read_, pv::RemapRequest& req_, bool& abort_on_error_);
	inline bool isEnabled();
	inline bool isSecureSlave();
	inline void setConfig(bool rd_spec_enable, bool wr_spec_enable, uint32_t action);


private:
    // Parent port this interface belongs to.
    Cortex__TZFilterControl *thisPort;
};


// Protocol (port) class definition
class Cortex__TZFilterControl: public sg::Port
{
private:
    
public:
    // Resources


    // Connector instances
	sg::SlaveConnector< bool (const pv::TransactionAttributes*,pv::bus_addr_t,bool,pv::RemapRequest&,bool&) > checkPermission;
	sg::SlaveConnector< bool (void) > isEnabled;
	sg::SlaveConnector< bool (void) > isSecureSlave;
	sg::MasterConnector< void (bool,bool,uint32_t) > setConfig;


    Cortex__TZFilterControl()
    {
        abstractInterface__.SetPort(this);
		define_behaviour(checkPermission);
		define_behaviour(isEnabled);
		define_behaviour(isSecureSlave);
		define_behaviour(setConfig);


    }

    // Set name (currently ignored here)
    void SetName__(const char *) {}

    // Abstract port interface for non-LISA C++ components
    protocol_TZFilterControl__Implementation abstractInterface__;

    // Get abstract interface for non-LISA C++ components
    protocol_TZFilterControl *getAbstractInterface() { return &abstractInterface__; }
};


// Abstract interface implementations
inline bool protocol_TZFilterControl__Implementation::checkPermission(const pv::TransactionAttributes* attributes_, pv::bus_addr_t page_base_, bool is_read_, pv::RemapRequest& req_, bool& abort_on_error_)
{
	return thisPort->checkPermission(attributes_, page_base_, is_read_, req_, abort_on_error_);
}

inline bool protocol_TZFilterControl__Implementation::isEnabled()
{
	return thisPort->isEnabled();
}

inline bool protocol_TZFilterControl__Implementation::isSecureSlave()
{
	return thisPort->isSecureSlave();
}

inline void protocol_TZFilterControl__Implementation::setConfig(bool rd_spec_enable, bool wr_spec_enable, uint32_t action)
{
	return thisPort->setConfig(rd_spec_enable, wr_spec_enable, action);
}




// Mapping object
// (these ports are implemented inside Cortex__TZFilterControl__AddressablePort)
class Cortex__TZFilterControl__AddressablePort_OutPort: public Cortex__TZFilterControl
{
public:
    // constructor
    Cortex__TZFilterControl__AddressablePort_OutPort(MxU32 inFirst,
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
class Cortex__TZFilterControl__AddressablePort: public Cortex__TZFilterControl
{
public:
    declare_slave_behaviour(mapRange, sg::Port*(MxU64 inFirst, MxU64 inLast, MxU64 outFirst, MxU64 outLast));
    declare_slave_behaviour(mapDefault, sg::Port*());
    declare_slave_behaviour(unmapRange, void(sg::Port*));
    declare_slave_behaviour(isMapped, bool(MxU64));

    Cortex__TZFilterControl__AddressablePort():
    defaultOutPort__(0),
    portName__("(unknown name)")
    {
        define_behaviour(mapRange);
        define_behaviour(mapDefault);
        define_behaviour(unmapRange);
        define_behaviour(isMapped);
        bind_method(*this, mapRange, &Cortex__TZFilterControl__AddressablePort::mapRange__, this);
        bind_method(*this, mapDefault, &Cortex__TZFilterControl__AddressablePort::mapDefault__, this);
        bind_method(*this, unmapRange, &Cortex__TZFilterControl__AddressablePort::unmapRange__, this);
        bind_method(*this, isMapped, &Cortex__TZFilterControl__AddressablePort::isMapped__, this);

    }

    ~Cortex__TZFilterControl__AddressablePort()
    {
        OutPortList__::iterator it;
        for (it = outPortList__.begin(); it != outPortList__.end(); ++it)
            delete *it;
        delete defaultOutPort__;
    }

    void SetName__(const char *name) { portName__ = name; }

    Cortex__TZFilterControl__AddressablePort_OutPort *locateOutPort__(MxU32 &addr)
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
        Cortex__TZFilterControl__AddressablePort_OutPort *masterPort =
            new Cortex__TZFilterControl__AddressablePort_OutPort(inFirst, inLast, outFirst, outLast);
		this->checkPermission.connectTo(&masterPort->checkPermission);
		this->isEnabled.connectTo(&masterPort->isEnabled);
		this->isSecureSlave.connectTo(&masterPort->isSecureSlave);
		this->setConfig.connectTo(&masterPort->setConfig);

        // push_front() because the first statement should have the lowest priority and the last statement should have the
        // highest priority, like PVBusDecoder
        outPortList__.push_front(masterPort);
        return masterPort;
    }

    // map default slave
    sg::Port* mapDefault__()
    {
        delete defaultOutPort__;
        defaultOutPort__ = new Cortex__TZFilterControl__AddressablePort_OutPort(0, MxU32(0) - 1, 0, MxU32(0) - 1);
        return defaultOutPort__;
    }

    void unmapRange__(sg::Port* port)
    {
        outPortList__.remove((Cortex__TZFilterControl__AddressablePort_OutPort*)port);
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
    typedef std::list<Cortex__TZFilterControl__AddressablePort_OutPort*> OutPortList__;
    OutPortList__ outPortList__;
    Cortex__TZFilterControl__AddressablePort_OutPort *defaultOutPort__;
    const char *portName__;
};

} // namespace Cortex_NMS

#endif
