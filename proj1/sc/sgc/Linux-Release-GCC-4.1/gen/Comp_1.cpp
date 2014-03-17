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

#include "Component__TZSwitch_ClassDef.h"


#include "eslapi/CADITypes.h"


#include "sg/SGBasicComponentFactory.h"

#include "TerminateScheduler.h"
#include "ParameterFilter.h"

#include <sg/MSCFixes.h>

// make the MSG_<...> symbols available in the global namespace
using namespace sg::message;

// component CADI interfaces
// ------------------------------------------------------------------------------
// CADI Interface for component Component__TZSwitch
// ------------------------------------------------------------------------------

namespace Cortex_NMS {

class Component__TZSwitch_CADI : public sg::CADIBase
{
public:
        Component__TZSwitch_CADI(Component__TZSwitch* parentComponent, sg::ComponentBase* simulationEngine);

    eslapi::CADIReturn_t CADIXfaceBypass(uint32_t commandLength, const char *command, uint32_t maxResponseLength, char *response);
    sg::accessfunc::AccessFuncResult GetExtendedTargetFeatures(MxU32 /*id*/, std::string &data, bool /*se*/);

private:
    Component__TZSwitch *component;
};

} // Cortex_NMS


// non inline behaviors
#line 189 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::init()
{
 {if(!controlPort_pvbus_mapper__.init.empty()) controlPort_pvbus_mapper__.init();};

 
 assert(TZROUTE_IGNORE == 0);
 assert(TZROUTE_TO_PORT_A == 1);
 assert(TZROUTE_TO_PORT_B == 2);
 assert(TZROUTE_ABORT == 3);

 
 control.routeAccesses(TZINPUT_SECURE, TZSwitch_RouteOption(secure));
 control.routeAccesses(TZINPUT_NORMAL, TZSwitch_RouteOption(normal));
 
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::interconnect()
{{if(!controlPort_pvbus_mapper__.interconnect.empty()) controlPort_pvbus_mapper__.interconnect();};
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::disconnect()
{{if(!controlPort_pvbus_mapper__.disconnect.empty()) controlPort_pvbus_mapper__.disconnect();};
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::update()
{{if(!controlPort_pvbus_mapper__.update.empty()) controlPort_pvbus_mapper__.update();};
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::communicate()
{{if(!controlPort_pvbus_mapper__.communicate.empty()) controlPort_pvbus_mapper__.communicate();};
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::traceEndOfCycle()
{{if(!controlPort_pvbus_mapper__.traceEndOfCycle.empty()) controlPort_pvbus_mapper__.traceEndOfCycle();};
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::loadApplicationFile(const std::string& filename)
{{if(!controlPort_pvbus_mapper__.loadApplicationFile.empty()) controlPort_pvbus_mapper__.loadApplicationFile(filename);};
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::terminate()
{{if(!controlPort_pvbus_mapper__.terminate.empty()) controlPort_pvbus_mapper__.terminate();};
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::reset(int level)
{{if(!controlPort_pvbus_mapper__.reset.empty()) controlPort_pvbus_mapper__.reset(level);};
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::reset(int level, int /*argc*/, char** /*argv*/)
{
	reset(level);

}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { bool 
Component__TZSwitch::save(MxODataStream& os)
{{if(!controlPort_pvbus_mapper__.save.empty()) controlPort_pvbus_mapper__.save(os);};return true;
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { bool 
Component__TZSwitch::restore(MxIDataStream& is)
{{if(!controlPort_pvbus_mapper__.restore.empty()) controlPort_pvbus_mapper__.restore(is);};return true;
}
}

#line 69 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::step()
{{if(!controlPort_pvbus_mapper__.step.empty()) controlPort_pvbus_mapper__.step();};
}
}

#line 116 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { void 
Component__TZSwitch::abstract_port__control__routeAccesses(TZSwitch_InputFilter input, TZSwitch_RouteOption destination)
{
 
 unsigned new_route;

 switch(destination)
 {
 case TZROUTE_IGNORE: new_route = PVBUSMAPPER_IGNORE; break;
 case TZROUTE_TO_PORT_A: new_route = PORT_A; break;
 case TZROUTE_TO_PORT_B: new_route = PORT_B; break;
 case TZROUTE_ABORT: new_route = PVBUSMAPPER_ABORT; break;

 default:
 assert(!"Argument destination invalid");
 new_route = PVBUSMAPPER_IGNORE;
 break;
 }

 bool routing_changed = false;

 if ((input == TZINPUT_SECURE) || (input == TZINPUT_ANY))
 {
 if (route.secure != new_route)
 {
 route.secure = new_route;
 routing_changed = true;
 }

 
 secure = destination;
 }
 else
 {
 assert(input == TZINPUT_NORMAL);
 }

 if ((input == TZINPUT_NORMAL) || (input == TZINPUT_ANY))
 {
 if (route.normal != new_route)
 {
 route.normal = new_route;
 routing_changed = true;
 }

 
 normal = destination;
 }
 else
 {
 assert(input == TZINPUT_SECURE);
 }

 if (routing_changed)
 {
 
 mapper_control.allBusMapChanging();
 }
 
}
}

#line 206 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/TZSwitch.lisa"
namespace Cortex_NMS { unsigned 
Component__TZSwitch::abstract_port__mapper_control__remap(pv::RemapRequest& req)
{
 return req.getTransactionAttributes()->isNormalWorld() ? route.normal
 : route.secure;
 
}
}

#line 236 "./Linux-Release-GCC-4.1/gen/Comp_1.cpp"

// ------------------------------------------------------------------------------
// implementation of class Component__TZSwitch
// ------------------------------------------------------------------------------

namespace Cortex_NMS {

Component__TZSwitch::Component__TZSwitch(const char * instName, sg::SimulationContext* simulationContext, const sg::Params & params):
    SystemGenComponent(instName, simulationContext, params)

	,secure(GetParameterValue(params, "secure", MxS64CONST(0x1), MxS64CONST(0x8000000000000000), MxS64CONST(0x7fffffffffffffff)))
	,normal(GetParameterValue(params, "normal", MxS64CONST(0x2), MxS64CONST(0x8000000000000000), MxS64CONST(0x7fffffffffffffff)))



{
    // initialize properties__
	properties__["component_name"] = "";
	properties__["component_type"] = "Bus";
	properties__["debugger_name"] = "";
	properties__["debugger_start_command"] = "";
	properties__["default_view"] = "auto";
	properties__["description"] = "Allow TrustZone secure/normal bus signals to be routed separately";
	properties__["documentation_file"] = "../Docs/DUI0423P_fast_model_rm.pdf";
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
	properties__["version"] = "8.2.72";

    // initialize parameter info
    {
        sg::ComponentFactory *factory = TZSwitch_GetFactory();

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
		sg::ComponentFactory *PVBusMapper_factory = PVBusMapper_GetFactory();
		{
			sg::Params params_pvbus_mapper__ = params.getParamsFor("pvbus_mapper");
			add(pvbus_mapper = PVBusMapper_factory->instantiate("pvbus_mapper", simulationContext, params_pvbus_mapper__));
		}
		PVBusMapper_factory->dereference();
	}


    // bind local behaviors to this->control_port
    bind_method(control_port, configure, &Component__TZSwitch::control_port__configure, this);
    bind_method(control_port, init, &Component__TZSwitch::init, this);
    bind_method(control_port, interconnect, &Component__TZSwitch::interconnect, this);
//  bind_method(control_port, postConnect, &Component__TZSwitch::postConnect, this);
    bind_method(control_port, reset, &Component__TZSwitch::control_port__reset, this);
    bind_method(control_port, loadApplicationFile, &Component__TZSwitch::loadApplicationFile, this);
    bind_method(control_port, disconnect, &Component__TZSwitch::disconnect, this);
    bind_method(control_port, terminate, &Component__TZSwitch::control_port__terminate, this);
    bind_method(control_port, populateCADIMap, &Component__TZSwitch::control_port__populateCADIMap, this);
//  bind_method(control_port, refresh, &Component__TZSwitch::refresh, this);
    bind_method(control_port, step, &Component__TZSwitch::step, this);
    bind_method(control_port, update, &Component__TZSwitch::update, this);
    bind_method(control_port, communicate, &Component__TZSwitch::communicate, this);
    bind_method(control_port, getProperty, &Component__TZSwitch::control_port__getProperty, this);
    bind_method(control_port, traceEndOfCycle, &Component__TZSwitch::traceEndOfCycle, this);
    bind_method(control_port, bypass, &Component__TZSwitch::control_port__bypass, this);
    bind_method(control_port, run, &Component__TZSwitch::control_port__run, this);
    bind_method(control_port, stop, &Component__TZSwitch::control_port__stop, this);
    bind_method(control_port, idle, &Component__TZSwitch::control_port__idle, this);
    bind_method(control_port, quit, &Component__TZSwitch::control_port__quit, this);
    bind_method(control_port, setSimulationEngine, &Component__TZSwitch::control_port__setSimulationEngine, this);
    bind_method(control_port, message, &Component__TZSwitch::control_port__message, this);
    bind_method(control_port, callSimEngine, &Component__TZSwitch::control_port__callSimEngine, this);

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
    bind_method(cadiPort__, GetParameters, &Component__TZSwitch::cadiPort__GetParameters, this);
    bind_method(cadiPort__, GetParameterInfo, &Component__TZSwitch::cadiPort__GetParameterInfo, this);
    bind_method(cadiPort__, GetProperty, &Component__TZSwitch::cadiPort__GetProperty, this);
    bind_method(cadiPort__, LoadApplicationFile, &Component__TZSwitch::cadiPort__LoadApplicationFile, this);
    bind_method(cadiPort__, GetApplicationsAndCommandLineParams, &Component__TZSwitch::cadiPort__GetApplicationsAndCommandLineParams, this);

    // connect control ports for subcomponents to subcomponents
	controlPort_pvbus_mapper__.connectTo(pvbus_mapper->findPort("$control"));



    // resource initialization code
    reset_resources__();

    // bind behaviors to abstract ports
	bind_method(control, routeAccesses, &Component__TZSwitch::abstract_port__control__routeAccesses, this);
	bind_method(mapper_control, remap, &Component__TZSwitch::abstract_port__mapper_control__remap, this);


    // add abstract ports
	publishSlavePort("pvbus_input", pvbus_input);
	pvbus_input.SetName__("pvbus_input");
	publishMasterPort("pvbus_port_a", pvbus_port_a);
	pvbus_port_a.SetName__("pvbus_port_a");
	publishMasterPort("pvbus_port_b", pvbus_port_b);
	pvbus_port_b.SetName__("pvbus_port_b");
	publishSlavePort("control", control);
	control.SetName__("control");
	mapper_control.SetName__("mapper_control");


    // wire up static connection map
	pvbus_input.connectTo(pvbus_mapper->findPort("pvbus_s"));
	pvbus_mapper->findPort("control").connectTo(mapper_control);
	pvbus_mapper->findPort("pvbus_m", 0).connectTo(pvbus_port_a);
	pvbus_mapper->findPort("pvbus_m", 1).connectTo(pvbus_port_b);


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


Component__TZSwitch::~Component__TZSwitch()
{
}

void Component__TZSwitch::control_port__configure(const sg::Params& params)
{
	if(controlPort_pvbus_mapper__.configure.implemented()) controlPort_pvbus_mapper__.configure(params.getParamsFor("pvbus_mapper"));


    assert(simulationContext__->getSimulationEngine());
    cadi__ = new Component__TZSwitch_CADI(this, simulationContext__->getSimulationEngine());

    // forward certain calls from CADI interface to this component
    cadi__->GetCADIPort().connectTo(cadiPort__);

    

    std::map< std::string, eslapi::CAInterface* > tempMap;
    control_port__populateCADIMap(tempMap, ""); // precompute mxdi map

	cadi__->EnableSubComponentCADIImport();


}

void Component__TZSwitch::control_port__populateCADIMap(std::map< std::string, eslapi::CAInterface* >&output_map, std::string const & base_prefix)
{
    if (componentName2CADI__.empty())
    {
        componentName2CADI__[getName()] = static_cast<eslapi::CADI*>(cadi__);
        std::string prefix = getName() + ".";

		{
			std::map< std::string, eslapi::CAInterface* > compMap;
			if (controlPort_pvbus_mapper__.populateCADIMap.implemented())
			{
				controlPort_pvbus_mapper__.populateCADIMap(compMap, "");
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

eslapi::CADI* Component__TZSwitch::obtainCADI__(const std::string &subcomp, const std::map< std::string, eslapi::CAInterface* > &componentName2CADI) const
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

void Component__TZSwitch::insertCADIMap__(std::string prefix, std::map< std::string, eslapi::CAInterface* > &componentName2CADI)
{
    for (std::map<std::string, eslapi::CAInterface*>::iterator it = componentName2CADI.begin(); it != componentName2CADI.end(); it++)
    {
        // put prefix in front of all entries
        componentName2CADI__[prefix + it->first] = it->second;
    }
}


std::string Component__TZSwitch::control_port__getProperty(const std::string& propname)
{
    if(properties__.find(propname) != properties__.end())
    {
        return properties__[propname];
    }
    else
        return ""; // unknown property
}


std::string Component__TZSwitch::control_port__bypass(const std::string&)
{
    return "";
}


void Component__TZSwitch::control_port__run()
{
}


void Component__TZSwitch::control_port__stop()
{
}


void Component__TZSwitch::control_port__idle()
{
}


void Component__TZSwitch::control_port__quit()
{
}


void Component__TZSwitch::control_port__setSimulationEngine(SimulationEngine*)
{
}


void Component__TZSwitch::control_port__message(const std::string &msg, sg::message::MessageType msgType)
{
}


std::string Component__TZSwitch::control_port__callSimEngine(const std::string &)
{
    return "";
}


void Component__TZSwitch::control_port__reset(int level)
{
    // restore the resources' reset values before executing 'reset'
    reset_resources__();
    reset(level);
}


void Component__TZSwitch::control_port__terminate()
{
    // the CADI was created before 'init', therefore we free it after 'terminate'
    terminate();
    freeCADIResources__();
}


void Component__TZSwitch::freeCADIResources__()
{
    // free CADI parameter proxies


    // free CADI interface
    delete cadi__;
    cadi__ = 0;
}


// CADI Port implementations
eslapi::CADIReturn_t Component__TZSwitch::cadiPort__GetParameters(MxU32 startIndex, MxU32 desiredNumOfParams, MxU32 *actualNumOfParams, eslapi::CADIParameterInfo_t *params)
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

eslapi::CADIReturn_t Component__TZSwitch::cadiPort__GetParameterInfo(const std::string &parameterName, eslapi::CADIParameterInfo_t* param)
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


bool Component__TZSwitch::ForwardParameterValueToSubcomponent(CADIParameterProxy *proxy, const char *param_name, int64_t intVal, const char *strVal)
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


sg::accessfunc::AccessFuncResult Component__TZSwitch::parameter_read_func(uint32_t id, int64_t *data)
{
    if (data == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    switch (id)
    {
	case PARAMETER_ID_secure: *data = secure; break;
	case PARAMETER_ID_normal: *data = normal; break;

        default:
            printf("error: Component__TZSwitch::parameter_read_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

sg::accessfunc::AccessFuncResult Component__TZSwitch::parameter_read_string_func(uint32_t id, std::string &data)
{
    switch (id)
    {

        default:
            printf("error: Component__TZSwitch::parameter_read_string_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

sg::accessfunc::AccessFuncResult Component__TZSwitch::parameter_write_func(uint32_t id, const int64_t *data)
{
    if (data == 0)
        return eslapi::CADI_STATUS_IllegalArgument;

    switch (id)
    {
	case PARAMETER_ID_secure:
		{
			secure = *data;
		}
		break;
	case PARAMETER_ID_normal:
		{
			normal = *data;
		}
		break;

        default:
            printf("error: Component__TZSwitch::parameter_write_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

sg::accessfunc::AccessFuncResult Component__TZSwitch::parameter_write_string_func(uint32_t id, const std::string &data)
{
    switch (id)
    {

        default:
            printf("error: Component__TZSwitch::parameter_write_string_func: undefined parameter id '0x%08x'\n", id);
            return sg::accessfunc::ACCESS_FUNC_GeneralError;
    }

    return sg::accessfunc::ACCESS_FUNC_OK;
}

void Component__TZSwitch::cadiPort__LoadApplicationFile(const std::string& filename)
{
    loadApplicationFile(filename);
    applications2params[filename] = "";
}

void Component__TZSwitch::cadiPort__GetApplicationsAndCommandLineParams(std::map<std::string, std::string>&applications2params_)
{
    applications2params_ = applications2params;
}

eslapi::CADIReturn_t Component__TZSwitch::cadiPort__GetProperty(const std::string& propertyName, std::string &value)
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

void Component__TZSwitch::simHalt()
{
    cadi__->StopSimulation();
}


// start simulation from the inside
// (useful from visualisation components which can execute code while the
// simulation is stopped, like key events)
void Component__TZSwitch::simRun()
{
    cadi__->CADIExecContinue();
}


// return true if simulation is running
// (useful from visualisation components which can execute code while the
// simulation is stopped, like key events)
bool Component__TZSwitch::simIsRunning()
{
    uint32_t mode = eslapi::CADI_EXECMODE_Stop;
    cadi__->CADIExecGetMode(&mode);
    return mode != eslapi::CADI_EXECMODE_Stop;
}


void Component__TZSwitch::simShutdown()
{
    cadiPort__.simShutdown();
}

void Component__TZSwitch::simReset(uint32_t level)
{
    cadi__->CADIExecReset(level);
}

uint32_t Component__TZSwitch::paramNameToParamAccessFuncID(const std::string &name)
{
    uint32_t id = 0;
    if (name == "") id = 0xffffffff;
    if (name == "secure") id = PARAMETER_ID_secure;
    if (name == "normal") id = PARAMETER_ID_normal;

    return id;
}

void Component__TZSwitch::reset_resources__()
{
    // resource initialization code

}


} // Cortex_NMS

#line 799 "./Linux-Release-GCC-4.1/gen/Comp_1.cpp"

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
// component factory of class TZSwitch
// ------------------------------------------------------------------------------
//


namespace
{

// component factory class
// (this concrete class is never exposed to the outside world)
class TZSwitch_ComponentFactoryClass: public ComponentFactoryBase
{
    bool componentsPublished;
    void lazyPublish(void)
    {
        static eslapi::CADITargetInfo_t info
        (
            0, /* MxU32 id; (overridden in CADIFactory) */                                                              // used for identification
            "TZSwitch", /* char  targetName[CADI_NAME_SIZE];     */      // name of the target, i.e. the "type", not the instance name
            "", /* char instanceName[CADI_NAME_SIZE]; (overridden in CADIFactory) */    // name of the CADI target instance
            "8.2.72", /* char        version[CADI_DESCRIPTION]; */           // version string
            "Allow TrustZone secure/normal bus signals to be routed separately", /* char    description[CADI_DESCRIPTION]; */       // target description
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
        eslapi::CADIParameterInfo_t(0x10000004, "secure",eslapi::CADI_PARAM_INT, "Secure Port",1,MxS64CONST(0x8000000000000000),MxS64CONST(0x7fffffffffffffff),MxS64CONST(0x1), "1" ),
        eslapi::CADIParameterInfo_t(0x10000005, "normal",eslapi::CADI_PARAM_INT, "Normal Port",1,MxS64CONST(0x8000000000000000),MxS64CONST(0x7fffffffffffffff),MxS64CONST(0x2), "2" ),

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
            sg::ComponentFactory *componentFactory = PVBusMapper_GetFactory();
            ComponentFactoryBase::publishComponent(componentFactory, "pvbus_mapper", true);
            componentFactory->dereference();
        }

        componentsPublished = true;
    }
    ~TZSwitch_ComponentFactoryClass()
    {
    }

public:
    TZSwitch_ComponentFactoryClass() {
        componentsPublished = false;
    }

    virtual void dereference() { delete this; }

    virtual sg::ComponentBase *instantiate(std::string const & instance_name,
                                                sg::SimulationContext *simulationContext,
                                                sg::Params const & params)
    {
        return new Cortex_NMS::Component__TZSwitch(instance_name.c_str(), simulationContext, params);
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
sg::ComponentFactory *TZSwitch_GetFactory()
{
        return new TZSwitch_ComponentFactoryClass();
}

} // Cortex_NMS

