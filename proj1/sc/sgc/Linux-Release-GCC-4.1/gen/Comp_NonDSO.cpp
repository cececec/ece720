/*
 * 
 *
 * This is an automatically generated file. Do not edit.
 *
 * Copyright 2009 ARM Limited.
 * Copyright 2011 ARM Limited.
 *
 * All rights reserved.
 */
/** \file
 * System components.
 */

#include "GlobalDefs.h"
#include "Components.h"

#include "Component__PVBus2AMBAPV_ClassDef.h"
#include "Component__Cortex_ClassDef.h"
#include "Component__TZSwitch_ClassDef.h"
#include "Component__PVBus2AMBAPV_ClassDef.h"


#include "eslapi/CADITypes.h"


#include "sg/SGBasicComponentFactory.h"

#include "TerminateScheduler.h"
#include "ParameterFilter.h"

#include <sg/MSCFixes.h>

// make the MSG_<...> symbols available in the global namespace
using namespace sg::message;

// component CADI interfaces
// ------------------------------------------------------------------------------
// CADI Interface for component Component__Cortex
// ------------------------------------------------------------------------------

namespace Cortex_NMS {

class Component__Cortex_CADI : public sg::CADIBase
{
public:
        Component__Cortex_CADI(Component__Cortex* parentComponent, sg::ComponentBase* simulationEngine);

    eslapi::CADIReturn_t CADIXfaceBypass(uint32_t commandLength, const char *command, uint32_t maxResponseLength, char *response);
    sg::accessfunc::AccessFuncResult GetExtendedTargetFeatures(MxU32 /*id*/, std::string &data, bool /*se*/);

private:
    Component__Cortex *component;
};

} // Cortex_NMS
// ------------------------------------------------------------------------------
// CADI Interface for component Component__PVBus2AMBAPV
// ------------------------------------------------------------------------------

namespace Cortex_NMS {

class Component__PVBus2AMBAPV_CADI : public sg::CADIBase
{
public:
        Component__PVBus2AMBAPV_CADI(Component__PVBus2AMBAPV* parentComponent, sg::ComponentBase* simulationEngine);

    eslapi::CADIReturn_t CADIXfaceBypass(uint32_t commandLength, const char *command, uint32_t maxResponseLength, char *response);
    sg::accessfunc::AccessFuncResult GetExtendedTargetFeatures(MxU32 /*id*/, std::string &data, bool /*se*/);

private:
    Component__PVBus2AMBAPV *component;
};

} // Cortex_NMS


// non inline behaviors
#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::interconnect()
{{if(!controlPort_Core__.interconnect.empty()) controlPort_Core__.interconnect();if(!controlPort_Clock100MHz__.interconnect.empty()) controlPort_Clock100MHz__.interconnect();if(!controlPort_AMBAPVBus__.interconnect.empty()) controlPort_AMBAPVBus__.interconnect();if(!controlPort_Clock1Hz__.interconnect.empty()) controlPort_Clock1Hz__.interconnect();if(!controlPort_BusDecoder__.interconnect.empty()) controlPort_BusDecoder__.interconnect();};
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::disconnect()
{{if(!controlPort_Core__.disconnect.empty()) controlPort_Core__.disconnect();if(!controlPort_Clock100MHz__.disconnect.empty()) controlPort_Clock100MHz__.disconnect();if(!controlPort_AMBAPVBus__.disconnect.empty()) controlPort_AMBAPVBus__.disconnect();if(!controlPort_Clock1Hz__.disconnect.empty()) controlPort_Clock1Hz__.disconnect();if(!controlPort_BusDecoder__.disconnect.empty()) controlPort_BusDecoder__.disconnect();};
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::update()
{{if(!controlPort_Core__.update.empty()) controlPort_Core__.update();if(!controlPort_Clock100MHz__.update.empty()) controlPort_Clock100MHz__.update();if(!controlPort_AMBAPVBus__.update.empty()) controlPort_AMBAPVBus__.update();if(!controlPort_Clock1Hz__.update.empty()) controlPort_Clock1Hz__.update();if(!controlPort_BusDecoder__.update.empty()) controlPort_BusDecoder__.update();};
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::communicate()
{{if(!controlPort_Core__.communicate.empty()) controlPort_Core__.communicate();if(!controlPort_Clock100MHz__.communicate.empty()) controlPort_Clock100MHz__.communicate();if(!controlPort_AMBAPVBus__.communicate.empty()) controlPort_AMBAPVBus__.communicate();if(!controlPort_Clock1Hz__.communicate.empty()) controlPort_Clock1Hz__.communicate();if(!controlPort_BusDecoder__.communicate.empty()) controlPort_BusDecoder__.communicate();};
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::traceEndOfCycle()
{{if(!controlPort_Core__.traceEndOfCycle.empty()) controlPort_Core__.traceEndOfCycle();if(!controlPort_Clock100MHz__.traceEndOfCycle.empty()) controlPort_Clock100MHz__.traceEndOfCycle();if(!controlPort_AMBAPVBus__.traceEndOfCycle.empty()) controlPort_AMBAPVBus__.traceEndOfCycle();if(!controlPort_Clock1Hz__.traceEndOfCycle.empty()) controlPort_Clock1Hz__.traceEndOfCycle();if(!controlPort_BusDecoder__.traceEndOfCycle.empty()) controlPort_BusDecoder__.traceEndOfCycle();};
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::loadApplicationFile(const std::string& filename)
{{if(!controlPort_Core__.loadApplicationFile.empty()) controlPort_Core__.loadApplicationFile(filename);if(!controlPort_Clock100MHz__.loadApplicationFile.empty()) controlPort_Clock100MHz__.loadApplicationFile(filename);if(!controlPort_AMBAPVBus__.loadApplicationFile.empty()) controlPort_AMBAPVBus__.loadApplicationFile(filename);if(!controlPort_Clock1Hz__.loadApplicationFile.empty()) controlPort_Clock1Hz__.loadApplicationFile(filename);if(!controlPort_BusDecoder__.loadApplicationFile.empty()) controlPort_BusDecoder__.loadApplicationFile(filename);};
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::init()
{{if(!controlPort_Core__.init.empty()) controlPort_Core__.init();if(!controlPort_Clock100MHz__.init.empty()) controlPort_Clock100MHz__.init();if(!controlPort_AMBAPVBus__.init.empty()) controlPort_AMBAPVBus__.init();if(!controlPort_Clock1Hz__.init.empty()) controlPort_Clock1Hz__.init();if(!controlPort_BusDecoder__.init.empty()) controlPort_BusDecoder__.init();};
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::terminate()
{{if(!controlPort_Core__.terminate.empty()) controlPort_Core__.terminate();if(!controlPort_Clock100MHz__.terminate.empty()) controlPort_Clock100MHz__.terminate();if(!controlPort_AMBAPVBus__.terminate.empty()) controlPort_AMBAPVBus__.terminate();if(!controlPort_Clock1Hz__.terminate.empty()) controlPort_Clock1Hz__.terminate();if(!controlPort_BusDecoder__.terminate.empty()) controlPort_BusDecoder__.terminate();};
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::reset(int level)
{{if(!controlPort_Core__.reset.empty()) controlPort_Core__.reset(level);if(!controlPort_Clock100MHz__.reset.empty()) controlPort_Clock100MHz__.reset(level);if(!controlPort_AMBAPVBus__.reset.empty()) controlPort_AMBAPVBus__.reset(level);if(!controlPort_Clock1Hz__.reset.empty()) controlPort_Clock1Hz__.reset(level);if(!controlPort_BusDecoder__.reset.empty()) controlPort_BusDecoder__.reset(level);};
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::reset(int level, int /*argc*/, char** /*argv*/)
{
	reset(level);

}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { bool 
Component__Cortex::save(MxODataStream& os)
{{if(!controlPort_Core__.save.empty()) controlPort_Core__.save(os);if(!controlPort_Clock100MHz__.save.empty()) controlPort_Clock100MHz__.save(os);if(!controlPort_AMBAPVBus__.save.empty()) controlPort_AMBAPVBus__.save(os);if(!controlPort_Clock1Hz__.save.empty()) controlPort_Clock1Hz__.save(os);if(!controlPort_BusDecoder__.save.empty()) controlPort_BusDecoder__.save(os);};return true;
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { bool 
Component__Cortex::restore(MxIDataStream& is)
{{if(!controlPort_Core__.restore.empty()) controlPort_Core__.restore(is);if(!controlPort_Clock100MHz__.restore.empty()) controlPort_Clock100MHz__.restore(is);if(!controlPort_AMBAPVBus__.restore.empty()) controlPort_AMBAPVBus__.restore(is);if(!controlPort_Clock1Hz__.restore.empty()) controlPort_Clock1Hz__.restore(is);if(!controlPort_BusDecoder__.restore.empty()) controlPort_BusDecoder__.restore(is);};return true;
}
}

#line 1 "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj1/sc/sgc/Cortex-M3.lisa"
namespace Cortex_NMS { void 
Component__Cortex::step()
{{if(!controlPort_Core__.step.empty()) controlPort_Core__.step();if(!controlPort_Clock100MHz__.step.empty()) controlPort_Clock100MHz__.step();if(!controlPort_AMBAPVBus__.step.empty()) controlPort_AMBAPVBus__.step();if(!controlPort_Clock1Hz__.step.empty()) controlPort_Clock1Hz__.step();if(!controlPort_BusDecoder__.step.empty()) controlPort_BusDecoder__.step();};
}
}

#line 173 "./Linux-Release-GCC-4.1/gen/Comp_NonDSO.cpp"

// ------------------------------------------------------------------------------
// implementation of class Component__Cortex
// ------------------------------------------------------------------------------

namespace Cortex_NMS {

Component__Cortex::Component__Cortex(const char * instName, sg::SimulationContext* simulationContext, const sg::Params & params):
    SystemGenComponent(instName, simulationContext, params)



	,cadiParameterProxy_Clock100MHz_of_ClockDivider_to_Cortex__(0)
	,cadiParameterProxy_AMBAPVBus_of_PVBus2AMBAPV_to_Cortex__(0)

{
    // initialize properties__
	properties__["component_name"] = "";
	properties__["component_type"] = "System";
	properties__["debugger_name"] = "";
	properties__["debugger_start_command"] = "";
	properties__["default_view"] = "auto";
	properties__["description"] = "";
	properties__["documentation_file"] = "";
	properties__["dso_safe"] = "1";
	properties__["executes_software"] = "0";
	properties__["expose_extern_sub_component_cadi"] = "1";
	properties__["factory_namespace"] = "";
	properties__["has_cadi"] = "1";
	properties__["has_implicit_clk_in"] = "1";
	properties__["hidden"] = "0";
	properties__["icon_file"] = "";
	properties__["ip_provider"] = "";
	properties__["is_single_stepped"] = "0";
	properties__["license_feature"] = "";
	properties__["loadfile_extension"] = "";
	properties__["save_restore"] = "0";
	properties__["small_icon_file"] = "";
	properties__["variant"] = "";
	properties__["version"] = "1.0";

    // initialize parameter info
    {
        sg::ComponentFactory *factory = Cortex_GetFactory();

        sg::TargetInfo *targetInfo = factory->getTargetInfo(""); // empty string means 'this' component

        if(targetInfo) // if we have no target info we also have no parameters towards CADI interfaces
        {
            // get parameter infos
            for(unsigned int i = 0; i < targetInfo->parameter_count; i++)
            {
                parameterId2parameterName__[targetInfo->parameter_info[i].id] = targetInfo->parameter_info[i].name;
                parameterInfos__.push_back((targetInfo->parameter_info)[i]);
            }
        }

        factory->dereference();
    }

    // create subcomponents
	{
		sg::ComponentFactory *ClockDivider_factory = ClockDivider_GetFactory();
		sg::ComponentFactory *MasterClock_factory = MasterClock_GetFactory();
		sg::ComponentFactory *ARMCortexM3CT_factory = ARMCortexM3CT_GetFactory();
		sg::ComponentFactory *PVBusDecoder_factory = PVBusDecoder_GetFactory();
		sg::ComponentFactory *PVBus2AMBAPV_factory = PVBus2AMBAPV_GetFactory();
		{
			sg::Params params_Core__ = params.getParamsFor("Core");
			add(Core = ARMCortexM3CT_factory->instantiate("Core", simulationContext, params_Core__));
		}
		{
			sg::Params params_Clock100MHz__ = params.getParamsFor("Clock100MHz");
			params_Clock100MHz__["mul"] = MxU64CONST(0x0000000005F5E100);
			add(Clock100MHz = ClockDivider_factory->instantiate("Clock100MHz", simulationContext, params_Clock100MHz__));
		}
		{
			sg::Params params_AMBAPVBus__ = params.getParamsFor("AMBAPVBus");
			params_AMBAPVBus__["size"] = MxU64CONST(0x00000000F0000000);
			AMBAPVBus = dynamic_cast<Component__PVBus2AMBAPV*>(PVBus2AMBAPV_factory->instantiate("AMBAPVBus", simulationContext, params_AMBAPVBus__));
			assert(AMBAPVBus);
			add(AMBAPVBus);
		}
		{
			sg::Params params_Clock1Hz__ = params.getParamsFor("Clock1Hz");
			add(Clock1Hz = MasterClock_factory->instantiate("Clock1Hz", simulationContext, params_Clock1Hz__));
		}
		{
			sg::Params params_BusDecoder__ = params.getParamsFor("BusDecoder");
			add(BusDecoder = PVBusDecoder_factory->instantiate("BusDecoder", simulationContext, params_BusDecoder__));
		}
		ClockDivider_factory->dereference();
		MasterClock_factory->dereference();
		ARMCortexM3CT_factory->dereference();
		PVBusDecoder_factory->dereference();
		PVBus2AMBAPV_factory->dereference();
	}


    // bind local behaviors to this->control_port
    bind_method(control_port, configure, &Component__Cortex::control_port__configure, this);
    bind_method(control_port, init, &Component__Cortex::init, this);
    bind_method(control_port, interconnect, &Component__Cortex::interconnect, this);
//  bind_method(control_port, postConnect, &Component__Cortex::postConnect, this);
    bind_method(control_port, reset, &Component__Cortex::control_port__reset, this);
    bind_method(control_port, loadApplicationFile, &Component__Cortex::loadApplicationFile, this);
    bind_method(control_port, disconnect, &Component__Cortex::disconnect, this);
    bind_method(control_port, terminate, &Component__Cortex::control_port__terminate, this);
    bind_method(control_port, populateCADIMap, &Component__Cortex::control_port__populateCADIMap, this);
//  bind_method(control_port, refresh, &Component__Cortex::refresh, this);
    bind_method(control_port, step, &Component__Cortex::step, this);
    bind_method(control_port, update, &Component__Cortex::update, this);
    bind_method(control_port, communicate, &Component__Cortex::communicate, this);
    bind_method(control_port, getProperty, &Component__Cortex::control_port__getProperty, this);
    bind_method(control_port, traceEndOfCycle, &Component__Cortex::traceEndOfCycle, this);
    bind_method(control_port, bypass, &Component__Cortex::control_port__bypass, this);
    bind_method(control_port, run, &Component__Cortex::control_port__run, this);
    bind_method(control_port, stop, &Component__Cortex::control_port__stop, this);
    bind_method(control_port, idle, &Component__Cortex::control_port__idle, this);
    bind_method(control_port, quit, &Component__Cortex::control_port__quit, this);
    bind_method(control_port, setSimulationEngine, &Component__Cortex::control_port__setSimulationEngine, this);
    bind_method(control_port, message, &Component__Cortex::control_port__message, this);
    bind_method(control_port, callSimEngine, &Component__Cortex::control_port__callSimEngine, this);

    // avoid the automatic calling of the methods through the framework
    control_port.configure.setLocalOnly(true);
    control_port.init.setLocalOnly(true);
    control_port.interconnect.setLocalOnly(true);
//  control_port.postConnect.setLocalOnly(true);
    control_port.reset.setLocalOnly(true);
    control_port.loadApplicationFile.setLocalOnly(true);
    control_port.disconnect.setLocalOnly(true);
    control_port.terminate.setLocalOnly(true);
    control_port.save.setLocalOnly(true);
    control_port.restore.setLocalOnly(true);
    control_port.populateCADIMap.setLocalOnly(true);
//  control_port.refresh.setLocalOnly(true);
    control_port.step.setLocalOnly(true);
    control_port.update.setLocalOnly(true);
    control_port.communicate.setLocalOnly(true);
    control_port.getProperty.setLocalOnly(true);
    control_port.traceEndOfCycle.setLocalOnly(true);
//  control_port.bypass.setLocalOnly(true);
//  control_port.run.setLocalOnly(true);
//  control_port.stop.setLocalOnly(true);
//  control_port.idle.setLocalOnly(true); // broadcast ports don't have setLocalOnly
//  control_port.quit.setLocalOnly(true);
//  control_port.setSimulationEngine.setLocalOnly(true);

    // bind cadiPort behaviors
    bind_method(cadiPort__, GetParameters, &Component__Cortex::cadiPort__GetParameters, this);
    bind_method(cadiPort__, GetParameterInfo, &Component__Cortex::cadiPort__GetParameterInfo, this);
    bind_method(cadiPort__, GetProperty, &Component__Cortex::cadiPort__GetProperty, this);
    bind_method(cadiPort__, LoadApplicationFile, &Component__Cortex::cadiPort__LoadApplicationFile, this);
    bind_method(cadiPort__, GetApplicationsAndCommandLineParams, &Component__Cortex::cadiPort__GetApplicationsAndCommandLineParams, this);

    // connect control ports for subcomponents to subcomponents
	controlPort_Core__.connectTo(Core->findPort("$control"));
	controlPort_Clock100MHz__.connectTo(Clock100MHz->findPort("$control"));
	controlPort_AMBAPVBus__.connectTo(AMBAPVBus->findPort("$control"));
	controlPort_Clock1Hz__.connectTo(Clock1Hz->findPort("$control"));
	controlPort_BusDecoder__.connectTo(BusDecoder->findPort("$control"));



    // resource initialization code
    reset_resources__();

    // bind behaviors to abstract ports


    // add abstract ports
	publishMasterPort("amba_pv_m", amba_pv_m);
	amba_pv_m.SetName__("amba_pv_m");


    // wire up static connection map
	AMBAPVBus->findPort("amba_pv_m").connectTo(amba_pv_m);
	Clock1Hz->findPort("clk_out").connectTo(Clock100MHz->findPort("clk_in"));
	Cortex__Builtin__AddressablePortProtocol tmp__; // temporary addressable port control port
	tmp__.setName("tmp_addressmap_control");
	tmp__.setParent(this);	tmp__.connectTo(BusDecoder->findPort("pvbus_m_range"));
	tmp__.mapRange(MxU64CONST(0x00000000), MxU64CONST(0x5FFFFFFF), MxU64CONST(0x00000000), MxU64CONST(0x5FFFFFFF))->connectTo(AMBAPVBus->findPort("pvbus_s"));
	tmp__.disconnectFrom(BusDecoder->findPort("pvbus_m_range"));
	Clock100MHz->findPort("clk_out").connectTo(Core->findPort("clk_in"));
	Core->findPort("pvbus_m").connectTo(BusDecoder->findPort("pvbus_s"));


    // init profiling

    // init resources


    // run the parameter write access functions for all of the component's parameters
    for (size_t i = 0; i < parameterInfos__.size(); ++i)
    {
        std::string paramName = parameterInfos__[i].name;

        switch (parameterInfos__[i].dataType)
        {
        case eslapi::CADI_PARAM_STRING:
            {
                std::string data = GetParameterValue(params, paramName, parameterInfos__[i].defaultString);
                parameter_write_string_func(paramNameToParamAccessFuncID(paramName), data);
            }
            break;
        case eslapi::CADI_PARAM_BOOL:
        case eslapi::CADI_PARAM_INT:
            {
                int64_t data = GetParameterValue(params, paramName, parameterInfos__[i].defaultValue, parameterInfos__[i].minValue, parameterInfos__[i].maxValue);
                parameter_write_func(paramNameToParamAccessFuncID(paramName), &data);
            }
            break;
        default:
            break;
        }
    }
}


Component__Cortex::~Component__Cortex()
{
}

void Component__Cortex::control_port__configure(const sg::Params& params)
{
	if(controlPort_Core__.configure.implemented()) controlPort_Core__.configure(params.getParamsFor("Core"));
	if(controlPort_Clock100MHz__.configure.implemented()) controlPort_Clock100MHz__.configure(params.getParamsFor("Clock100MHz"));
	if(controlPort_AMBAPVBus__.configure.implemented()) controlPort_AMBAPVBus__.configure(params.getParamsFor("AMBAPVBus"));
	if(controlPort_Clock1Hz__.configure.implemented()) controlPort_Clock1Hz__.configure(params.getParamsFor("Clock1Hz"));
	if(controlPort_BusDecoder__.configure.implemented()) controlPort_BusDecoder__.configure(params.getParamsFor("BusDecoder"));


    assert(simulationContext__->getSimulationEngine());
    cadi__ = new Component__Cortex_CADI(this, simulationContext__->getSimulationEngine());

    // forward certain calls from CADI interface to this component
    cadi__->GetCADIPort().connectTo(cadiPort__);

    

    std::map< std::string, eslapi::CAInterface* > tempMap;
    control_port__populateCADIMap(tempMap, ""); // precompute mxdi map

	cadi__->EnableSubComponentCADIImport();


}

void Component__Cortex::control_port__populateCADIMap(std::map< std::string, eslapi::CAInterface* >&output_map, std::string const & base_prefix)
{
    if (componentName2CADI__.empty())
    {
        componentName2CADI__[getName()] = static_cast<eslapi::CADI*>(cadi__);
        std::string prefix = getName() + ".";

		{
			std::map< std::string, eslapi::CAInterface* > compMap;
			if (controlPort_Core__.populateCADIMap.implemented())
			{
				controlPort_Core__.populateCADIMap(compMap, "");
			}
			insertCADIMap__(prefix, compMap);
		}
		{
			std::map< std::string, eslapi::CAInterface* > compMap;
			if (controlPort_Clock100MHz__.populateCADIMap.implemented())
			{
				controlPort_Clock100MHz__.populateCADIMap(compMap, "");
			}
			insertCADIMap__(prefix, compMap);
			eslapi::CADI *cadi = obtainCADI__("Clock100MHz", compMap);
			if (cadi != NULL)
			{
				cadiParameterProxy_Clock100MHz_of_ClockDivider_to_Cortex__ = new CADIParameterProxy(cadi, &parameterFilter_Clock100MHz_of_ClockDivider_to_Cortex__);
			}
		}
		{
			std::map< std::string, eslapi::CAInterface* > compMap;
			if (controlPort_AMBAPVBus__.populateCADIMap.implemented())
			{
				controlPort_AMBAPVBus__.populateCADIMap(compMap, "");
			}
			insertCADIMap__(prefix, compMap);
			eslapi::CADI *cadi = obtainCADI__("AMBAPVBus", compMap);
			if (cadi != NULL)
			{
				cadiParameterProxy_AMBAPVBus_of_PVBus2AMBAPV_to_Cortex__ = new CADIParameterProxy(cadi, &parameterFilter_AMBAPVBus_of_PVBus2AMBAPV_to_Cortex__);
			}
		}
		{
			std::map< std::string, eslapi::CAInterface* > compMap;
			if (controlPort_Clock1Hz__.populateCADIMap.implemented())
			{
				controlPort_Clock1Hz__.populateCADIMap(compMap, "");
			}
			insertCADIMap__(prefix, compMap);
		}
		{
			std::map< std::string, eslapi::CAInterface* > compMap;
			if (controlPort_BusDecoder__.populateCADIMap.implemented())
			{
				controlPort_BusDecoder__.populateCADIMap(compMap, "");
			}
			insertCADIMap__(prefix, compMap);
		}

    }
    // Copy the local map into the given map with the requested prefix.
    for (std::map<std::string,eslapi::CAInterface*>::iterator it = componentName2CADI__.begin(); it != componentName2CADI__.end(); ++it)
    {
        output_map.insert(std::make_pair(base_prefix + it->first, it->second));
    }
}

eslapi::CADI* Component__Cortex::obtainCADI__(const std::string &subcomp, const std::map< std::string, eslapi::CAInterface* > &componentName2CADI) const
{
    std::map< std::string, eslapi::CAInterface* >::const_iterator it = componentName2CADI.find(subcomp);
    if (it != componentName2CADI.end())
    {
        eslapi::CAInterface *cai = it->second;
        if (cai != NULL)
        {
            cai = cai->ObtainInterface(eslapi::CADI::IFNAME(), 0, 0);
            if (cai != NULL)
            {
                return static_cast<eslapi::CADI*>(cai);
            }
        }
    }
    return NULL;
}

void Component__Cortex::insertCADIMap__(std::string prefix, std::map< std::string, eslapi::CAInterface* > &componentName2CADI)
{
    for (std::map<std::string, eslapi::CAInterface*>::iterator it = componentName2CADI.begin(); it != componentName2CADI.end(); it++)
    {
        // put prefix in front of all entries
        componentName2CADI__[prefix + it->first] = it->second;
    }
}


std::string Component__Cortex::control_port__getProperty(const std::string& propname)
{
    if(properties__.find(propname) != properties__.end())
    {
        return properties__[propname];
    }
    else
        return ""; // unknown property
}


std::string Component__Cortex::control_port__bypass(const std::string&)
{
    return "";
}


void Component__Cortex::control_port__run()
{
}


void Component__Cortex::control_port__stop()
{
}


void Component__Cortex::control_port__idle()
{
}


void Component__Cortex::control_port__quit()
{
}


void Component__Cortex::control_port__setSimulationEngine(SimulationEngine*)
{
}


void Component__Cortex::control_port__message(const std::string &msg, sg::message::MessageType msgType)
{
}


std::string Component__Cortex::control_port__callSimEngine(const std::string &)
{
    return "";
}


void Component__Cortex::control_port__reset(int level)
{
    // restore the resources' reset values before executing 'reset'
    reset_resources__();
    reset(level);
}


void Component__Cortex::control_port__terminate()
{
    // the CADI was created before 'init', therefore we free it after 'terminate'
    terminate();
    freeCADIResources__();
}


void Component__Cortex::freeCADIResources__()
{
    // free CADI parameter proxies
	delete cadiParameterProxy_Clock100MHz_of_ClockDivider_to_Cortex__;
	cadiParameterProxy_Clock100MHz_of_ClockDivider_to_Cortex__ = 0;
	delete cadiParameterProxy_AMBAPVBus_of_PVBus2AMBAPV_to_Cortex__;
	cadiParameterProxy_AMBAPVBus_of_PVBus2AMBAPV_to_Cortex__ = 0;


    // free CADI interface
    delete cadi__;
    cadi__ = 0;
}


// CADI Port implementations
eslapi::CADIReturn_t Component__Cortex::cadiPort__GetParameters(MxU32 startIndex, MxU32 desiredNumOfParams, MxU32 *actualNumOfParams, eslapi::CADIParameterInfo_t *params)
{
    // check arguments
    if(actualNumOfParams == 0)
        return eslapi::CADI_STATUS_IllegalArgument;
    *actualNumOfParams = 0;
    if(params == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    // collect parameters
    size_t i = 0;
    for (; (i < desiredNumOfParams) && ((startIndex + i) < parameterInfos__.size()); ++i)
    {
        params[i] = parameterInfos__[startIndex + i];
    }
    *actualNumOfParams = (MxU32)i;

    return eslapi::CADI_STATUS_OK;
}

eslapi::CADIReturn_t Component__Cortex::cadiPort__GetParameterInfo(const std::string &parameterName, eslapi::CADIParameterInfo_t* param)
{
    if(param == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    for (size_t i = 0; i < parameterInfos__.size(); ++i)
    {
        if (!strcmp(parameterInfos__[i].name, parameterName.c_str()))
        {
            *param = parameterInfos__[i];

            return eslapi::CADI_STATUS_OK;
        }
    }

    return eslapi::CADI_STATUS_GeneralError;
}


bool Component__Cortex::ForwardParameterValueToSubcomponent(CADIParameterProxy *proxy, const char *param_name, int64_t intVal, const char *strVal)
{
    if (!proxy)
        return false;

    // we need the parameter's CADI id in order to create an eslapi::CADIParameterValue_t structure
    // therefore, we first retrieve its eslapi::CADIParameterInfo_t meta-data
    eslapi::CADIParameterInfo_t paramInfo;
    if (proxy->CADIGetParameterInfo(param_name, &paramInfo) != eslapi::CADI_STATUS_OK)
        return false;

    eslapi::CADIParameterValue_t paramVal(paramInfo.id, paramInfo.dataType, intVal, strVal);
    eslapi::CADIFactoryErrorMessage_t error;
    if (proxy->CADISetParameters(1, &paramVal, &error) != eslapi::CADI_STATUS_OK)
        return false;

    return true;
}


sg::accessfunc::AccessFuncResult Component__Cortex::parameter_read_func(uint32_t id, int64_t *data)
{
    if (data == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    switch (id)
    {

        default:
            printf("error: Component__Cortex::parameter_read_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

sg::accessfunc::AccessFuncResult Component__Cortex::parameter_read_string_func(uint32_t id, std::string &data)
{
    switch (id)
    {

        default:
            printf("error: Component__Cortex::parameter_read_string_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

sg::accessfunc::AccessFuncResult Component__Cortex::parameter_write_func(uint32_t id, const int64_t *data)
{
    if (data == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    switch (id)
    {

        default:
            printf("error: Component__Cortex::parameter_write_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

sg::accessfunc::AccessFuncResult Component__Cortex::parameter_write_string_func(uint32_t id, const std::string &data)
{
    switch (id)
    {

        default:
            printf("error: Component__Cortex::parameter_write_string_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

void Component__Cortex::cadiPort__LoadApplicationFile(const std::string& filename)
{
    loadApplicationFile(filename);
    applications2params[filename] = "";
}

void Component__Cortex::cadiPort__GetApplicationsAndCommandLineParams(std::map<std::string, std::string>&applications2params_)
{
    applications2params_ = applications2params;
}

eslapi::CADIReturn_t Component__Cortex::cadiPort__GetProperty(const std::string& propertyName, std::string &value)
{
    if(properties__.find(propertyName) != properties__.end())
    {
        value = properties__[propertyName];
        return eslapi::CADI_STATUS_OK;
    }
    else
    {
        value = "";
        return eslapi::CADI_STATUS_GeneralError;
    }
}

// functions to stop and lock the simulator
// we only expose the simHalt() function in the documentation for the moment

void Component__Cortex::simHalt()
{
    cadi__->StopSimulation();
}


// start simulation from the inside
// (useful from visualisation components which can execute code while the
// simulation is stopped, like key events)
void Component__Cortex::simRun()
{
    cadi__->CADIExecContinue();
}


// return true if simulation is running
// (useful from visualisation components which can execute code while the
// simulation is stopped, like key events)
bool Component__Cortex::simIsRunning()
{
    uint32_t mode = eslapi::CADI_EXECMODE_Stop;
    cadi__->CADIExecGetMode(&mode);
    return mode != eslapi::CADI_EXECMODE_Stop;
}


void Component__Cortex::simShutdown()
{
    cadiPort__.simShutdown();
}

void Component__Cortex::simReset(uint32_t level)
{
    cadi__->CADIExecReset(level);
}

uint32_t Component__Cortex::paramNameToParamAccessFuncID(const std::string &name)
{
    uint32_t id = 0;
    if (name == "") id = 0xffffffff;

    return id;
}

void Component__Cortex::reset_resources__()
{
    // resource initialization code

}


} // Cortex_NMS
#line 164 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::build_amba_pv_extension(const pv::Transaction* tx, amba_pv::amba_pv_extension* ex)
{
 const pv::MemoryAttributes* attr = tx->getMemoryAttributes();
 if (attr != 0)
 {
 ex->set_id(attr->getMasterID());

 
 
 
 
 
 
 

 
 ex->set_bufferable(attr->isOuterBufferable());
 ex->set_modifiable(attr->isOuterCacheable());
 ex->set_read_allocate(attr->isOuterReadAllocatable());
 ex->set_write_allocate(attr->isOuterWriteAllocatable());
 }

 
 ex->set_privileged(tx->isPrivileged());
 ex->set_non_secure(tx->isNonSecure());
 ex->set_instruction(tx->isInstruction());

 
 ex->set_exclusive(tx->isExclusive());
 ex->set_locked(tx->isLocked()); 

 
 if ((! tx->getPayload()) || (! tx->getPayload()->isPrefetchOnly()))
 {
 ex->set_size(tx->getAccessByteWidth());
 ex->set_length(tx->getTransactionByteSize() / tx->getAccessByteWidth());
 }
 
}
}

#line 206 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { bool 
Component__PVBus2AMBAPV::send_tlm_dmi_request(pv::Transaction* tx, tlm::tlm_command command)
{
 amba_pv::amba_pv_transaction trans;
 amba_pv::amba_pv_extension ex(1, NULL);
 tlm::tlm_dmi dmi_data;
 bool dmi_ok = false;

 
 trans.set_command(command);
 trans.set_address(tx->getAddress());
 
 build_amba_pv_extension(tx, &ex);

 
 trans.set_extension(&ex);
 try
 {
 dmi_ok = amba_pv_m.get_direct_mem_ptr(0, trans, dmi_data);
 }
 catch(...)
 {
 trans.clear_extension(&ex);
 throw;
 }
 trans.clear_extension(&ex);

 pv::bus_range_t original_range = pv::range_begin_end_incl(dmi_data.get_start_address(), dmi_data.get_end_address());

 
 
 
 
 
 pv::bus_range_t inner_range = original_range;
 inner_range.reduce_to_contained_power_of_two_granule(4096);
 pv::bus_range_t effective_range;
 if (inner_range.contains(tx->getAddress()))
 {
 
 
 effective_range = inner_range;
 }
 else
 {
 
 
 dmi_ok = false;
 effective_range = pv::range_begin_end_incl(tx->getAddress(), tx->getAddress());
 effective_range.expand_to_cover_power_of_two_granule(4096);
 dmi_data.allow_read_write();
 }
 unsigned char *dmi_ptr = dmi_ok ? dmi_data.get_dmi_ptr() : 0;

 
 if (effective_range.full() || (effective_range.size() > max_size))
 effective_range.end_incl = effective_range.begin + (max_size & ~0xfff);

 
 if ((effective_range.begin > dmi_data.get_start_address()) && (dmi_ptr != 0))
 dmi_ptr += (effective_range.begin - dmi_data.get_start_address());
 
 
 if (dmi_data.is_read_allowed())
 {
 pv::PrefetchRange<pv::AccessRead> range (dmi_ptr, effective_range);
 tx->getPayload()->setPrefetchRange(range);
 }
 if (dmi_data.is_write_allowed())
 {
 pv::PrefetchRange<pv::AccessWrite> range(dmi_ptr, effective_range);
 tx->getPayload()->setPrefetchRange(range);
 }
 if (!dmi_ok)
 {
 
 
 if (((command == tlm::TLM_READ_COMMAND) && dmi_data.is_write_allowed()) ||
 ((command == tlm::TLM_WRITE_COMMAND) && dmi_data.is_read_allowed()))
 tx->getPayload()->setPrefetchIsDeniedForOtherAccessHint();
 }
 
 if (dmi_ok)
 {
 
 if (dmi_data.is_read_write_allowed())
 {
 
 if (tx->isNonSecure())
 {
 control_ns.setAccess(effective_range.begin, effective_range.end_incl + 1, pv::ACCESSTYPE_RW, pv::ACCESSMODE_MEMORY);
 control_ns.provideReadWriteStorage(effective_range.begin, effective_range.end_incl + 1, dmi_ptr);
 }
 else
 {
 control_s.setAccess(effective_range.begin, effective_range.end_incl + 1, pv::ACCESSTYPE_RW, pv::ACCESSMODE_MEMORY);
 control_s.provideReadWriteStorage(effective_range.begin, effective_range.end_incl + 1, dmi_ptr);
 }
 }
 else if (dmi_data.is_read_allowed())
 {
 
 if (tx->isNonSecure())
 {
 control_ns.setAccess(effective_range.begin, effective_range.end_incl + 1, pv::ACCESSTYPE_READ, pv::ACCESSMODE_MEMORY);
 control_ns.provideReadStorage(effective_range.begin, effective_range.end_incl + 1, dmi_ptr);
 }
 else
 {
 control_s.setAccess(effective_range.begin, effective_range.end_incl + 1, pv::ACCESSTYPE_READ, pv::ACCESSMODE_MEMORY);
 control_s.provideReadStorage(effective_range.begin, effective_range.end_incl + 1, dmi_ptr);
 }
 } 
 else if (dmi_data.is_write_allowed())
 {
 
 if (tx->isNonSecure())
 {
 control_ns.setAccess(effective_range.begin, effective_range.end_incl + 1, pv::ACCESSTYPE_WRITE, pv::ACCESSMODE_MEMORY);
 control_ns.provideWriteStorage(effective_range.begin, effective_range.end_incl + 1, dmi_ptr);
 }
 else
 {
 control_s.setAccess(effective_range.begin, effective_range.end_incl + 1, pv::ACCESSTYPE_WRITE, pv::ACCESSMODE_MEMORY);
 control_s.provideWriteStorage(effective_range.begin, effective_range.end_incl + 1, dmi_ptr);
 }
 } 
 }

 return dmi_ok;
 
}
}

#line 340 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { pv::Tx_Result 
Component__PVBus2AMBAPV::send_tlm_transaction(pv::Transaction* tx, tlm::tlm_command command, bool debug)
{
 amba_pv::amba_pv_transaction trans;
 amba_pv::amba_pv_extension ex(tx->getAccessByteWidth(), NULL);
 pv::Tx_Result result;

 
 trans.set_command(command);
 trans.set_address(tx->getAddress());
 trans.set_data_ptr((unsigned char*)tx->referenceDataValue());
 trans.set_data_length(tx->getTransactionByteSize());
 trans.set_streaming_width(trans.get_data_length()); 

 
 build_amba_pv_extension(tx, &ex);

 
 trans.set_extension(&ex);
 try
 {
 if (debug)
 {
 if (amba_pv_m.transport_dbg(0, trans) != trans.get_data_length())
 {
 result = tx->generateAbort();
 }
 }
 else
 {
 
 sc_core::sc_time t(getCurrentLocalTime(), sc_core::SC_SEC);

 amba_pv_m.b_transport(0, trans, t);

 
 setCurrentLocalTime(t.to_seconds());
 }
 }
 catch(...)
 {
 trans.clear_extension(&ex);
 throw;
 }
 trans.clear_extension(&ex);

 
 if (debug)
 return result;
 switch(ex.get_resp())
 {
 case amba_pv::AMBA_PV_SLVERR: return tx->generateSlaveAbort();
 case amba_pv::AMBA_PV_DECERR: return tx->generateDecodeAbort();

 case amba_pv::AMBA_PV_OKAY:
 if (ex.is_exclusive())
 return tx->generateExclusiveAbort();
 break;

 case amba_pv::AMBA_PV_EXOKAY:
 break;
 }

 
 if (!debug && trans.is_dmi_allowed())
 {
 trans.set_address(tx->getAddress());
 trans.set_extension(&ex);
 try
 {
 get_direct_mem_ptr(trans, ex.is_non_secure());
 }
 catch(...)
 {
 trans.clear_extension(&ex);
 throw;
 }
 trans.clear_extension(&ex);
 }

 return result;
 
}
}

#line 423 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::get_direct_mem_ptr(amba_pv::amba_pv_transaction& trans, bool non_secure)
{
 tlm::tlm_dmi dmi;

 if (!amba_pv_m.get_direct_mem_ptr(0, trans, dmi))
 return;

 
 pv::bus_addr_t base, limit;
 pv::accessType access_type;

 
 base = (dmi.get_start_address() + 0xFFF) & ~pv::bus_addr_t(0xFFF);
 limit = (dmi.get_end_address() + 1) & ~pv::bus_addr_t(0xFFF);
 if (limit <= base)
 return;

 switch(dmi.get_granted_access())
 {
 case tlm::tlm_dmi::DMI_ACCESS_READ_WRITE:
 access_type = pv::ACCESSTYPE_RW;
 break;

 case tlm::tlm_dmi::DMI_ACCESS_READ:
 access_type = pv::ACCESSTYPE_READ;
 break;

 case tlm::tlm_dmi::DMI_ACCESS_WRITE:
 access_type = pv::ACCESSTYPE_WRITE;
 break;

 case tlm::tlm_dmi::DMI_ACCESS_NONE:
 default:
 return;
 }

 
 if (limit > (base + max_size))
 {
 limit = base + max_size;
 limit = (limit + 1) & ~pv::bus_addr_t(0xFFF);
 if (limit <= base)
 return;
 }

 
 unsigned char *dmi_ptr = dmi.get_dmi_ptr();

 if (base > dmi.get_start_address())
 dmi_ptr += (base - dmi.get_start_address());


 
 

 if (non_secure)
 {
 
 control_ns.setAccess(base, limit, access_type, pv::ACCESSMODE_MEMORY);

 if (dmi.is_read_write_allowed())
 control_ns.provideReadWriteStorage(base, limit, dmi_ptr);
 else if (dmi.is_write_allowed())
 control_ns.provideWriteStorage(base, limit, dmi_ptr);
 else
 control_ns.provideReadStorage(base, limit, dmi_ptr);
 }
 else
 {
 
 control_s.setAccess(base, limit, access_type, pv::ACCESSMODE_MEMORY);

 if (dmi.is_read_write_allowed())
 control_s.provideReadWriteStorage(base, limit, dmi_ptr);
 else if (dmi.is_write_allowed())
 control_s.provideWriteStorage(base, limit, dmi_ptr);
 else
 control_s.provideReadStorage(base, limit, dmi_ptr);
 }
 
}
}

#line 505 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::init()
{
 {if(!controlPort_bus_slave_s__.init.empty()) controlPort_bus_slave_s__.init();if(!controlPort_bus_slave_ns__.init.empty()) controlPort_bus_slave_ns__.init();if(!controlPort_tz_switch__.init.empty()) controlPort_tz_switch__.init();};

 pv::slave_config_t slave_config;

 if (!global_monitor)
 {
 slave_config.acceptExclusiveTransactions();
 }

 slave_config.acceptPrefetchOnly();

 control_s.configure(&slave_config);
 control_ns.configure(&slave_config);
 
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::interconnect()
{{if(!controlPort_bus_slave_s__.interconnect.empty()) controlPort_bus_slave_s__.interconnect();if(!controlPort_bus_slave_ns__.interconnect.empty()) controlPort_bus_slave_ns__.interconnect();if(!controlPort_tz_switch__.interconnect.empty()) controlPort_tz_switch__.interconnect();};
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::disconnect()
{{if(!controlPort_bus_slave_s__.disconnect.empty()) controlPort_bus_slave_s__.disconnect();if(!controlPort_bus_slave_ns__.disconnect.empty()) controlPort_bus_slave_ns__.disconnect();if(!controlPort_tz_switch__.disconnect.empty()) controlPort_tz_switch__.disconnect();};
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::update()
{{if(!controlPort_bus_slave_s__.update.empty()) controlPort_bus_slave_s__.update();if(!controlPort_bus_slave_ns__.update.empty()) controlPort_bus_slave_ns__.update();if(!controlPort_tz_switch__.update.empty()) controlPort_tz_switch__.update();};
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::communicate()
{{if(!controlPort_bus_slave_s__.communicate.empty()) controlPort_bus_slave_s__.communicate();if(!controlPort_bus_slave_ns__.communicate.empty()) controlPort_bus_slave_ns__.communicate();if(!controlPort_tz_switch__.communicate.empty()) controlPort_tz_switch__.communicate();};
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::traceEndOfCycle()
{{if(!controlPort_bus_slave_s__.traceEndOfCycle.empty()) controlPort_bus_slave_s__.traceEndOfCycle();if(!controlPort_bus_slave_ns__.traceEndOfCycle.empty()) controlPort_bus_slave_ns__.traceEndOfCycle();if(!controlPort_tz_switch__.traceEndOfCycle.empty()) controlPort_tz_switch__.traceEndOfCycle();};
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::loadApplicationFile(const std::string& filename)
{{if(!controlPort_bus_slave_s__.loadApplicationFile.empty()) controlPort_bus_slave_s__.loadApplicationFile(filename);if(!controlPort_bus_slave_ns__.loadApplicationFile.empty()) controlPort_bus_slave_ns__.loadApplicationFile(filename);if(!controlPort_tz_switch__.loadApplicationFile.empty()) controlPort_tz_switch__.loadApplicationFile(filename);};
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::terminate()
{{if(!controlPort_bus_slave_s__.terminate.empty()) controlPort_bus_slave_s__.terminate();if(!controlPort_bus_slave_ns__.terminate.empty()) controlPort_bus_slave_ns__.terminate();if(!controlPort_tz_switch__.terminate.empty()) controlPort_tz_switch__.terminate();};
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::reset(int level)
{{if(!controlPort_bus_slave_s__.reset.empty()) controlPort_bus_slave_s__.reset(level);if(!controlPort_bus_slave_ns__.reset.empty()) controlPort_bus_slave_ns__.reset(level);if(!controlPort_tz_switch__.reset.empty()) controlPort_tz_switch__.reset(level);};
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::reset(int level, int /*argc*/, char** /*argv*/)
{
	reset(level);

}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { bool 
Component__PVBus2AMBAPV::save(MxODataStream& os)
{{if(!controlPort_bus_slave_s__.save.empty()) controlPort_bus_slave_s__.save(os);if(!controlPort_bus_slave_ns__.save.empty()) controlPort_bus_slave_ns__.save(os);if(!controlPort_tz_switch__.save.empty()) controlPort_tz_switch__.save(os);};return true;
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { bool 
Component__PVBus2AMBAPV::restore(MxIDataStream& is)
{{if(!controlPort_bus_slave_s__.restore.empty()) controlPort_bus_slave_s__.restore(is);if(!controlPort_bus_slave_ns__.restore.empty()) controlPort_bus_slave_ns__.restore(is);if(!controlPort_tz_switch__.restore.empty()) controlPort_tz_switch__.restore(is);};return true;
}
}

#line 17 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::step()
{{if(!controlPort_bus_slave_s__.step.empty()) controlPort_bus_slave_s__.step();if(!controlPort_bus_slave_ns__.step.empty()) controlPort_bus_slave_ns__.step();if(!controlPort_tz_switch__.step.empty()) controlPort_tz_switch__.step();};
}
}

#line 58 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { void 
Component__PVBus2AMBAPV::abstract_port__amba_pv_m__invalidate_direct_mem_ptr(int socket_id, sc_dt::uint64 start_range, sc_dt::uint64 end_range)
{
 pv::bus_addr_t base, limit;

 
 base = start_range & ~pv::bus_addr_t(0xFFF);
 limit = (end_range | 0xFFF) + 1;
 assert(limit > base);
 if (limit > (base + max_size))
 limit = base + max_size;

 
 
 
 control_ns.setAccess(base, limit,
 pv::ACCESSTYPE_RW, pv::ACCESSMODE_DEVICE);

 control_s.setAccess(base, limit,
 pv::ACCESSTYPE_RW, pv::ACCESSMODE_DEVICE);
 
}
}

#line 86 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { pv::Tx_Result 
Component__PVBus2AMBAPV::abstract_port__device__read(pv::ReadTransaction tx)
{
 
 if (tx.getPayload() && tx.getPayload()->isPrefetchOnly())
 return send_tlm_dmi_request(&tx, tlm::TLM_READ_COMMAND) ? tx.readComplete() : tx.wontPrefetch();
 
 pv::Tx_Result result = send_tlm_transaction(&tx, tlm::TLM_READ_COMMAND, false);

 
 if (result.isUndefined())
 {
 result = tx.readComplete();

 if (tx.getBurstLength()>1)
 tx.allBeatsCompletedInOneOperation(result);
 }

 return result;
 
}
}

#line 107 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { pv::Tx_Result 
Component__PVBus2AMBAPV::abstract_port__device__write(pv::WriteTransaction tx)
{
 
 if (tx.getPayload() && tx.getPayload()->isPrefetchOnly())
 return send_tlm_dmi_request(&tx, tlm::TLM_WRITE_COMMAND) ? tx.writeComplete() : tx.wontPrefetch();
 
 pv::Tx_Result result = send_tlm_transaction(&tx, tlm::TLM_WRITE_COMMAND, false);

 
 if (result.isUndefined())
 {
 result = tx.writeComplete();

 if (tx.getBurstLength()>1)
 tx.allBeatsCompletedInOneOperation(result);
 }

 return result;
 
}
}

#line 128 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { pv::Tx_Result 
Component__PVBus2AMBAPV::abstract_port__device__debugRead(pv::ReadTransaction tx)
{
 pv::Tx_Result result = send_tlm_transaction(&tx, tlm::TLM_READ_COMMAND, true);

 
 if (result.isUndefined())
 {
 result = tx.readComplete();

 if (tx.getBurstLength()>1)
 tx.allBeatsCompletedInOneOperation(result);
 }

 return result;
 
}
}

#line 145 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/PVBus2AMBAPV.lisa"
namespace Cortex_NMS { pv::Tx_Result 
Component__PVBus2AMBAPV::abstract_port__device__debugWrite(pv::WriteTransaction tx)
{
 pv::Tx_Result result = send_tlm_transaction(&tx, tlm::TLM_WRITE_COMMAND, true);

 
 if (result.isUndefined())
 {
 result = tx.writeComplete();

 if (tx.getBurstLength()>1)
 tx.allBeatsCompletedInOneOperation(result);
 }

 return result;
 
}
}

#line 1368 "./Linux-Release-GCC-4.1/gen/Comp_NonDSO.cpp"

// ------------------------------------------------------------------------------
// implementation of class Component__PVBus2AMBAPV
// ------------------------------------------------------------------------------

namespace Cortex_NMS {

Component__PVBus2AMBAPV::Component__PVBus2AMBAPV(const char * instName, sg::SimulationContext* simulationContext, const sg::Params & params):
    SystemGenComponent(instName, simulationContext, params)

	,max_size(GetParameterValue(params, "size", MxS64CONST(0x1000000000000), MxS64CONST(0x8000000000000000), MxS64CONST(0x7fffffffffffffff)))
	,global_monitor(!!GetParameterValue(params, "global-monitor", MxS64CONST(0x0), MxS64CONST(0x8000000000000000), MxS64CONST(0x7fffffffffffffff)))


	,cadiParameterProxy_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV__(0)
	,cadiParameterProxy_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV__(0)

{
    // initialize properties__
	properties__["component_name"] = "";
	properties__["component_type"] = "Bus";
	properties__["debugger_name"] = "";
	properties__["debugger_start_command"] = "";
	properties__["default_view"] = "auto";
	properties__["description"] = "PVBus to AMBA-PV protocol converter";
	properties__["documentation_file"] = "../Docs/DUI0423P_fast_model_rm.pdf";
	properties__["dso_safe"] = "0";
	properties__["executes_software"] = "0";
	properties__["expose_extern_sub_component_cadi"] = "1";
	properties__["factory_namespace"] = "";
	properties__["has_cadi"] = "1";
	properties__["has_implicit_clk_in"] = "1";
	properties__["hidden"] = "0";
	properties__["icon_file"] = "";
	properties__["ip_provider"] = "";
	properties__["is_single_stepped"] = "0";
	properties__["license_feature"] = "";
	properties__["loadfile_extension"] = "";
	properties__["save_restore"] = "0";
	properties__["small_icon_file"] = "";
	properties__["variant"] = "";
	properties__["version"] = "8.2.72";

    // initialize parameter info
    {
        sg::ComponentFactory *factory = PVBus2AMBAPV_GetFactory();

        sg::TargetInfo *targetInfo = factory->getTargetInfo(""); // empty string means 'this' component

        if(targetInfo) // if we have no target info we also have no parameters towards CADI interfaces
        {
            // get parameter infos
            for(unsigned int i = 0; i < targetInfo->parameter_count; i++)
            {
                parameterId2parameterName__[targetInfo->parameter_info[i].id] = targetInfo->parameter_info[i].name;
                parameterInfos__.push_back((targetInfo->parameter_info)[i]);
            }
        }

        factory->dereference();
    }

    // create subcomponents
	{
		sg::ComponentFactory *PVBusSlave_factory = PVBusSlave_GetFactory();
		sg::ComponentFactory *TZSwitch_factory = TZSwitch_GetFactory();
		{
			sg::Params params_bus_slave_s__ = params.getParamsFor("bus_slave_s");
			params_bus_slave_s__["size"] = max_size;
			add(bus_slave_s = PVBusSlave_factory->instantiate("bus_slave_s", simulationContext, params_bus_slave_s__));
		}
		{
			sg::Params params_bus_slave_ns__ = params.getParamsFor("bus_slave_ns");
			params_bus_slave_ns__["size"] = max_size;
			add(bus_slave_ns = PVBusSlave_factory->instantiate("bus_slave_ns", simulationContext, params_bus_slave_ns__));
		}
		{
			sg::Params params_tz_switch__ = params.getParamsFor("tz_switch");
			tz_switch = dynamic_cast<Component__TZSwitch*>(TZSwitch_factory->instantiate("tz_switch", simulationContext, params_tz_switch__));
			assert(tz_switch);
			add(tz_switch);
		}
		PVBusSlave_factory->dereference();
		TZSwitch_factory->dereference();
	}


    // bind local behaviors to this->control_port
    bind_method(control_port, configure, &Component__PVBus2AMBAPV::control_port__configure, this);
    bind_method(control_port, init, &Component__PVBus2AMBAPV::init, this);
    bind_method(control_port, interconnect, &Component__PVBus2AMBAPV::interconnect, this);
//  bind_method(control_port, postConnect, &Component__PVBus2AMBAPV::postConnect, this);
    bind_method(control_port, reset, &Component__PVBus2AMBAPV::control_port__reset, this);
    bind_method(control_port, loadApplicationFile, &Component__PVBus2AMBAPV::loadApplicationFile, this);
    bind_method(control_port, disconnect, &Component__PVBus2AMBAPV::disconnect, this);
    bind_method(control_port, terminate, &Component__PVBus2AMBAPV::control_port__terminate, this);
    bind_method(control_port, populateCADIMap, &Component__PVBus2AMBAPV::control_port__populateCADIMap, this);
//  bind_method(control_port, refresh, &Component__PVBus2AMBAPV::refresh, this);
    bind_method(control_port, step, &Component__PVBus2AMBAPV::step, this);
    bind_method(control_port, update, &Component__PVBus2AMBAPV::update, this);
    bind_method(control_port, communicate, &Component__PVBus2AMBAPV::communicate, this);
    bind_method(control_port, getProperty, &Component__PVBus2AMBAPV::control_port__getProperty, this);
    bind_method(control_port, traceEndOfCycle, &Component__PVBus2AMBAPV::traceEndOfCycle, this);
    bind_method(control_port, bypass, &Component__PVBus2AMBAPV::control_port__bypass, this);
    bind_method(control_port, run, &Component__PVBus2AMBAPV::control_port__run, this);
    bind_method(control_port, stop, &Component__PVBus2AMBAPV::control_port__stop, this);
    bind_method(control_port, idle, &Component__PVBus2AMBAPV::control_port__idle, this);
    bind_method(control_port, quit, &Component__PVBus2AMBAPV::control_port__quit, this);
    bind_method(control_port, setSimulationEngine, &Component__PVBus2AMBAPV::control_port__setSimulationEngine, this);
    bind_method(control_port, message, &Component__PVBus2AMBAPV::control_port__message, this);
    bind_method(control_port, callSimEngine, &Component__PVBus2AMBAPV::control_port__callSimEngine, this);

    // avoid the automatic calling of the methods through the framework
    control_port.configure.setLocalOnly(true);
    control_port.init.setLocalOnly(true);
    control_port.interconnect.setLocalOnly(true);
//  control_port.postConnect.setLocalOnly(true);
    control_port.reset.setLocalOnly(true);
    control_port.loadApplicationFile.setLocalOnly(true);
    control_port.disconnect.setLocalOnly(true);
    control_port.terminate.setLocalOnly(true);
    control_port.save.setLocalOnly(true);
    control_port.restore.setLocalOnly(true);
    control_port.populateCADIMap.setLocalOnly(true);
//  control_port.refresh.setLocalOnly(true);
    control_port.step.setLocalOnly(true);
    control_port.update.setLocalOnly(true);
    control_port.communicate.setLocalOnly(true);
    control_port.getProperty.setLocalOnly(true);
    control_port.traceEndOfCycle.setLocalOnly(true);
//  control_port.bypass.setLocalOnly(true);
//  control_port.run.setLocalOnly(true);
//  control_port.stop.setLocalOnly(true);
//  control_port.idle.setLocalOnly(true); // broadcast ports don't have setLocalOnly
//  control_port.quit.setLocalOnly(true);
//  control_port.setSimulationEngine.setLocalOnly(true);

    // bind cadiPort behaviors
    bind_method(cadiPort__, GetParameters, &Component__PVBus2AMBAPV::cadiPort__GetParameters, this);
    bind_method(cadiPort__, GetParameterInfo, &Component__PVBus2AMBAPV::cadiPort__GetParameterInfo, this);
    bind_method(cadiPort__, GetProperty, &Component__PVBus2AMBAPV::cadiPort__GetProperty, this);
    bind_method(cadiPort__, LoadApplicationFile, &Component__PVBus2AMBAPV::cadiPort__LoadApplicationFile, this);
    bind_method(cadiPort__, GetApplicationsAndCommandLineParams, &Component__PVBus2AMBAPV::cadiPort__GetApplicationsAndCommandLineParams, this);

    // connect control ports for subcomponents to subcomponents
	controlPort_bus_slave_s__.connectTo(bus_slave_s->findPort("$control"));
	controlPort_bus_slave_ns__.connectTo(bus_slave_ns->findPort("$control"));
	controlPort_tz_switch__.connectTo(tz_switch->findPort("$control"));



    // resource initialization code
    reset_resources__();

    // bind behaviors to abstract ports
	bind_method(amba_pv_m, invalidate_direct_mem_ptr, &Component__PVBus2AMBAPV::abstract_port__amba_pv_m__invalidate_direct_mem_ptr, this);
	bind_method(device, read, &Component__PVBus2AMBAPV::abstract_port__device__read, this);
	bind_method(device, write, &Component__PVBus2AMBAPV::abstract_port__device__write, this);
	bind_method(device, debugRead, &Component__PVBus2AMBAPV::abstract_port__device__debugRead, this);
	bind_method(device, debugWrite, &Component__PVBus2AMBAPV::abstract_port__device__debugWrite, this);


    // add abstract ports
	publishSlavePort("pvbus_s", pvbus_s);
	pvbus_s.SetName__("pvbus_s");
	publishMasterPort("amba_pv_m", amba_pv_m);
	amba_pv_m.SetName__("amba_pv_m");
	control_ns.SetName__("control_ns");
	control_s.SetName__("control_s");
	device.SetName__("device");


    // wire up static connection map
	pvbus_s.connectTo(tz_switch->findPort("pvbus_input"));
	tz_switch->findPort("pvbus_port_a").connectTo(bus_slave_s->findPort("pvbus_s"));
	tz_switch->findPort("pvbus_port_b").connectTo(bus_slave_ns->findPort("pvbus_s"));
	bus_slave_s->findPort("device").connectTo(device);
	control_s.connectTo(bus_slave_s->findPort("control"));
	bus_slave_ns->findPort("device").connectTo(device);
	control_ns.connectTo(bus_slave_ns->findPort("control"));


    // init profiling

    // init resources


    // run the parameter write access functions for all of the component's parameters
    for (size_t i = 0; i < parameterInfos__.size(); ++i)
    {
        std::string paramName = parameterInfos__[i].name;

        switch (parameterInfos__[i].dataType)
        {
        case eslapi::CADI_PARAM_STRING:
            {
                std::string data = GetParameterValue(params, paramName, parameterInfos__[i].defaultString);
                parameter_write_string_func(paramNameToParamAccessFuncID(paramName), data);
            }
            break;
        case eslapi::CADI_PARAM_BOOL:
        case eslapi::CADI_PARAM_INT:
            {
                int64_t data = GetParameterValue(params, paramName, parameterInfos__[i].defaultValue, parameterInfos__[i].minValue, parameterInfos__[i].maxValue);
                parameter_write_func(paramNameToParamAccessFuncID(paramName), &data);
            }
            break;
        default:
            break;
        }
    }
}


Component__PVBus2AMBAPV::~Component__PVBus2AMBAPV()
{
}

void Component__PVBus2AMBAPV::control_port__configure(const sg::Params& params)
{
	if(controlPort_bus_slave_s__.configure.implemented()) controlPort_bus_slave_s__.configure(params.getParamsFor("bus_slave_s"));
	if(controlPort_bus_slave_ns__.configure.implemented()) controlPort_bus_slave_ns__.configure(params.getParamsFor("bus_slave_ns"));
	if(controlPort_tz_switch__.configure.implemented()) controlPort_tz_switch__.configure(params.getParamsFor("tz_switch"));


    assert(simulationContext__->getSimulationEngine());
    cadi__ = new Component__PVBus2AMBAPV_CADI(this, simulationContext__->getSimulationEngine());

    // forward certain calls from CADI interface to this component
    cadi__->GetCADIPort().connectTo(cadiPort__);

    

    std::map< std::string, eslapi::CAInterface* > tempMap;
    control_port__populateCADIMap(tempMap, ""); // precompute mxdi map

	cadi__->EnableSubComponentCADIImport();


}

void Component__PVBus2AMBAPV::control_port__populateCADIMap(std::map< std::string, eslapi::CAInterface* >&output_map, std::string const & base_prefix)
{
    if (componentName2CADI__.empty())
    {
        componentName2CADI__[getName()] = static_cast<eslapi::CADI*>(cadi__);
        std::string prefix = getName() + ".";

		{
			std::map< std::string, eslapi::CAInterface* > compMap;
			if (controlPort_bus_slave_s__.populateCADIMap.implemented())
			{
				controlPort_bus_slave_s__.populateCADIMap(compMap, "");
			}
			insertCADIMap__(prefix, compMap);
			eslapi::CADI *cadi = obtainCADI__("bus_slave_s", compMap);
			if (cadi != NULL)
			{
				cadiParameterProxy_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV__ = new CADIParameterProxy(cadi, &parameterFilter_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV__);
			}
		}
		{
			std::map< std::string, eslapi::CAInterface* > compMap;
			if (controlPort_bus_slave_ns__.populateCADIMap.implemented())
			{
				controlPort_bus_slave_ns__.populateCADIMap(compMap, "");
			}
			insertCADIMap__(prefix, compMap);
			eslapi::CADI *cadi = obtainCADI__("bus_slave_ns", compMap);
			if (cadi != NULL)
			{
				cadiParameterProxy_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV__ = new CADIParameterProxy(cadi, &parameterFilter_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV__);
			}
		}
		{
			std::map< std::string, eslapi::CAInterface* > compMap;
			if (controlPort_tz_switch__.populateCADIMap.implemented())
			{
				controlPort_tz_switch__.populateCADIMap(compMap, "");
			}
			insertCADIMap__(prefix, compMap);
		}

    }
    // Copy the local map into the given map with the requested prefix.
    for (std::map<std::string,eslapi::CAInterface*>::iterator it = componentName2CADI__.begin(); it != componentName2CADI__.end(); ++it)
    {
        output_map.insert(std::make_pair(base_prefix + it->first, it->second));
    }
}

eslapi::CADI* Component__PVBus2AMBAPV::obtainCADI__(const std::string &subcomp, const std::map< std::string, eslapi::CAInterface* > &componentName2CADI) const
{
    std::map< std::string, eslapi::CAInterface* >::const_iterator it = componentName2CADI.find(subcomp);
    if (it != componentName2CADI.end())
    {
        eslapi::CAInterface *cai = it->second;
        if (cai != NULL)
        {
            cai = cai->ObtainInterface(eslapi::CADI::IFNAME(), 0, 0);
            if (cai != NULL)
            {
                return static_cast<eslapi::CADI*>(cai);
            }
        }
    }
    return NULL;
}

void Component__PVBus2AMBAPV::insertCADIMap__(std::string prefix, std::map< std::string, eslapi::CAInterface* > &componentName2CADI)
{
    for (std::map<std::string, eslapi::CAInterface*>::iterator it = componentName2CADI.begin(); it != componentName2CADI.end(); it++)
    {
        // put prefix in front of all entries
        componentName2CADI__[prefix + it->first] = it->second;
    }
}


std::string Component__PVBus2AMBAPV::control_port__getProperty(const std::string& propname)
{
    if(properties__.find(propname) != properties__.end())
    {
        return properties__[propname];
    }
    else
        return ""; // unknown property
}


std::string Component__PVBus2AMBAPV::control_port__bypass(const std::string&)
{
    return "";
}


void Component__PVBus2AMBAPV::control_port__run()
{
}


void Component__PVBus2AMBAPV::control_port__stop()
{
}


void Component__PVBus2AMBAPV::control_port__idle()
{
}


void Component__PVBus2AMBAPV::control_port__quit()
{
}


void Component__PVBus2AMBAPV::control_port__setSimulationEngine(SimulationEngine*)
{
}


void Component__PVBus2AMBAPV::control_port__message(const std::string &msg, sg::message::MessageType msgType)
{
}


std::string Component__PVBus2AMBAPV::control_port__callSimEngine(const std::string &)
{
    return "";
}


void Component__PVBus2AMBAPV::control_port__reset(int level)
{
    // restore the resources' reset values before executing 'reset'
    reset_resources__();
    reset(level);
}


void Component__PVBus2AMBAPV::control_port__terminate()
{
    // the CADI was created before 'init', therefore we free it after 'terminate'
    terminate();
    freeCADIResources__();
}


void Component__PVBus2AMBAPV::freeCADIResources__()
{
    // free CADI parameter proxies
	delete cadiParameterProxy_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV__;
	cadiParameterProxy_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV__ = 0;
	delete cadiParameterProxy_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV__;
	cadiParameterProxy_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV__ = 0;


    // free CADI interface
    delete cadi__;
    cadi__ = 0;
}


// CADI Port implementations
eslapi::CADIReturn_t Component__PVBus2AMBAPV::cadiPort__GetParameters(MxU32 startIndex, MxU32 desiredNumOfParams, MxU32 *actualNumOfParams, eslapi::CADIParameterInfo_t *params)
{
    // check arguments
    if(actualNumOfParams == 0)
        return eslapi::CADI_STATUS_IllegalArgument;
    *actualNumOfParams = 0;
    if(params == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    // collect parameters
    size_t i = 0;
    for (; (i < desiredNumOfParams) && ((startIndex + i) < parameterInfos__.size()); ++i)
    {
        params[i] = parameterInfos__[startIndex + i];
    }
    *actualNumOfParams = (MxU32)i;

    return eslapi::CADI_STATUS_OK;
}

eslapi::CADIReturn_t Component__PVBus2AMBAPV::cadiPort__GetParameterInfo(const std::string &parameterName, eslapi::CADIParameterInfo_t* param)
{
    if(param == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    for (size_t i = 0; i < parameterInfos__.size(); ++i)
    {
        if (!strcmp(parameterInfos__[i].name, parameterName.c_str()))
        {
            *param = parameterInfos__[i];

            return eslapi::CADI_STATUS_OK;
        }
    }

    return eslapi::CADI_STATUS_GeneralError;
}


bool Component__PVBus2AMBAPV::ForwardParameterValueToSubcomponent(CADIParameterProxy *proxy, const char *param_name, int64_t intVal, const char *strVal)
{
    if (!proxy)
        return false;

    // we need the parameter's CADI id in order to create an eslapi::CADIParameterValue_t structure
    // therefore, we first retrieve its eslapi::CADIParameterInfo_t meta-data
    eslapi::CADIParameterInfo_t paramInfo;
    if (proxy->CADIGetParameterInfo(param_name, &paramInfo) != eslapi::CADI_STATUS_OK)
        return false;

    eslapi::CADIParameterValue_t paramVal(paramInfo.id, paramInfo.dataType, intVal, strVal);
    eslapi::CADIFactoryErrorMessage_t error;
    if (proxy->CADISetParameters(1, &paramVal, &error) != eslapi::CADI_STATUS_OK)
        return false;

    return true;
}


sg::accessfunc::AccessFuncResult Component__PVBus2AMBAPV::parameter_read_func(uint32_t id, int64_t *data)
{
    if (data == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    switch (id)
    {
	case PARAMETER_ID_max_size: *data = max_size; break;
	case PARAMETER_ID_global_monitor: *data = global_monitor; break;

        default:
            printf("error: Component__PVBus2AMBAPV::parameter_read_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

sg::accessfunc::AccessFuncResult Component__PVBus2AMBAPV::parameter_read_string_func(uint32_t id, std::string &data)
{
    switch (id)
    {

        default:
            printf("error: Component__PVBus2AMBAPV::parameter_read_string_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

sg::accessfunc::AccessFuncResult Component__PVBus2AMBAPV::parameter_write_func(uint32_t id, const int64_t *data)
{
    if (data == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    switch (id)
    {
	case PARAMETER_ID_max_size:
		{
			*(const_cast<uint64_t*>(&max_size)) = *data;
		}
		break;
	case PARAMETER_ID_global_monitor:
		{
			*(const_cast<bool*>(&global_monitor)) = !!*data;
		}
		break;

        default:
            printf("error: Component__PVBus2AMBAPV::parameter_write_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

sg::accessfunc::AccessFuncResult Component__PVBus2AMBAPV::parameter_write_string_func(uint32_t id, const std::string &data)
{
    switch (id)
    {

        default:
            printf("error: Component__PVBus2AMBAPV::parameter_write_string_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

void Component__PVBus2AMBAPV::cadiPort__LoadApplicationFile(const std::string& filename)
{
    loadApplicationFile(filename);
    applications2params[filename] = "";
}

void Component__PVBus2AMBAPV::cadiPort__GetApplicationsAndCommandLineParams(std::map<std::string, std::string>&applications2params_)
{
    applications2params_ = applications2params;
}

eslapi::CADIReturn_t Component__PVBus2AMBAPV::cadiPort__GetProperty(const std::string& propertyName, std::string &value)
{
    if(properties__.find(propertyName) != properties__.end())
    {
        value = properties__[propertyName];
        return eslapi::CADI_STATUS_OK;
    }
    else
    {
        value = "";
        return eslapi::CADI_STATUS_GeneralError;
    }
}

// functions to stop and lock the simulator
// we only expose the simHalt() function in the documentation for the moment

void Component__PVBus2AMBAPV::simHalt()
{
    cadi__->StopSimulation();
}


// start simulation from the inside
// (useful from visualisation components which can execute code while the
// simulation is stopped, like key events)
void Component__PVBus2AMBAPV::simRun()
{
    cadi__->CADIExecContinue();
}


// return true if simulation is running
// (useful from visualisation components which can execute code while the
// simulation is stopped, like key events)
bool Component__PVBus2AMBAPV::simIsRunning()
{
    uint32_t mode = eslapi::CADI_EXECMODE_Stop;
    cadi__->CADIExecGetMode(&mode);
    return mode != eslapi::CADI_EXECMODE_Stop;
}


void Component__PVBus2AMBAPV::simShutdown()
{
    cadiPort__.simShutdown();
}

void Component__PVBus2AMBAPV::simReset(uint32_t level)
{
    cadi__->CADIExecReset(level);
}

uint32_t Component__PVBus2AMBAPV::paramNameToParamAccessFuncID(const std::string &name)
{
    uint32_t id = 0;
    if (name == "") id = 0xffffffff;
    if (name == "size") id = PARAMETER_ID_max_size;
    if (name == "global-monitor") id = PARAMETER_ID_global_monitor;

    return id;
}

void Component__PVBus2AMBAPV::reset_resources__()
{
    // resource initialization code

}


} // Cortex_NMS

#line 1985 "./Linux-Release-GCC-4.1/gen/Comp_NonDSO.cpp"

// This is an anonymous namespace, it effectively declares everything inside it as 'static', e.g. only visible within the .o file it is compiled into
//     without this we get link errors when linking together LISA generated components
namespace
{

class ComponentFactoryBase :
    public sg::BasicComponentFactory
{
protected:
    void publishSubComponent(sg::ComponentFactory *factory,
                             const std::string &prefix,
                             bool publish_all,
                             const ParameterFilter &param_filter);
};

void
ComponentFactoryBase::publishSubComponent(sg::ComponentFactory *factory,
                                          const std::string &prefix,
                                          bool publish_all,
                                          const ParameterFilter &param_filter)
{
    using namespace sg;

    if (param_filter.isEmpty())
    {
        BasicComponentFactory::publishComponent(factory, prefix, publish_all);
    }
    else
    {
        for (unsigned int t = 0; t < factory->getTargetCount(); ++t)
        {
            TargetInfo *info = factory->getTargetInfo(t);

            std::vector<eslapi::CADIParameterInfo_t> my_param_infos;

            param_filter.filter(info->parameter_info, info->parameter_count, info->instance_path, my_param_infos);

            TargetInfo *my_target_info = new TargetInfo;

                        eslapi::CADITargetInfo_t *my_cadi_target_info = new eslapi::CADITargetInfo_t;
                        *my_cadi_target_info = *(info->cadi_target_info); // copy CADI target info
            my_cadi_target_info->numberOfParameters = (uint32_t)my_param_infos.size();
            my_target_info->cadi_target_info = my_cadi_target_info;

            my_target_info->parameter_count = (unsigned)my_param_infos.size();

            // only copy parameters, if there are ones
                        if (my_target_info->parameter_count)
                        {
                                my_target_info->parameter_info = new eslapi::CADIParameterInfo_t[my_target_info->parameter_count];
                                memcpy(const_cast<eslapi::CADIParameterInfo_t *>(my_target_info->parameter_info),
                                           &my_param_infos.front(),
                                           sizeof(eslapi::CADIParameterInfo_t) * my_target_info->parameter_count);
                        }

            my_target_info->instance_path = info->instance_path;

            // Skip any targets that have an instance_path of "".
            if (my_target_info->instance_path.length() > 0)
            {
                // Add the prefix at the start of the instance path.
                std::string new_path = prefix + "." + my_target_info->instance_path;
                publishTarget(*my_target_info, new_path);
            }
            else if (publish_all)
            {
                std::string new_path = prefix;
                publishTarget(*my_target_info, new_path);
            }
            delete my_target_info;
        }
    }
}

}

using namespace Cortex_NMS;

// component factory implementation
// ------------------------------------------------------------------------------
// component factory of class Cortex
// ------------------------------------------------------------------------------
//


namespace
{

// component factory class
// (this concrete class is never exposed to the outside world)
class Cortex_ComponentFactoryClass: public ComponentFactoryBase
{
    bool componentsPublished;
    void lazyPublish(void)
    {
        static eslapi::CADITargetInfo_t info
        (
            0, /* MxU32 id; (overridden in CADIFactory) */                                                              // used for identification
            "Cortex", /* char  targetName[CADI_NAME_SIZE];     */      // name of the target, i.e. the "type", not the instance name
            "", /* char instanceName[CADI_NAME_SIZE]; (overridden in CADIFactory) */    // name of the CADI target instance
            "1.0", /* char        version[CADI_DESCRIPTION]; */           // version string
            "", /* char    description[CADI_DESCRIPTION]; */       // target description
            "System", /* char componentType[CADI_NAME_SIZE]; */       // classification of the target into a user-defined group
            0, /* MxU32 numberOfParameters; (overridden below) */                               // number of parameters supported
            0, /* bool        executesSoftware; */                            // false = does not execute programs, true = executes software
            false, /* MxU32     isHardwareModel; */                             // 0 = is software model, 1 = is hardware model
            "", /* char systemName[CADI_NAME_SIZE];  (overridden in CADIFactory) */             // name of the system the target belongs to.
            // Is empty for single-core standalone models.
            0, /* MxU32 systemID; (overridden in CADIFactory) */                                                // system id
            "" /* char  systemDescription[CADI_DESCRIPTION]; (overridden in CADIFactory) */ // description of the system
        );

        static eslapi::CADIParameterInfo_t parameters[] =
        {

            eslapi::CADIParameterInfo_t( 0, "", eslapi::CADI_PARAM_BOOL, "", 1, INT64_C(0), INT64_C(-1), 0, "0" )
        };
        info.numberOfParameters = (sizeof(parameters) / sizeof(parameters[0])) - 1;

        // build TargetInfo
        sg::TargetInfo targetInfo;
        targetInfo.cadi_target_info = &info;
        targetInfo.parameter_count = targetInfo.cadi_target_info->numberOfParameters;
        targetInfo.parameter_info = parameters;

        // publish this component's TargetInfo
        publishTarget(targetInfo, "");

        // publish subcomponent TargetInfos
        {
            sg::ComponentFactory *componentFactory = ARMCortexM3CT_GetFactory();
            ComponentFactoryBase::publishComponent(componentFactory, "Core", true);
            componentFactory->dereference();
        }
        {
            sg::ComponentFactory *componentFactory = ClockDivider_GetFactory();
            ComponentFactoryBase::publishSubComponent(componentFactory, "Clock100MHz", true, ParameterFilter_Clock100MHz_of_ClockDivider_to_Cortex());
            componentFactory->dereference();
        }
        {
            sg::ComponentFactory *componentFactory = PVBus2AMBAPV_GetFactory();
            ComponentFactoryBase::publishSubComponent(componentFactory, "AMBAPVBus", true, ParameterFilter_AMBAPVBus_of_PVBus2AMBAPV_to_Cortex());
            componentFactory->dereference();
        }
        {
            sg::ComponentFactory *componentFactory = MasterClock_GetFactory();
            ComponentFactoryBase::publishComponent(componentFactory, "Clock1Hz", true);
            componentFactory->dereference();
        }
        {
            sg::ComponentFactory *componentFactory = PVBusDecoder_GetFactory();
            ComponentFactoryBase::publishComponent(componentFactory, "BusDecoder", true);
            componentFactory->dereference();
        }

        componentsPublished = true;
    }
    ~Cortex_ComponentFactoryClass()
    {
    }

public:
    Cortex_ComponentFactoryClass() {
        componentsPublished = false;
    }

    virtual void dereference() { delete this; }

    virtual sg::ComponentBase *instantiate(std::string const & instance_name,
                                                sg::SimulationContext *simulationContext,
                                                sg::Params const & params)
    {
        return new Cortex_NMS::Component__Cortex(instance_name.c_str(), simulationContext, params);
    }

    virtual unsigned int getTargetCount()
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::getTargetCount();
    }

    virtual sg::TargetInfo * getTargetInfo(unsigned int index)
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::getTargetInfo(index);
    }

    virtual sg::TargetInfo * getTargetInfo(std::string const & instance_path)
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::getTargetInfo(instance_path);
    }

    virtual void publishSubComponent(sg::ComponentFactory *factory, const std::string &prefix,
                          bool publish_all, const ParameterFilter &param_filter)
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::publishSubComponent(factory, prefix, publish_all, param_filter);
    }

    virtual void publishComponent(sg::ComponentFactory *factory, const std::string &prefix,
                          bool publish_all)
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::publishComponent(factory, prefix, publish_all);
    }

};

}

namespace Cortex_NMS {

// factory function
// (this is the function which is exposed to the outside world)
sg::ComponentFactory *Cortex_GetFactory()
{
        return new Cortex_ComponentFactoryClass();
}

} // Cortex_NMS
// ------------------------------------------------------------------------------
// component factory of class PVBus2AMBAPV
// ------------------------------------------------------------------------------
//


namespace
{

// component factory class
// (this concrete class is never exposed to the outside world)
class PVBus2AMBAPV_ComponentFactoryClass: public ComponentFactoryBase
{
    bool componentsPublished;
    void lazyPublish(void)
    {
        static eslapi::CADITargetInfo_t info
        (
            0, /* MxU32 id; (overridden in CADIFactory) */                                                              // used for identification
            "PVBus2AMBAPV", /* char  targetName[CADI_NAME_SIZE];     */      // name of the target, i.e. the "type", not the instance name
            "", /* char instanceName[CADI_NAME_SIZE]; (overridden in CADIFactory) */    // name of the CADI target instance
            "8.2.72", /* char        version[CADI_DESCRIPTION]; */           // version string
            "PVBus to AMBA-PV protocol converter", /* char    description[CADI_DESCRIPTION]; */       // target description
            "Bus", /* char componentType[CADI_NAME_SIZE]; */       // classification of the target into a user-defined group
            0, /* MxU32 numberOfParameters; (overridden below) */                               // number of parameters supported
            0, /* bool        executesSoftware; */                            // false = does not execute programs, true = executes software
            false, /* MxU32     isHardwareModel; */                             // 0 = is software model, 1 = is hardware model
            "", /* char systemName[CADI_NAME_SIZE];  (overridden in CADIFactory) */             // name of the system the target belongs to.
            // Is empty for single-core standalone models.
            0, /* MxU32 systemID; (overridden in CADIFactory) */                                                // system id
            "" /* char  systemDescription[CADI_DESCRIPTION]; (overridden in CADIFactory) */ // description of the system
        );

        static eslapi::CADIParameterInfo_t parameters[] =
        {
        eslapi::CADIParameterInfo_t(0x10000001, "size",eslapi::CADI_PARAM_INT, "Maximum size of memory region",0,MxS64CONST(0x8000000000000000),MxS64CONST(0x7fffffffffffffff),MxS64CONST(0x1000000000000), "0x1000000000000" ),
        eslapi::CADIParameterInfo_t(0x10000002, "global-monitor",eslapi::CADI_PARAM_BOOL, "Enable built-in global monitor",0,MxS64CONST(0x8000000000000000),MxS64CONST(0x7fffffffffffffff),MxS64CONST(0x0), "false" ),

            eslapi::CADIParameterInfo_t( 0, "", eslapi::CADI_PARAM_BOOL, "", 1, INT64_C(0), INT64_C(-1), 0, "0" )
        };
        info.numberOfParameters = (sizeof(parameters) / sizeof(parameters[0])) - 1;

        // build TargetInfo
        sg::TargetInfo targetInfo;
        targetInfo.cadi_target_info = &info;
        targetInfo.parameter_count = targetInfo.cadi_target_info->numberOfParameters;
        targetInfo.parameter_info = parameters;

        // publish this component's TargetInfo
        publishTarget(targetInfo, "");

        // publish subcomponent TargetInfos
        {
            sg::ComponentFactory *componentFactory = PVBusSlave_GetFactory();
            ComponentFactoryBase::publishSubComponent(componentFactory, "bus_slave_s", true, ParameterFilter_bus_slave_s_of_PVBusSlave_to_PVBus2AMBAPV());
            componentFactory->dereference();
        }
        {
            sg::ComponentFactory *componentFactory = PVBusSlave_GetFactory();
            ComponentFactoryBase::publishSubComponent(componentFactory, "bus_slave_ns", true, ParameterFilter_bus_slave_ns_of_PVBusSlave_to_PVBus2AMBAPV());
            componentFactory->dereference();
        }
        {
            sg::ComponentFactory *componentFactory = TZSwitch_GetFactory();
            ComponentFactoryBase::publishComponent(componentFactory, "tz_switch", true);
            componentFactory->dereference();
        }

        componentsPublished = true;
    }
    ~PVBus2AMBAPV_ComponentFactoryClass()
    {
    }

public:
    PVBus2AMBAPV_ComponentFactoryClass() {
        componentsPublished = false;
    }

    virtual void dereference() { delete this; }

    virtual sg::ComponentBase *instantiate(std::string const & instance_name,
                                                sg::SimulationContext *simulationContext,
                                                sg::Params const & params)
    {
        return new Cortex_NMS::Component__PVBus2AMBAPV(instance_name.c_str(), simulationContext, params);
    }

    virtual unsigned int getTargetCount()
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::getTargetCount();
    }

    virtual sg::TargetInfo * getTargetInfo(unsigned int index)
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::getTargetInfo(index);
    }

    virtual sg::TargetInfo * getTargetInfo(std::string const & instance_path)
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::getTargetInfo(instance_path);
    }

    virtual void publishSubComponent(sg::ComponentFactory *factory, const std::string &prefix,
                          bool publish_all, const ParameterFilter &param_filter)
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::publishSubComponent(factory, prefix, publish_all, param_filter);
    }

    virtual void publishComponent(sg::ComponentFactory *factory, const std::string &prefix,
                          bool publish_all)
    {
        if (!componentsPublished) lazyPublish();
        return ComponentFactoryBase::publishComponent(factory, prefix, publish_all);
    }

};

}

namespace Cortex_NMS {

// factory function
// (this is the function which is exposed to the outside world)
sg::ComponentFactory *PVBus2AMBAPV_GetFactory()
{
        return new PVBus2AMBAPV_ComponentFactoryClass();
}

} // Cortex_NMS

