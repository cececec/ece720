/*
 * 
 *
 * Copyright 2009 ARM Limited.
 * Copyright 2011 ARM Limited.
 *
 * All rights reserved.
 */
/** \file
 * Constructors for CADI wrapper classes. Put in a separate compilation unit
 * so we can compile it without optimisation which is very slow with some
 * versions of some compilers.
 */



#include "GlobalDefs.h"
#include "Components.h"
// includes for components in this file
#include "Component__PVBus2AMBAPV_ClassDef.h"
#include "Component__Cortex_ClassDef.h"
#include "Component__TZSwitch_ClassDef.h"
#include "Component__PVBus2AMBAPV_ClassDef.h"


#include "sg/FastDelegate.h"

using namespace fastdelegate;
using namespace Cortex_NMS;

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


// ------------------------------------------------------------------------------
// CADI Interface for component Component__Cortex
// ------------------------------------------------------------------------------

#include "Component__Cortex_ClassDef.h"

namespace Cortex_NMS {

// constructor
Component__Cortex_CADI::Component__Cortex_CADI(Component__Cortex* parentComponent, sg::ComponentBase* simulationEngine) :
    sg::CADIBase(parentComponent ? parentComponent->getName() : "", simulationEngine),
    component(parentComponent)
{



        // memory blocks
        MxU32 emptySupportedMultiplesOfMAU[32];
        memset(emptySupportedMultiplesOfMAU, 0, sizeof(emptySupportedMultiplesOfMAU));



        // additional data which is referenced in the data structures


        static RegInfo regData[] =
        {

                {"ETFR", "ExtendedTargetFeatureRegisterGroup", 0, 0, eslapi::CADI_REGTYPE_STRING, "Extended Target Features", eslapi::CADI_REG_READ_ONLY, 0, 0, 0, true, 0, false, 0, 0, 0, true/*pseudo*/, true, 0xFFFFFFFF, 0, 0, 0, 0, 0xffffffff, 0, 0, false, false, false},
        {0, "", 0, 0, eslapi::CADI_REGTYPE_HEX, 0, eslapi::CADI_REG_READ_WRITE, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
        };

        // the instance specific data has to be non-static, this is currently only access_data
        // this array is compressed: only registers which have hasInstanceSpecificPointers=true in regData are present here
        RegInfoInstanceSpecific regDataInstanceSpecific[] = {

                {0, 0, 0, 0, MakeDelegate(this, &Component__Cortex_CADI::GetExtendedTargetFeatures), 0, 0},
                {0, 0, 0, 0, 0, 0, 0}
        };

    ParamInfo paramData[] =
    {

        { 0, 0, 0, 0, 0 }
    };



        sg::CADIBase::construct(regData, (sizeof(regData) / sizeof( regData[0])) - 1,
                            regDataInstanceSpecific, sizeof(regDataInstanceSpecific) / sizeof( regDataInstanceSpecific[0]),
                            paramData, sizeof(paramData) / sizeof(paramData[0]));

    strcpy( features.targetName, "Cortex" );
    strcpy( features.targetVersion, "" );
    features.fProfilingAvailable = false;
    features.nExtendedTargetFeaturesRegNumValid = true;
    features.nExtendedTargetFeaturesRegNum = 0;
    features.nPCRegNum = eslapi::CADI_INVALID_REGISTER_ID;
}


eslapi::CADIReturn_t
Component__Cortex_CADI::CADIXfaceBypass(uint32_t commandLength, const char *command, uint32_t maxResponseLength, char *response)
{
    if (!command || (commandLength == 0))
        return eslapi::CADI_STATUS_IllegalArgument;

    const char *param = 0;

    if (IsBypassCommand(commandLength, command, "GetFeatures", &param))
    {
        if ((maxResponseLength > 0) && (response != 0))
        {
            // Feel free to add more features here using the syntax :feature:otherfeature:morefeatures:...:
            strncpy(response,
                    "::MAXVIEWGEN:",
                    maxResponseLength);
            response[maxResponseLength - 1] = 0;
            return eslapi::CADI_STATUS_OK;
        }
        else
            return eslapi::CADI_STATUS_IllegalArgument;
    }
    else
        return CADIBase::CADIXfaceBypass(commandLength, command, maxResponseLength, response);
}


sg::accessfunc::AccessFuncResult
Component__Cortex_CADI::GetExtendedTargetFeatures(MxU32 /*id*/, std::string &data, bool /*se*/)
{
    data = component->getExtendedTargetFeatures();
    return sg::accessfunc::ACCESS_FUNC_OK;
}

} // Cortex_NMS
// ------------------------------------------------------------------------------
// CADI Interface for component Component__PVBus2AMBAPV
// ------------------------------------------------------------------------------

#include "Component__PVBus2AMBAPV_ClassDef.h"

namespace Cortex_NMS {

// constructor
Component__PVBus2AMBAPV_CADI::Component__PVBus2AMBAPV_CADI(Component__PVBus2AMBAPV* parentComponent, sg::ComponentBase* simulationEngine) :
    sg::CADIBase(parentComponent ? parentComponent->getName() : "", simulationEngine),
    component(parentComponent)
{



        // memory blocks
        MxU32 emptySupportedMultiplesOfMAU[32];
        memset(emptySupportedMultiplesOfMAU, 0, sizeof(emptySupportedMultiplesOfMAU));



        // additional data which is referenced in the data structures


        static RegInfo regData[] =
        {

                {"ETFR", "ExtendedTargetFeatureRegisterGroup", 0, 0, eslapi::CADI_REGTYPE_STRING, "Extended Target Features", eslapi::CADI_REG_READ_ONLY, 0, 0, 0, true, 0, false, 0, 0, 0, true/*pseudo*/, true, 0xFFFFFFFF, 0, 0, 0, 0, 0xffffffff, 0, 0, false, false, false},
        {0, "", 0, 0, eslapi::CADI_REGTYPE_HEX, 0, eslapi::CADI_REG_READ_WRITE, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
        };

        // the instance specific data has to be non-static, this is currently only access_data
        // this array is compressed: only registers which have hasInstanceSpecificPointers=true in regData are present here
        RegInfoInstanceSpecific regDataInstanceSpecific[] = {

                {0, 0, 0, 0, MakeDelegate(this, &Component__PVBus2AMBAPV_CADI::GetExtendedTargetFeatures), 0, 0},
                {0, 0, 0, 0, 0, 0, 0}
        };

    ParamInfo paramData[] =
    {
		{ 0x10000001, MakeDelegate(parentComponent, &Component__PVBus2AMBAPV::parameter_read_func), 0, MakeDelegate(parentComponent, &Component__PVBus2AMBAPV::parameter_write_func), 0 },
		{ 0x10000002, MakeDelegate(parentComponent, &Component__PVBus2AMBAPV::parameter_read_func), 0, MakeDelegate(parentComponent, &Component__PVBus2AMBAPV::parameter_write_func), 0 },

        { 0, 0, 0, 0, 0 }
    };



        sg::CADIBase::construct(regData, (sizeof(regData) / sizeof( regData[0])) - 1,
                            regDataInstanceSpecific, sizeof(regDataInstanceSpecific) / sizeof( regDataInstanceSpecific[0]),
                            paramData, sizeof(paramData) / sizeof(paramData[0]));

    strcpy( features.targetName, "PVBus2AMBAPV" );
    strcpy( features.targetVersion, "1.0" );
    features.fProfilingAvailable = false;
    features.nExtendedTargetFeaturesRegNumValid = true;
    features.nExtendedTargetFeaturesRegNum = 0;
    features.nPCRegNum = eslapi::CADI_INVALID_REGISTER_ID;
}


eslapi::CADIReturn_t
Component__PVBus2AMBAPV_CADI::CADIXfaceBypass(uint32_t commandLength, const char *command, uint32_t maxResponseLength, char *response)
{
    if (!command || (commandLength == 0))
        return eslapi::CADI_STATUS_IllegalArgument;

    const char *param = 0;

    if (IsBypassCommand(commandLength, command, "GetFeatures", &param))
    {
        if ((maxResponseLength > 0) && (response != 0))
        {
            // Feel free to add more features here using the syntax :feature:otherfeature:morefeatures:...:
            strncpy(response,
                    "::MAXVIEWGEN:",
                    maxResponseLength);
            response[maxResponseLength - 1] = 0;
            return eslapi::CADI_STATUS_OK;
        }
        else
            return eslapi::CADI_STATUS_IllegalArgument;
    }
    else
        return CADIBase::CADIXfaceBypass(commandLength, command, maxResponseLength, response);
}


sg::accessfunc::AccessFuncResult
Component__PVBus2AMBAPV_CADI::GetExtendedTargetFeatures(MxU32 /*id*/, std::string &data, bool /*se*/)
{
    data = component->getExtendedTargetFeatures();
    return sg::accessfunc::ACCESS_FUNC_OK;
}

} // Cortex_NMS

