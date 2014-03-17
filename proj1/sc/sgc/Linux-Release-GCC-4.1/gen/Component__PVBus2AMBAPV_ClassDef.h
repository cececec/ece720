/*
 * 
 *
 * This is an automatically generated file. Do not edit.
 *
 * Copyright 2006 ARM Limited.
 * Copyright 2011 ARM LImited.
 *
 * All rights reserved.
 */

/** \file
 * Class definition for Component PVBus2AMBAPV.
 */

#ifndef Component_Component__PVBus2AMBAPV_ClassDef_h_
#define Component_Component__PVBus2AMBAPV_ClassDef_h_

#include <MxTypes.h>
#include <eslapi/eslapi_stdint.h>

#include <limits.h>
#include <map>
#include <fstream>
#include "SystemGenComponent.h"
#include "CADIBase.h"
#include "ComponentRegister.h"
#include "ResourceAccessFuncTypes.h"
#include "CADIParameterProxy.h"
#include "ParameterFilter.h"
#include "sg/SGTargetInfo.h"
#include "Cortex_DSO.h"

using namespace std;

#line 33 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
 

        /* WARNING! API not intended to be supported and will definitely
         * change in future releases. */
        #include <pv/PVMemoryAttributes.h>
    
#line 44 "./Linux-Release-GCC-4.1/gen/Component__PVBus2AMBAPV_ClassDef.h"
#include "Cortex__AMBAPV_ClassDef.h"
#include "Cortex__Builtin__ControlProtocol_ClassDef.h"
#include "Cortex__PVBus_ClassDef.h"
#include "Cortex__PVBusSlaveControl_ClassDef.h"
#include "Cortex__PVDevice_ClassDef.h"



class SimulationEngine;
class ObjectLoader;

using namespace sg::accessfunc;

namespace eslapi
{
    class CADI;
}

namespace Cortex_NMS {

class ParameterFilter_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV : public ParameterFilter
{
public:
	ParameterFilter_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV()
	{
		ovrd_params["size"] = eslapi::CADIParameterInfo_t(0x10000003 | PARAMETERFILTER_FORWARDED, "size",eslapi::CADI_PARAM_INT, "Addressable range of device (0 means 2^64)",0,MxS64CONST(0x8000000000000000),MxS64CONST(0x7fffffffffffffff),MxS64CONST(0x0), "0" ); // forwarded from "max_size"
	}
};

class ParameterFilter_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV : public ParameterFilter
{
public:
	ParameterFilter_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV()
	{
		ovrd_params["size"] = eslapi::CADIParameterInfo_t(0x10000003 | PARAMETERFILTER_FORWARDED, "size",eslapi::CADI_PARAM_INT, "Addressable range of device (0 means 2^64)",0,MxS64CONST(0x8000000000000000),MxS64CONST(0x7fffffffffffffff),MxS64CONST(0x0), "0" ); // forwarded from "max_size"
	}
};



class
#ifndef _WINDOWS
SG_Cortex_DSO
#endif
Component__PVBus2AMBAPV: public SystemGenComponent
{
public:
    // pointers to subcomponents
	sg::ComponentBase *bus_slave_s;
	sg::ComponentBase *bus_slave_ns;
	Component__TZSwitch *tz_switch;


    // control ports of subcomponents
	Cortex__Builtin__ControlProtocol controlPort_bus_slave_s__;
	Cortex__Builtin__ControlProtocol controlPort_bus_slave_ns__;
	Cortex__Builtin__ControlProtocol controlPort_tz_switch__;


    // abstract ports
	Cortex__PVBus pvbus_s;
	Cortex__AMBAPV amba_pv_m;
	Cortex__PVBusSlaveControl control_ns;
	Cortex__PVBusSlaveControl control_s;
	Cortex__PVDevice device;


    // resources
    std::string application_pathname;


#line 40 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"


        // Limit size of memory region, defaulting to 48-bit
        const uint64_t  max_size   
                      ;

        const bool  global_monitor   
                      ;
    
#line 126 "./Linux-Release-GCC-4.1/gen/Component__PVBus2AMBAPV_ClassDef.h"


    // find parameter name for a specific CADIFactory parameter ID
    std::map<MxU32,std::string> parameterId2parameterName__;

    // list of all CADI parameters
    std::vector<eslapi::CADIParameterInfo_t> parameterInfos__;


    // ================================================================================
    // methods
    // ================================================================================

    // constructor and destructor
    Component__PVBus2AMBAPV(const char *argv, sg::SimulationContext* simulationContext, const sg::Params & params);
    ~Component__PVBus2AMBAPV();

    // interface functions
    sg::SimulationContext* getSimulationContext() const { return simulationContext__; }

    // control port implementation
    void control_port__configure(const sg::Params& params);
    void control_port__loadApplicationFile(const std::string& filename);
    std::string control_port__getProperty(const std::string& propname);
    std::string control_port__bypass(const std::string&);
    void control_port__run();
    void control_port__stop();
    void control_port__idle();
    void control_port__quit();
    void control_port__getMxDI(std::map<std::string,eslapi::CADI*>*);
    void control_port__setSimulationEngine(SimulationEngine*);
    void control_port__populateCADIMap(std::map< std::string, eslapi::CAInterface* > &, std::string const &);
    void control_port__message(const std::string &msg, sg::message::MessageType msgType);
    std::string control_port__callSimEngine(const std::string&);
    void control_port__reset(int level);
    void control_port__terminate();

    // CADI Port implementations
    eslapi::CADIReturn_t cadiPort__GetParameters(MxU32 startIndex, MxU32 desiredNumOfParams, MxU32 *actualNumOfParams, eslapi::CADIParameterInfo_t *params);
    eslapi::CADIReturn_t cadiPort__GetParameterInfo(const std::string &parameterName, eslapi::CADIParameterInfo_t* param);
    eslapi::CADIReturn_t cadiPort__GetParameterValues (uint32_t parameterCount, uint32_t *actualNumOfParamsRead, eslapi::CADIParameterValue_t *paramValuesOut);
    eslapi::CADIReturn_t cadiPort__SetParameters(uint32_t count, eslapi::CADIParameterValue_t *params, eslapi::CADIFactoryErrorMessage_t *error);
    eslapi::CADIReturn_t cadiPort__GetProperty(const std::string& propertyName, std::string &value);
    void cadiPort__LoadApplicationFile(const std::string& filename);
    void cadiPort__GetApplicationsAndCommandLineParams(std::map<std::string, std::string>&applications2params_);

    // helper functions
    void insertCADIMap__(std::string prefix, std::map< std::string, eslapi::CAInterface*>&componentName2CADI);

    sg::accessfunc::AccessFuncResult parameter_read_func(uint32_t id, int64_t *data);
    sg::accessfunc::AccessFuncResult parameter_read_string_func(uint32_t id, std::string &data);
    sg::accessfunc::AccessFuncResult parameter_write_func(uint32_t id, const int64_t *data);
    sg::accessfunc::AccessFuncResult parameter_write_string_func(uint32_t id, const std::string &data);

    // dummy functions, mostly required by IsimMain (formerly InterpreterMain), will go away soon

    // May be required by TraceGen however that itself is obsolete
    MxU64 getInstructionCount() const { return 0; }
    // May be required by SystemGen however that itself is obsolete
    MxU64 getCycleCount() const { return 0; }

	void build_amba_pv_extension(const pv::Transaction* tx, amba_pv::amba_pv_extension* ex);
	bool send_tlm_dmi_request(pv::Transaction* tx, tlm::tlm_command command);
	pv::Tx_Result send_tlm_transaction(pv::Transaction* tx, tlm::tlm_command command, bool debug);
	void get_direct_mem_ptr(amba_pv::amba_pv_transaction& trans, bool non_secure);
	void init();
	void interconnect();
	void disconnect();
	void update();
	void communicate();
	void traceEndOfCycle();
	void loadApplicationFile(const std::string& filename);
	void terminate();
	void reset(int level);
	void reset(int level, int /*argc*/, char** /*argv*/);
	bool save(MxODataStream& os);
	bool restore(MxIDataStream& is);
	void step();
	void abstract_port__amba_pv_m__invalidate_direct_mem_ptr(int socket_id, sc_dt::uint64 start_range, sc_dt::uint64 end_range);
	pv::Tx_Result abstract_port__device__read(pv::ReadTransaction tx);
	pv::Tx_Result abstract_port__device__write(pv::WriteTransaction tx);
	pv::Tx_Result abstract_port__device__debugRead(pv::ReadTransaction tx);
	pv::Tx_Result abstract_port__device__debugWrite(pv::WriteTransaction tx);

    void simHalt();
    void simRun();
    bool simIsRunning();
    void simShutdown();
    void simReset(uint32_t level);


private:
    // methods
    eslapi::CADI* obtainCADI__(const std::string &subcomp, const std::map< std::string, eslapi::CAInterface* > &componentName2CADI) const;
    static bool ForwardParameterValueToSubcomponent(CADIParameterProxy *proxy,
                                                    const char *param_name,
                                                    int64_t intVal,
                                                    const char *strVal);
    uint32_t paramNameToParamAccessFuncID(const std::string &name);

    void reset_resources__();
    void freeCADIResources__();


	ParameterFilter_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV parameterFilter_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV__;
	ParameterFilter_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV parameterFilter_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV__;


	CADIParameterProxy *cadiParameterProxy_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV__;
	CADIParameterProxy *cadiParameterProxy_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV__;


    // definition of parameter IDs as constants for use in parameter access functions
	enum
	{
		PARAMETER_ID_max_size = 0x10000001,
		PARAMETER_ID_global_monitor = 0x10000002,
	};




};

} // namespace Cortex_NMS

#endif

