#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler intensityTextureSmpSC 2:17
//sampler sampler opacityTexSmpSC 2:18
//sampler sampler sc_ScreenTextureSmpSC 2:23
//sampler sampler sc_ShadowTextureSmpSC 2:24
//texture texture2D intensityTexture 2:1:2:17
//texture texture2D opacityTex 2:2:2:18
//texture texture2D sc_ScreenTexture 2:14:2:23
//texture texture2D sc_ShadowTexture 2:15:2:24
//ubo int UserUniforms 2:26:3968 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[3]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 336:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 432
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1024
//float4 sc_EnvmapDiffuseDims 1040
//float4 sc_EnvmapDiffuseView 1056
//float4 sc_EnvmapSpecularSize 1072
//float4 sc_EnvmapSpecularDims 1088
//float4 sc_EnvmapSpecularView 1104
//float3 sc_EnvmapRotation 1120
//float sc_EnvmapExposure 1136
//float3 sc_Sh 1152:[9]:16
//float sc_ShIntensity 1296
//float4 sc_Time 1312
//float4 sc_UniformConstants 1328
//float4 sc_GeometryInfo 1344
//float4x4 sc_ModelViewProjectionMatrixArray 1360:[2]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray 1488:[2]:64
//float4x4 sc_ViewProjectionMatrixArray 1616:[2]:64
//float4x4 sc_ViewProjectionMatrixInverseArray 1744:[2]:64
//float4x4 sc_ModelViewMatrixArray 1872:[2]:64
//float4x4 sc_ModelViewMatrixInverseArray 2000:[2]:64
//float3x3 sc_ViewNormalMatrixArray 2128:[2]:48
//float3x3 sc_ViewNormalMatrixInverseArray 2224:[2]:48
//float4x4 sc_ProjectionMatrixArray 2320:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2448:[2]:64
//float4x4 sc_ViewMatrixArray 2576:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2704:[2]:64
//float4x4 sc_ModelMatrix 2832
//float4x4 sc_ModelMatrixInverse 2896
//float3x3 sc_NormalMatrix 2960
//float3x3 sc_NormalMatrixInverse 3008
//float3 sc_LocalAabbMin 3056
//float3 sc_LocalAabbMax 3072
//float3 sc_WorldAabbMin 3088
//float3 sc_WorldAabbMax 3104
//float4 sc_WindowToViewportTransform 3120
//sc_Camera_t sc_Camera 3136
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3168
//float4 sc_ShadowColor 3184
//float4x4 sc_ProjectorMatrix 3200
//float _sc_GetFramebufferColorInvalidUsageMarker 3264
//float shaderComplexityValue 3268
//float sc_DisableFrustumCullingMarker 3272
//float4 weights0 3280
//float4 weights1 3296
//float4 weights2 3312
//float4 sc_StereoClipPlanes 3328:[2]:16
//int sc_FallbackInstanceID 3360
//float _sc_framebufferFetchMarker 3364
//float2 sc_TAAJitterOffset 3368
//float strandWidth 3376
//float strandTaper 3380
//float4 sc_StrandDataMapTextureSize 3392
//float clumpInstanceCount 3408
//float clumpRadius 3412
//float clumpTipScale 3416
//float hairstyleInstanceCount 3420
//float hairstyleNoise 3424
//float4 sc_ScreenTextureSize 3440
//float4 sc_ScreenTextureDims 3456
//float4 sc_ScreenTextureView 3472
//float correctedIntensity 3488
//float4 intensityTextureSize 3504
//float4 intensityTextureDims 3520
//float4 intensityTextureView 3536
//float3x3 intensityTextureTransform 3552
//float4 intensityTextureUvMinMax 3600
//float4 intensityTextureBorderColor 3616
//float reflBlurWidth 3632
//float reflBlurMinRough 3636
//float reflBlurMaxRough 3640
//int overrideTimeEnabled 3644
//float overrideTimeElapsed 3648
//float overrideTimeDelta 3652
//int PreviewEnabled 3656
//int PreviewNodeID 3660
//float alphaTestThreshold 3664
//float4 opacityTexSize 3680
//float4 opacityTexDims 3696
//float4 opacityTexView 3712
//float3x3 opacityTexTransform 3728
//float4 opacityTexUvMinMax 3776
//float4 opacityTexBorderColor 3792
//float2 Tweak_N14 3808
//float2 Tweak_N15 3816
//float2 Tweak_N50 3824
//float2 Tweak_N51 3832
//float3 Port_Input0_N006 3840
//float Port_Import_N201 3856
//float Port_Import_N023 3860
//float Port_Import_N010 3864
//float Port_Import_N009 3868
//float2 Port_Import_N011 3872
//float2 Port_Import_N012 3880
//float Port_Speed_N022 3888
//float2 Port_Import_N254 3896
//float Port_Import_N065 3904
//float Port_Import_N055 3908
//float Port_Import_N056 3912
//float2 Port_Import_N026 3920
//float2 Port_Import_N060 3928
//float2 Port_Import_N061 3936
//float Port_Speed_N063 3944
//float2 Port_Import_N255 3952
//float Port_Value2_N001 3960
//}
//ubo float sc_BonesUBO 2:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//spec_const bool BLEND_MODE_AVERAGE 1000
//spec_const bool BLEND_MODE_BRIGHT 1001
//spec_const bool BLEND_MODE_COLOR_BURN 1002
//spec_const bool BLEND_MODE_COLOR_DODGE 1003
//spec_const bool BLEND_MODE_COLOR 1004
//spec_const bool BLEND_MODE_DARKEN 1005
//spec_const bool BLEND_MODE_DIFFERENCE 1006
//spec_const bool BLEND_MODE_DIVIDE 1007
//spec_const bool BLEND_MODE_DIVISION 1008
//spec_const bool BLEND_MODE_EXCLUSION 1009
//spec_const bool BLEND_MODE_FORGRAY 1010
//spec_const bool BLEND_MODE_HARD_GLOW 1011
//spec_const bool BLEND_MODE_HARD_LIGHT 1012
//spec_const bool BLEND_MODE_HARD_MIX 1013
//spec_const bool BLEND_MODE_HARD_PHOENIX 1014
//spec_const bool BLEND_MODE_HARD_REFLECT 1015
//spec_const bool BLEND_MODE_HUE 1016
//spec_const bool BLEND_MODE_INTENSE 1017
//spec_const bool BLEND_MODE_LIGHTEN 1018
//spec_const bool BLEND_MODE_LINEAR_LIGHT 1019
//spec_const bool BLEND_MODE_LUMINOSITY 1020
//spec_const bool BLEND_MODE_NEGATION 1021
//spec_const bool BLEND_MODE_NOTBRIGHT 1022
//spec_const bool BLEND_MODE_OVERLAY 1023
//spec_const bool BLEND_MODE_PIN_LIGHT 1024
//spec_const bool BLEND_MODE_REALISTIC 1025
//spec_const bool BLEND_MODE_SATURATION 1026
//spec_const bool BLEND_MODE_SOFT_LIGHT 1027
//spec_const bool BLEND_MODE_SUBTRACT 1028
//spec_const bool BLEND_MODE_VIVID_LIGHT 1029
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 1030
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1031
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 1032
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1033
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 1034
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1035
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 1036
//spec_const bool Tweak_N16 1037
//spec_const bool Tweak_N25 1038
//spec_const bool Tweak_N2 1039
//spec_const bool Tweak_N52 1040
//spec_const bool Tweak_N67 1041
//spec_const bool UseViewSpaceDepthVariant 1042
//spec_const bool intensityTextureHasSwappedViews 1043
//spec_const bool opacityTexHasSwappedViews 1044
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1045
//spec_const bool sc_BlendMode_Add 1046
//spec_const bool sc_BlendMode_AlphaTest 1047
//spec_const bool sc_BlendMode_AlphaToCoverage 1048
//spec_const bool sc_BlendMode_ColoredGlass 1049
//spec_const bool sc_BlendMode_Custom 1050
//spec_const bool sc_BlendMode_Max 1051
//spec_const bool sc_BlendMode_Min 1052
//spec_const bool sc_BlendMode_MultiplyOriginal 1053
//spec_const bool sc_BlendMode_Multiply 1054
//spec_const bool sc_BlendMode_Normal 1055
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1056
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1057
//spec_const bool sc_BlendMode_PremultipliedAlpha 1058
//spec_const bool sc_BlendMode_Screen 1059
//spec_const bool sc_DepthOnly 1060
//spec_const bool sc_FramebufferFetch 1061
//spec_const bool sc_OITCompositingPass 1062
//spec_const bool sc_OITDepthBoundsPass 1063
//spec_const bool sc_OITDepthGatherPass 1064
//spec_const bool sc_ProjectiveShadowsCaster 1065
//spec_const bool sc_ProjectiveShadowsReceiver 1066
//spec_const bool sc_RenderAlphaToColor 1067
//spec_const bool sc_ScreenTextureHasSwappedViews 1068
//spec_const bool sc_ShaderComplexityAnalyzer 1069
//spec_const bool sc_UseFramebufferFetchMarker 1070
//spec_const bool sc_VertexBlendingUseNormals 1071
//spec_const bool sc_VertexBlending 1072
//spec_const int NODE_13_DROPLIST_ITEM 1073
//spec_const int NODE_27_DROPLIST_ITEM 1074
//spec_const int NODE_49_DROPLIST_ITEM 1075
//spec_const int SC_DEVICE_CLASS 1076
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1077
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 1078
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1079
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 1080
//spec_const int intensityTextureLayout 1081
//spec_const int opacityTexLayout 1082
//spec_const int sc_DepthBufferMode 1083
//spec_const int sc_RenderingSpace 1084
//spec_const int sc_ScreenTextureLayout 1085
//spec_const int sc_SkinBonesCount 1086
//spec_const int sc_StereoRenderingMode 1087
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1088
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(1000)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1001)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(1002)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(1003)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(1004)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(1005)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(1006)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(1007)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(1008)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(1009)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(1010)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(1011)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(1012)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(1013)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(1014)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(1015)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(1016)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(1017)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(1018)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(1019)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(1020)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(1021)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(1022)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(1023)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(1024)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(1025)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(1026)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(1027)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(1028)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(1029)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(1030)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1031)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex [[function_constant(1032)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTex) ? SC_USE_CLAMP_TO_BORDER_opacityTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1033)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_opacityTex [[function_constant(1034)]];
constant bool SC_USE_UV_MIN_MAX_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTex) ? SC_USE_UV_MIN_MAX_opacityTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1035)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_opacityTex [[function_constant(1036)]];
constant bool SC_USE_UV_TRANSFORM_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTex) ? SC_USE_UV_TRANSFORM_opacityTex : false;
constant bool Tweak_N16 [[function_constant(1037)]];
constant bool Tweak_N16_tmp = is_function_constant_defined(Tweak_N16) ? Tweak_N16 : false;
constant bool Tweak_N25 [[function_constant(1038)]];
constant bool Tweak_N25_tmp = is_function_constant_defined(Tweak_N25) ? Tweak_N25 : false;
constant bool Tweak_N2 [[function_constant(1039)]];
constant bool Tweak_N2_tmp = is_function_constant_defined(Tweak_N2) ? Tweak_N2 : false;
constant bool Tweak_N52 [[function_constant(1040)]];
constant bool Tweak_N52_tmp = is_function_constant_defined(Tweak_N52) ? Tweak_N52 : false;
constant bool Tweak_N67 [[function_constant(1041)]];
constant bool Tweak_N67_tmp = is_function_constant_defined(Tweak_N67) ? Tweak_N67 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1042)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool intensityTextureHasSwappedViews [[function_constant(1043)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool opacityTexHasSwappedViews [[function_constant(1044)]];
constant bool opacityTexHasSwappedViews_tmp = is_function_constant_defined(opacityTexHasSwappedViews) ? opacityTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1045)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1046)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1047)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1048)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1049)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1050)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(1051)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1052)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1053)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1054)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1055)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1056)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1057)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1058)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1059)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1060)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(1061)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_OITCompositingPass [[function_constant(1062)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1063)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1064)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1065)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1066)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(1067)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1068)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1069)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1070)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1071)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1072)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int NODE_13_DROPLIST_ITEM [[function_constant(1073)]];
constant int NODE_13_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_13_DROPLIST_ITEM) ? NODE_13_DROPLIST_ITEM : 0;
constant int NODE_27_DROPLIST_ITEM [[function_constant(1074)]];
constant int NODE_27_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_27_DROPLIST_ITEM) ? NODE_27_DROPLIST_ITEM : 0;
constant int NODE_49_DROPLIST_ITEM [[function_constant(1075)]];
constant int NODE_49_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_49_DROPLIST_ITEM) ? NODE_49_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(1076)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1077)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex [[function_constant(1078)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTex) ? SC_SOFTWARE_WRAP_MODE_U_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1079)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex [[function_constant(1080)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTex) ? SC_SOFTWARE_WRAP_MODE_V_opacityTex : -1;
constant int intensityTextureLayout [[function_constant(1081)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int opacityTexLayout [[function_constant(1082)]];
constant int opacityTexLayout_tmp = is_function_constant_defined(opacityTexLayout) ? opacityTexLayout : 0;
constant int sc_DepthBufferMode [[function_constant(1083)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(1084)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1085)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1086)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1087)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1088)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[3];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float2 Tweak_N14;
float2 Tweak_N15;
float2 Tweak_N50;
float2 Tweak_N51;
float3 Port_Input0_N006;
float Port_Import_N201;
float Port_Import_N023;
float Port_Import_N010;
float Port_Import_N009;
float2 Port_Import_N011;
float2 Port_Import_N012;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N026;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float Port_Value2_N001;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set2
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> opacityTex [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
texture2d<float> sc_ShadowTexture [[id(15)]];
sampler intensityTextureSmpSC [[id(17)]];
sampler opacityTexSmpSC [[id(18)]];
sampler sc_ScreenTextureSmpSC [[id(23)]];
sampler sc_ShadowTextureSmpSC [[id(24)]];
constant userUniformsObj* UserUniforms [[id(26)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
sc_Vertex_t l9_2=param;
float Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;
ssGlobals tempGlobals;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_3=l9_2;
float3 l9_4=in.blendShape0Pos;
float3 l9_5=in.blendShape0Normal;
float l9_6=(*sc_set2.UserUniforms).weights0.x;
sc_Vertex_t l9_7=l9_3;
float3 l9_8=l9_4;
float l9_9=l9_6;
float3 l9_10=l9_7.position.xyz+(l9_8*l9_9);
l9_7.position=float4(l9_10.x,l9_10.y,l9_10.z,l9_7.position.w);
l9_3=l9_7;
l9_3.normal+=(l9_5*l9_6);
l9_2=l9_3;
sc_Vertex_t l9_11=l9_2;
float3 l9_12=in.blendShape1Pos;
float3 l9_13=in.blendShape1Normal;
float l9_14=(*sc_set2.UserUniforms).weights0.y;
sc_Vertex_t l9_15=l9_11;
float3 l9_16=l9_12;
float l9_17=l9_14;
float3 l9_18=l9_15.position.xyz+(l9_16*l9_17);
l9_15.position=float4(l9_18.x,l9_18.y,l9_18.z,l9_15.position.w);
l9_11=l9_15;
l9_11.normal+=(l9_13*l9_14);
l9_2=l9_11;
sc_Vertex_t l9_19=l9_2;
float3 l9_20=in.blendShape2Pos;
float3 l9_21=in.blendShape2Normal;
float l9_22=(*sc_set2.UserUniforms).weights0.z;
sc_Vertex_t l9_23=l9_19;
float3 l9_24=l9_20;
float l9_25=l9_22;
float3 l9_26=l9_23.position.xyz+(l9_24*l9_25);
l9_23.position=float4(l9_26.x,l9_26.y,l9_26.z,l9_23.position.w);
l9_19=l9_23;
l9_19.normal+=(l9_21*l9_22);
l9_2=l9_19;
}
else
{
sc_Vertex_t l9_27=l9_2;
float3 l9_28=in.blendShape0Pos;
float l9_29=(*sc_set2.UserUniforms).weights0.x;
float3 l9_30=l9_27.position.xyz+(l9_28*l9_29);
l9_27.position=float4(l9_30.x,l9_30.y,l9_30.z,l9_27.position.w);
l9_2=l9_27;
sc_Vertex_t l9_31=l9_2;
float3 l9_32=in.blendShape1Pos;
float l9_33=(*sc_set2.UserUniforms).weights0.y;
float3 l9_34=l9_31.position.xyz+(l9_32*l9_33);
l9_31.position=float4(l9_34.x,l9_34.y,l9_34.z,l9_31.position.w);
l9_2=l9_31;
sc_Vertex_t l9_35=l9_2;
float3 l9_36=in.blendShape2Pos;
float l9_37=(*sc_set2.UserUniforms).weights0.z;
float3 l9_38=l9_35.position.xyz+(l9_36*l9_37);
l9_35.position=float4(l9_38.x,l9_38.y,l9_38.z,l9_35.position.w);
l9_2=l9_35;
sc_Vertex_t l9_39=l9_2;
float3 l9_40=in.blendShape3Pos;
float l9_41=(*sc_set2.UserUniforms).weights0.w;
float3 l9_42=l9_39.position.xyz+(l9_40*l9_41);
l9_39.position=float4(l9_42.x,l9_42.y,l9_42.z,l9_39.position.w);
l9_2=l9_39;
sc_Vertex_t l9_43=l9_2;
float3 l9_44=in.blendShape4Pos;
float l9_45=(*sc_set2.UserUniforms).weights1.x;
float3 l9_46=l9_43.position.xyz+(l9_44*l9_45);
l9_43.position=float4(l9_46.x,l9_46.y,l9_46.z,l9_43.position.w);
l9_2=l9_43;
sc_Vertex_t l9_47=l9_2;
float3 l9_48=in.blendShape5Pos;
float l9_49=(*sc_set2.UserUniforms).weights1.y;
float3 l9_50=l9_47.position.xyz+(l9_48*l9_49);
l9_47.position=float4(l9_50.x,l9_50.y,l9_50.z,l9_47.position.w);
l9_2=l9_47;
}
}
param=l9_2;
sc_Vertex_t l9_51=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_52=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_52=float4(1.0,fract(in.boneData.yzw));
l9_52.x-=dot(l9_52.yzw,float3(1.0));
}
float4 l9_53=l9_52;
float4 l9_54=l9_53;
int l9_55=0;
int l9_56=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_56=int(in.boneData[l9_55]);
}
int l9_57=l9_56;
int l9_58=l9_57;
int l9_59=1;
int l9_60=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_60=int(in.boneData[l9_59]);
}
int l9_61=l9_60;
int l9_62=l9_61;
int l9_63=2;
int l9_64=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_64=int(in.boneData[l9_63]);
}
int l9_65=l9_64;
int l9_66=l9_65;
int l9_67=3;
int l9_68=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_68=int(in.boneData[l9_67]);
}
int l9_69=l9_68;
int l9_70=l9_69;
int l9_71=l9_58;
float4 l9_72=l9_51.position;
float3 l9_73;
if (sc_SkinBonesCount_tmp>0)
{
int l9_74=l9_71;
float4 l9_75=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[0];
float4 l9_76=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[1];
float4 l9_77=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[2];
float4x3 l9_78=float4x3(float3(l9_75.x,l9_76.x,l9_77.x),float3(l9_75.y,l9_76.y,l9_77.y),float3(l9_75.z,l9_76.z,l9_77.z),float3(l9_75.w,l9_76.w,l9_77.w));
l9_73=l9_78*l9_72;
}
else
{
l9_73=l9_72.xyz;
}
float3 l9_79=l9_73;
float3 l9_80=l9_79;
float l9_81=l9_54.x;
int l9_82=l9_62;
float4 l9_83=l9_51.position;
float3 l9_84;
if (sc_SkinBonesCount_tmp>0)
{
int l9_85=l9_82;
float4 l9_86=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[0];
float4 l9_87=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[1];
float4 l9_88=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[2];
float4x3 l9_89=float4x3(float3(l9_86.x,l9_87.x,l9_88.x),float3(l9_86.y,l9_87.y,l9_88.y),float3(l9_86.z,l9_87.z,l9_88.z),float3(l9_86.w,l9_87.w,l9_88.w));
l9_84=l9_89*l9_83;
}
else
{
l9_84=l9_83.xyz;
}
float3 l9_90=l9_84;
float3 l9_91=l9_90;
float l9_92=l9_54.y;
int l9_93=l9_66;
float4 l9_94=l9_51.position;
float3 l9_95;
if (sc_SkinBonesCount_tmp>0)
{
int l9_96=l9_93;
float4 l9_97=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[0];
float4 l9_98=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[1];
float4 l9_99=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[2];
float4x3 l9_100=float4x3(float3(l9_97.x,l9_98.x,l9_99.x),float3(l9_97.y,l9_98.y,l9_99.y),float3(l9_97.z,l9_98.z,l9_99.z),float3(l9_97.w,l9_98.w,l9_99.w));
l9_95=l9_100*l9_94;
}
else
{
l9_95=l9_94.xyz;
}
float3 l9_101=l9_95;
float3 l9_102=l9_101;
float l9_103=l9_54.z;
int l9_104=l9_70;
float4 l9_105=l9_51.position;
float3 l9_106;
if (sc_SkinBonesCount_tmp>0)
{
int l9_107=l9_104;
float4 l9_108=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[0];
float4 l9_109=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[1];
float4 l9_110=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[2];
float4x3 l9_111=float4x3(float3(l9_108.x,l9_109.x,l9_110.x),float3(l9_108.y,l9_109.y,l9_110.y),float3(l9_108.z,l9_109.z,l9_110.z),float3(l9_108.w,l9_109.w,l9_110.w));
l9_106=l9_111*l9_105;
}
else
{
l9_106=l9_105.xyz;
}
float3 l9_112=l9_106;
float3 l9_113=(((l9_80*l9_81)+(l9_91*l9_92))+(l9_102*l9_103))+(l9_112*l9_54.w);
l9_51.position=float4(l9_113.x,l9_113.y,l9_113.z,l9_51.position.w);
int l9_114=l9_58;
float3x3 l9_115=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[2].xyz));
float3x3 l9_116=l9_115;
float3x3 l9_117=l9_116;
int l9_118=l9_62;
float3x3 l9_119=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[2].xyz));
float3x3 l9_120=l9_119;
float3x3 l9_121=l9_120;
int l9_122=l9_66;
float3x3 l9_123=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[2].xyz));
float3x3 l9_124=l9_123;
float3x3 l9_125=l9_124;
int l9_126=l9_70;
float3x3 l9_127=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[2].xyz));
float3x3 l9_128=l9_127;
float3x3 l9_129=l9_128;
l9_51.normal=((((l9_117*l9_51.normal)*l9_54.x)+((l9_121*l9_51.normal)*l9_54.y))+((l9_125*l9_51.normal)*l9_54.z))+((l9_129*l9_51.normal)*l9_54.w);
l9_51.tangent=((((l9_117*l9_51.tangent)*l9_54.x)+((l9_121*l9_51.tangent)*l9_54.y))+((l9_125*l9_51.tangent)*l9_54.z))+((l9_129*l9_51.tangent)*l9_54.w);
}
param=l9_51;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param.position.xyz;
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set2.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varNormal=(*sc_set2.UserUniforms).sc_NormalMatrix*param.normal;
float3 l9_130=(*sc_set2.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_130.x,l9_130.y,l9_130.z,out.varTangent.w);
}
}
}
}
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
float l9_131;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_131=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_131=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_131;
float l9_132;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_132=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_132=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_132;
float4 ScreenPosition=float4(0.0);
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_1=v;
float3 param_2=WorldPosition;
float3 param_3=WorldNormal;
float3 param_4=WorldTangent;
float4 param_5=v.position;
out.varPos=param_2;
out.varNormal=normalize(param_3);
float3 l9_133=normalize(param_4);
out.varTangent=float4(l9_133.x,l9_133.y,l9_133.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_134=param_1.position;
float4 l9_135;
if (sc_RenderingSpace_tmp==3)
{
int l9_136;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_135=(*sc_set2.UserUniforms).sc_ProjectionMatrixInverseArray[l9_137]*l9_134;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_138;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_135=(*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_139]*l9_134;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_140;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_135=(*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_141]*l9_134;
}
else
{
l9_135=l9_134;
}
}
}
float4 l9_142=l9_135;
out.varViewSpaceDepth=-l9_142.z;
}
float4 l9_143=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_143=param_5;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_144;
if (sc_StereoRenderingMode_tmp==0)
{
l9_144=0;
}
else
{
l9_144=gl_InstanceIndex%2;
}
int l9_145=l9_144;
l9_143=((*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_145]*param_1.position)*float4(1.0/(*sc_set2.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_146;
if (sc_StereoRenderingMode_tmp==0)
{
l9_146=0;
}
else
{
l9_146=gl_InstanceIndex%2;
}
int l9_147=l9_146;
l9_143=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_147]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_148;
if (sc_StereoRenderingMode_tmp==0)
{
l9_148=0;
}
else
{
l9_148=gl_InstanceIndex%2;
}
int l9_149=l9_148;
l9_143=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_149]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_1.texture0,param_1.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_150=param_1.position;
float4 l9_151=l9_150;
if (sc_RenderingSpace_tmp==1)
{
l9_151=(*sc_set2.UserUniforms).sc_ModelMatrix*l9_150;
}
float4 l9_152=(*sc_set2.UserUniforms).sc_ProjectorMatrix*l9_151;
float2 l9_153=((l9_152.xy/float2(l9_152.w))*0.5)+float2(0.5);
out.varShadowTex=l9_153;
}
float4 l9_154=l9_143;
if (sc_DepthBufferMode_tmp==1)
{
float l9_155=2.0/log2((*sc_set2.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_154.z=((log2(fast::max((*sc_set2.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_154.w))*l9_155)-1.0)*l9_154.w;
}
float4 l9_156=l9_154;
l9_143=l9_156;
float4 l9_157=l9_143;
float4 l9_158=l9_157;
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_159=l9_158;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_160=dot(l9_159,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_161=l9_160;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
float l9_162=l9_161;
}
else
{
out.varClipDistance=l9_161;
}
}
float4 l9_163=float4(l9_158.x,-l9_158.y,(l9_158.z*0.5)+(l9_158.w*0.5),l9_158.w);
out.gl_Position=l9_163;
v=param_1;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[3];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float2 Tweak_N14;
float2 Tweak_N15;
float2 Tweak_N50;
float2 Tweak_N51;
float3 Port_Input0_N006;
float Port_Import_N201;
float Port_Import_N023;
float Port_Import_N010;
float Port_Import_N009;
float2 Port_Import_N011;
float2 Port_Import_N012;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N026;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float Port_Value2_N001;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set2
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> opacityTex [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
texture2d<float> sc_ShadowTexture [[id(15)]];
sampler intensityTextureSmpSC [[id(17)]];
sampler opacityTexSmpSC [[id(18)]];
sampler sc_ScreenTextureSmpSC [[id(23)]];
sampler sc_ShadowTextureSmpSC [[id(24)]];
constant userUniformsObj* UserUniforms [[id(26)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.666667);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.333333);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res;
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
float3 tmpColor;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.666667);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.333333);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.666667);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.333333);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.666667);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.333333);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.666667);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.333333);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.666667);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.333333);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.666667);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.333333);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.666667);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.333333);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.666667);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.333333);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.299*l9_223.x)+(0.587*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
float2 l9_228=UserUniforms.intensityTextureDims.xy;
float2 l9_229=l9_228;
int l9_230;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_231;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_230=1-l9_232;
}
else
{
int l9_233;
if (sc_StereoRenderingMode_tmp==0)
{
l9_233=0;
}
else
{
l9_233=varStereoViewID;
}
int l9_234=l9_233;
l9_230=l9_234;
}
int l9_235=l9_230;
float2 l9_236=l9_229;
int l9_237=intensityTextureLayout_tmp;
int l9_238=l9_235;
float2 l9_239=float2(l9_227,0.5);
bool l9_240=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_241=UserUniforms.intensityTextureTransform;
int2 l9_242=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_243=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_244=UserUniforms.intensityTextureUvMinMax;
bool l9_245=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_246=UserUniforms.intensityTextureBorderColor;
float l9_247=0.0;
bool l9_248=l9_245&&(!l9_243);
float l9_249=1.0;
float l9_250=l9_239.x;
int l9_251=l9_242.x;
if (l9_251==1)
{
l9_250=fract(l9_250);
}
else
{
if (l9_251==2)
{
float l9_252=fract(l9_250);
float l9_253=l9_250-l9_252;
float l9_254=step(0.25,fract(l9_253*0.5));
l9_250=mix(l9_252,1.0-l9_252,fast::clamp(l9_254,0.0,1.0));
}
}
l9_239.x=l9_250;
float l9_255=l9_239.y;
int l9_256=l9_242.y;
if (l9_256==1)
{
l9_255=fract(l9_255);
}
else
{
if (l9_256==2)
{
float l9_257=fract(l9_255);
float l9_258=l9_255-l9_257;
float l9_259=step(0.25,fract(l9_258*0.5));
l9_255=mix(l9_257,1.0-l9_257,fast::clamp(l9_259,0.0,1.0));
}
}
l9_239.y=l9_255;
if (l9_243)
{
bool l9_260=l9_245;
bool l9_261;
if (l9_260)
{
l9_261=l9_242.x==3;
}
else
{
l9_261=l9_260;
}
float l9_262=l9_239.x;
float l9_263=l9_244.x;
float l9_264=l9_244.z;
bool l9_265=l9_261;
float l9_266=l9_249;
float l9_267=fast::clamp(l9_262,l9_263,l9_264);
float l9_268=step(abs(l9_262-l9_267),1e-05);
l9_266*=(l9_268+((1.0-float(l9_265))*(1.0-l9_268)));
l9_262=l9_267;
l9_239.x=l9_262;
l9_249=l9_266;
bool l9_269=l9_245;
bool l9_270;
if (l9_269)
{
l9_270=l9_242.y==3;
}
else
{
l9_270=l9_269;
}
float l9_271=l9_239.y;
float l9_272=l9_244.y;
float l9_273=l9_244.w;
bool l9_274=l9_270;
float l9_275=l9_249;
float l9_276=fast::clamp(l9_271,l9_272,l9_273);
float l9_277=step(abs(l9_271-l9_276),1e-05);
l9_275*=(l9_277+((1.0-float(l9_274))*(1.0-l9_277)));
l9_271=l9_276;
l9_239.y=l9_271;
l9_249=l9_275;
}
float2 l9_278=l9_239;
bool l9_279=l9_240;
float3x3 l9_280=l9_241;
if (l9_279)
{
l9_278=float2((l9_280*float3(l9_278,1.0)).xy);
}
float2 l9_281=l9_278;
float2 l9_282=l9_281;
float2 l9_283=l9_282;
l9_239=l9_283;
float l9_284=l9_239.x;
int l9_285=l9_242.x;
bool l9_286=l9_248;
float l9_287=l9_249;
if ((l9_285==0)||(l9_285==3))
{
float l9_288=l9_284;
float l9_289=0.0;
float l9_290=1.0;
bool l9_291=l9_286;
float l9_292=l9_287;
float l9_293=fast::clamp(l9_288,l9_289,l9_290);
float l9_294=step(abs(l9_288-l9_293),1e-05);
l9_292*=(l9_294+((1.0-float(l9_291))*(1.0-l9_294)));
l9_288=l9_293;
l9_284=l9_288;
l9_287=l9_292;
}
l9_239.x=l9_284;
l9_249=l9_287;
float l9_295=l9_239.y;
int l9_296=l9_242.y;
bool l9_297=l9_248;
float l9_298=l9_249;
if ((l9_296==0)||(l9_296==3))
{
float l9_299=l9_295;
float l9_300=0.0;
float l9_301=1.0;
bool l9_302=l9_297;
float l9_303=l9_298;
float l9_304=fast::clamp(l9_299,l9_300,l9_301);
float l9_305=step(abs(l9_299-l9_304),1e-05);
l9_303*=(l9_305+((1.0-float(l9_302))*(1.0-l9_305)));
l9_299=l9_304;
l9_295=l9_299;
l9_298=l9_303;
}
l9_239.y=l9_295;
l9_249=l9_298;
float2 l9_306=l9_236;
float2 l9_307=l9_239;
int l9_308=l9_237;
int l9_309=l9_238;
float l9_310=l9_247;
float2 l9_311=l9_307;
int l9_312=l9_308;
int l9_313=l9_309;
float3 l9_314;
if (l9_312==0)
{
l9_314=float3(l9_311,0.0);
}
else
{
if (l9_312==1)
{
l9_314=float3(l9_311.x,(l9_311.y*0.5)+(0.5-(float(l9_313)*0.5)),0.0);
}
else
{
l9_314=float3(l9_311,float(l9_313));
}
}
float3 l9_315=l9_314;
float3 l9_316=l9_315;
float2 l9_317=l9_306;
float2 l9_318=l9_316.xy;
float l9_319=l9_310;
float4 l9_320=intensityTexture.sample(intensityTextureSmpSC,l9_318,bias(l9_319));
float4 l9_321=l9_320;
float4 l9_322=l9_321;
if (l9_245)
{
l9_322=mix(l9_246,l9_322,float4(l9_249));
}
float4 l9_323=l9_322;
float4 l9_324=l9_323;
float3 l9_325=l9_323.xyz;
float3 l9_326=l9_325;
float l9_327=16.0;
float l9_328=((((l9_326.x*256.0)+l9_326.y)+(l9_326.z/256.0))/257.004)*l9_327;
float l9_329=l9_328;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_329=fast::max(l9_329,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_329=fast::min(l9_329,1.0);
}
float l9_330=l9_225;
float3 l9_331=param_8;
float3 l9_332=param_9;
float l9_333=l9_226;
float l9_334=l9_329;
float3 l9_335=transformColor(l9_330,l9_331,l9_332,l9_333,l9_334);
return l9_335;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
ssPreviewInfo PreviewInfo;
float Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;
ssGlobals tempGlobals;
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float l9_0;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_2=gl_FragCoord;
float2 l9_3=(l9_2.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_4=l9_3;
float2 l9_5;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_6=float3(l9_4,0.0);
int l9_7=1;
int l9_8;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8=0;
}
else
{
l9_8=in.varStereoViewID;
}
int l9_9=l9_8;
int l9_10=l9_9;
float3 l9_11=float3(l9_4,0.0);
int l9_12=l9_7;
int l9_13=l9_10;
if (l9_12==1)
{
l9_11.y=((2.0*l9_11.y)+float(l9_13))-1.0;
}
float2 l9_14=l9_11.xy;
l9_5=l9_14;
}
else
{
l9_5=l9_4;
}
float2 l9_15=l9_5;
float2 l9_16=l9_15;
float2 l9_17=l9_16;
Globals.gScreenCoord=l9_17;
float3 Output_N3=float3(0.0);
float param=1.0;
float3 param_1=float3(1.0);
float3 param_2=float3(0.0);
ssGlobals param_4=Globals;
float3 param_3;
if ((int(Tweak_N2_tmp)!=0))
{
float3 l9_18=float3(0.0);
ssGlobals l9_19=param_4;
float3 l9_20;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_21;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_22=abs(in.varShadowTex-float2(0.5));
float l9_23=fast::max(l9_22.x,l9_22.y);
float l9_24=step(l9_23,0.5);
float4 l9_25=sc_set2.sc_ShadowTexture.sample(sc_set2.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_24;
float3 l9_26=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_25.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float l9_27=l9_25.w*(*sc_set2.UserUniforms).sc_ShadowDensity;
l9_21=mix(float3(1.0),l9_26,float3(l9_27));
}
else
{
l9_21=float3(1.0);
}
float3 l9_28=l9_21;
l9_20=l9_28;
}
else
{
l9_20=float3(1.0);
}
l9_18=l9_20;
float2 l9_29=float2(0.0);
float l9_30=0.0;
float2 l9_31=float2(0.0);
float2 l9_32=float2(0.0);
float2 l9_33=float2(0.0);
float2 l9_34=float2(0.0);
float2 l9_35=float2(0.0);
ssGlobals l9_36=param_4;
float2 l9_37;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_38=float2(0.0);
l9_38=l9_36.Surface_UVCoord0;
l9_31=l9_38;
l9_37=l9_31;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_39=float2(0.0);
l9_39=l9_36.Surface_UVCoord1;
l9_32=l9_39;
l9_37=l9_32;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_40=float2(0.0);
float l9_41=0.0;
float2 l9_42=float2(0.0);
float2 l9_43=float2(0.0);
ssGlobals l9_44=l9_36;
float2 l9_45;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_46=float2(0.0);
float l9_47=0.0;
float2 l9_48=float2(0.0);
float2 l9_49=float2(0.0);
ssGlobals l9_50=l9_44;
float2 l9_51;
if ((int(Tweak_N16_tmp)!=0))
{
float2 l9_52=float2(0.0);
float l9_53=0.0;
float2 l9_54=float2(0.0);
float2 l9_55=float2(0.0);
float2 l9_56=float2(0.0);
float2 l9_57=float2(0.0);
ssGlobals l9_58=l9_50;
float2 l9_59;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_60=float2(0.0);
l9_60=l9_58.Surface_UVCoord0;
l9_54=l9_60;
l9_59=l9_54;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_61=float2(0.0);
l9_61=l9_58.Surface_UVCoord1;
l9_55=l9_61;
l9_59=l9_55;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_62=float2(0.0);
l9_62=l9_58.gScreenCoord;
l9_56=l9_62;
l9_59=l9_56;
}
else
{
float2 l9_63=float2(0.0);
l9_63=l9_58.Surface_UVCoord0;
l9_57=l9_63;
l9_59=l9_57;
}
}
}
l9_52=l9_59;
float2 l9_64=float2(0.0);
ssGlobals l9_65=l9_50;
float2 l9_66=(*sc_set2.UserUniforms).Tweak_N14;
l9_64=l9_66;
float2 l9_67=float2(0.0);
l9_67=l9_64;
float2 l9_68=float2(0.0);
ssGlobals l9_69=l9_50;
float2 l9_70=(*sc_set2.UserUniforms).Tweak_N15;
l9_68=l9_70;
float2 l9_71=float2(0.0);
l9_71=l9_68;
float2 l9_72=float2(0.0);
l9_72=(l9_52*l9_67)+l9_71;
float2 l9_73=float2(0.0);
l9_73=l9_72+(l9_71*(l9_50.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_48=l9_73;
l9_51=l9_48;
}
else
{
float2 l9_74=float2(0.0);
float l9_75=0.0;
float2 l9_76=float2(0.0);
float2 l9_77=float2(0.0);
float2 l9_78=float2(0.0);
float2 l9_79=float2(0.0);
ssGlobals l9_80=l9_50;
float2 l9_81;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_82=float2(0.0);
l9_82=l9_80.Surface_UVCoord0;
l9_76=l9_82;
l9_81=l9_76;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_83=float2(0.0);
l9_83=l9_80.Surface_UVCoord1;
l9_77=l9_83;
l9_81=l9_77;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_84=float2(0.0);
l9_84=l9_80.gScreenCoord;
l9_78=l9_84;
l9_81=l9_78;
}
else
{
float2 l9_85=float2(0.0);
l9_85=l9_80.Surface_UVCoord0;
l9_79=l9_85;
l9_81=l9_79;
}
}
}
l9_74=l9_81;
float2 l9_86=float2(0.0);
ssGlobals l9_87=l9_50;
float2 l9_88=(*sc_set2.UserUniforms).Tweak_N14;
l9_86=l9_88;
float2 l9_89=float2(0.0);
l9_89=l9_86;
float2 l9_90=float2(0.0);
ssGlobals l9_91=l9_50;
float2 l9_92=(*sc_set2.UserUniforms).Tweak_N15;
l9_90=l9_92;
float2 l9_93=float2(0.0);
l9_93=l9_90;
float2 l9_94=float2(0.0);
l9_94=(l9_74*l9_89)+l9_93;
l9_49=l9_94;
l9_51=l9_49;
}
l9_46=l9_51;
l9_42=l9_46;
l9_45=l9_42;
}
else
{
float2 l9_95=float2(0.0);
l9_95=l9_44.Surface_UVCoord0;
l9_43=l9_95;
l9_45=l9_43;
}
l9_40=l9_45;
float2 l9_96=float2(0.0);
l9_96=l9_40;
float2 l9_97=float2(0.0);
l9_97=l9_96;
l9_33=l9_97;
l9_37=l9_33;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_98=float2(0.0);
float l9_99=0.0;
float2 l9_100=float2(0.0);
float2 l9_101=float2(0.0);
ssGlobals l9_102=l9_36;
float2 l9_103;
if ((int(Tweak_N25_tmp)!=0))
{
float2 l9_104=float2(0.0);
float l9_105=0.0;
float2 l9_106=float2(0.0);
float2 l9_107=float2(0.0);
ssGlobals l9_108=l9_102;
float2 l9_109;
if ((int(Tweak_N52_tmp)!=0))
{
float2 l9_110=float2(0.0);
float l9_111=0.0;
float2 l9_112=float2(0.0);
float2 l9_113=float2(0.0);
float2 l9_114=float2(0.0);
float2 l9_115=float2(0.0);
float2 l9_116=float2(0.0);
ssGlobals l9_117=l9_108;
float2 l9_118;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_119=float2(0.0);
l9_119=l9_117.Surface_UVCoord0;
l9_112=l9_119;
l9_118=l9_112;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_120=float2(0.0);
l9_120=l9_117.Surface_UVCoord1;
l9_113=l9_120;
l9_118=l9_113;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_121=float2(0.0);
l9_121=l9_117.gScreenCoord;
l9_114=l9_121;
l9_118=l9_114;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_122=float2(0.0);
float l9_123=0.0;
float2 l9_124=float2(0.0);
float2 l9_125=float2(0.0);
ssGlobals l9_126=l9_117;
float2 l9_127;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_128=float2(0.0);
float l9_129=0.0;
float2 l9_130=float2(0.0);
float2 l9_131=float2(0.0);
ssGlobals l9_132=l9_126;
float2 l9_133;
if ((int(Tweak_N16_tmp)!=0))
{
float2 l9_134=float2(0.0);
float l9_135=0.0;
float2 l9_136=float2(0.0);
float2 l9_137=float2(0.0);
float2 l9_138=float2(0.0);
float2 l9_139=float2(0.0);
ssGlobals l9_140=l9_132;
float2 l9_141;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_142=float2(0.0);
l9_142=l9_140.Surface_UVCoord0;
l9_136=l9_142;
l9_141=l9_136;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_143=float2(0.0);
l9_143=l9_140.Surface_UVCoord1;
l9_137=l9_143;
l9_141=l9_137;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_144=float2(0.0);
l9_144=l9_140.gScreenCoord;
l9_138=l9_144;
l9_141=l9_138;
}
else
{
float2 l9_145=float2(0.0);
l9_145=l9_140.Surface_UVCoord0;
l9_139=l9_145;
l9_141=l9_139;
}
}
}
l9_134=l9_141;
float2 l9_146=float2(0.0);
ssGlobals l9_147=l9_132;
float2 l9_148=(*sc_set2.UserUniforms).Tweak_N14;
l9_146=l9_148;
float2 l9_149=float2(0.0);
l9_149=l9_146;
float2 l9_150=float2(0.0);
ssGlobals l9_151=l9_132;
float2 l9_152=(*sc_set2.UserUniforms).Tweak_N15;
l9_150=l9_152;
float2 l9_153=float2(0.0);
l9_153=l9_150;
float2 l9_154=float2(0.0);
l9_154=(l9_134*l9_149)+l9_153;
float2 l9_155=float2(0.0);
l9_155=l9_154+(l9_153*(l9_132.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_130=l9_155;
l9_133=l9_130;
}
else
{
float2 l9_156=float2(0.0);
float l9_157=0.0;
float2 l9_158=float2(0.0);
float2 l9_159=float2(0.0);
float2 l9_160=float2(0.0);
float2 l9_161=float2(0.0);
ssGlobals l9_162=l9_132;
float2 l9_163;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_164=float2(0.0);
l9_164=l9_162.Surface_UVCoord0;
l9_158=l9_164;
l9_163=l9_158;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_165=float2(0.0);
l9_165=l9_162.Surface_UVCoord1;
l9_159=l9_165;
l9_163=l9_159;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_166=float2(0.0);
l9_166=l9_162.gScreenCoord;
l9_160=l9_166;
l9_163=l9_160;
}
else
{
float2 l9_167=float2(0.0);
l9_167=l9_162.Surface_UVCoord0;
l9_161=l9_167;
l9_163=l9_161;
}
}
}
l9_156=l9_163;
float2 l9_168=float2(0.0);
ssGlobals l9_169=l9_132;
float2 l9_170=(*sc_set2.UserUniforms).Tweak_N14;
l9_168=l9_170;
float2 l9_171=float2(0.0);
l9_171=l9_168;
float2 l9_172=float2(0.0);
ssGlobals l9_173=l9_132;
float2 l9_174=(*sc_set2.UserUniforms).Tweak_N15;
l9_172=l9_174;
float2 l9_175=float2(0.0);
l9_175=l9_172;
float2 l9_176=float2(0.0);
l9_176=(l9_156*l9_171)+l9_175;
l9_131=l9_176;
l9_133=l9_131;
}
l9_128=l9_133;
l9_124=l9_128;
l9_127=l9_124;
}
else
{
float2 l9_177=float2(0.0);
l9_177=l9_126.Surface_UVCoord0;
l9_125=l9_177;
l9_127=l9_125;
}
l9_122=l9_127;
float2 l9_178=float2(0.0);
l9_178=l9_122;
float2 l9_179=float2(0.0);
l9_179=l9_178;
l9_115=l9_179;
l9_118=l9_115;
}
else
{
float2 l9_180=float2(0.0);
l9_180=l9_117.Surface_UVCoord0;
l9_116=l9_180;
l9_118=l9_116;
}
}
}
}
l9_110=l9_118;
float2 l9_181=float2(0.0);
ssGlobals l9_182=l9_108;
float2 l9_183=(*sc_set2.UserUniforms).Tweak_N50;
l9_181=l9_183;
float2 l9_184=float2(0.0);
l9_184=l9_181;
float2 l9_185=float2(0.0);
ssGlobals l9_186=l9_108;
float2 l9_187=(*sc_set2.UserUniforms).Tweak_N51;
l9_185=l9_187;
float2 l9_188=float2(0.0);
l9_188=l9_185;
float2 l9_189=float2(0.0);
l9_189=(l9_110*l9_184)+l9_188;
float2 l9_190=float2(0.0);
l9_190=l9_189+(l9_188*(l9_108.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_106=l9_190;
l9_109=l9_106;
}
else
{
float2 l9_191=float2(0.0);
float l9_192=0.0;
float2 l9_193=float2(0.0);
float2 l9_194=float2(0.0);
float2 l9_195=float2(0.0);
float2 l9_196=float2(0.0);
float2 l9_197=float2(0.0);
ssGlobals l9_198=l9_108;
float2 l9_199;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_200=float2(0.0);
l9_200=l9_198.Surface_UVCoord0;
l9_193=l9_200;
l9_199=l9_193;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_201=float2(0.0);
l9_201=l9_198.Surface_UVCoord1;
l9_194=l9_201;
l9_199=l9_194;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_202=float2(0.0);
l9_202=l9_198.gScreenCoord;
l9_195=l9_202;
l9_199=l9_195;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_203=float2(0.0);
float l9_204=0.0;
float2 l9_205=float2(0.0);
float2 l9_206=float2(0.0);
ssGlobals l9_207=l9_198;
float2 l9_208;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_209=float2(0.0);
float l9_210=0.0;
float2 l9_211=float2(0.0);
float2 l9_212=float2(0.0);
ssGlobals l9_213=l9_207;
float2 l9_214;
if ((int(Tweak_N16_tmp)!=0))
{
float2 l9_215=float2(0.0);
float l9_216=0.0;
float2 l9_217=float2(0.0);
float2 l9_218=float2(0.0);
float2 l9_219=float2(0.0);
float2 l9_220=float2(0.0);
ssGlobals l9_221=l9_213;
float2 l9_222;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_223=float2(0.0);
l9_223=l9_221.Surface_UVCoord0;
l9_217=l9_223;
l9_222=l9_217;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_224=float2(0.0);
l9_224=l9_221.Surface_UVCoord1;
l9_218=l9_224;
l9_222=l9_218;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_225=float2(0.0);
l9_225=l9_221.gScreenCoord;
l9_219=l9_225;
l9_222=l9_219;
}
else
{
float2 l9_226=float2(0.0);
l9_226=l9_221.Surface_UVCoord0;
l9_220=l9_226;
l9_222=l9_220;
}
}
}
l9_215=l9_222;
float2 l9_227=float2(0.0);
ssGlobals l9_228=l9_213;
float2 l9_229=(*sc_set2.UserUniforms).Tweak_N14;
l9_227=l9_229;
float2 l9_230=float2(0.0);
l9_230=l9_227;
float2 l9_231=float2(0.0);
ssGlobals l9_232=l9_213;
float2 l9_233=(*sc_set2.UserUniforms).Tweak_N15;
l9_231=l9_233;
float2 l9_234=float2(0.0);
l9_234=l9_231;
float2 l9_235=float2(0.0);
l9_235=(l9_215*l9_230)+l9_234;
float2 l9_236=float2(0.0);
l9_236=l9_235+(l9_234*(l9_213.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_211=l9_236;
l9_214=l9_211;
}
else
{
float2 l9_237=float2(0.0);
float l9_238=0.0;
float2 l9_239=float2(0.0);
float2 l9_240=float2(0.0);
float2 l9_241=float2(0.0);
float2 l9_242=float2(0.0);
ssGlobals l9_243=l9_213;
float2 l9_244;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_245=float2(0.0);
l9_245=l9_243.Surface_UVCoord0;
l9_239=l9_245;
l9_244=l9_239;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_246=float2(0.0);
l9_246=l9_243.Surface_UVCoord1;
l9_240=l9_246;
l9_244=l9_240;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_247=float2(0.0);
l9_247=l9_243.gScreenCoord;
l9_241=l9_247;
l9_244=l9_241;
}
else
{
float2 l9_248=float2(0.0);
l9_248=l9_243.Surface_UVCoord0;
l9_242=l9_248;
l9_244=l9_242;
}
}
}
l9_237=l9_244;
float2 l9_249=float2(0.0);
ssGlobals l9_250=l9_213;
float2 l9_251=(*sc_set2.UserUniforms).Tweak_N14;
l9_249=l9_251;
float2 l9_252=float2(0.0);
l9_252=l9_249;
float2 l9_253=float2(0.0);
ssGlobals l9_254=l9_213;
float2 l9_255=(*sc_set2.UserUniforms).Tweak_N15;
l9_253=l9_255;
float2 l9_256=float2(0.0);
l9_256=l9_253;
float2 l9_257=float2(0.0);
l9_257=(l9_237*l9_252)+l9_256;
l9_212=l9_257;
l9_214=l9_212;
}
l9_209=l9_214;
l9_205=l9_209;
l9_208=l9_205;
}
else
{
float2 l9_258=float2(0.0);
l9_258=l9_207.Surface_UVCoord0;
l9_206=l9_258;
l9_208=l9_206;
}
l9_203=l9_208;
float2 l9_259=float2(0.0);
l9_259=l9_203;
float2 l9_260=float2(0.0);
l9_260=l9_259;
l9_196=l9_260;
l9_199=l9_196;
}
else
{
float2 l9_261=float2(0.0);
l9_261=l9_198.Surface_UVCoord0;
l9_197=l9_261;
l9_199=l9_197;
}
}
}
}
l9_191=l9_199;
float2 l9_262=float2(0.0);
ssGlobals l9_263=l9_108;
float2 l9_264=(*sc_set2.UserUniforms).Tweak_N50;
l9_262=l9_264;
float2 l9_265=float2(0.0);
l9_265=l9_262;
float2 l9_266=float2(0.0);
ssGlobals l9_267=l9_108;
float2 l9_268=(*sc_set2.UserUniforms).Tweak_N51;
l9_266=l9_268;
float2 l9_269=float2(0.0);
l9_269=l9_266;
float2 l9_270=float2(0.0);
l9_270=(l9_191*l9_265)+l9_269;
l9_107=l9_270;
l9_109=l9_107;
}
l9_104=l9_109;
l9_100=l9_104;
l9_103=l9_100;
}
else
{
float2 l9_271=float2(0.0);
l9_271=l9_102.Surface_UVCoord0;
l9_101=l9_271;
l9_103=l9_101;
}
l9_98=l9_103;
float2 l9_272=float2(0.0);
l9_272=l9_98;
float2 l9_273=float2(0.0);
l9_273=l9_272;
l9_34=l9_273;
l9_37=l9_34;
}
else
{
float2 l9_274=float2(0.0);
l9_274=l9_36.Surface_UVCoord0;
l9_35=l9_274;
l9_37=l9_35;
}
}
}
}
l9_29=l9_37;
float4 l9_275=float4(0.0);
float2 l9_276=(*sc_set2.UserUniforms).opacityTexDims.xy;
float2 l9_277=l9_276;
int l9_278;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_279;
if (sc_StereoRenderingMode_tmp==0)
{
l9_279=0;
}
else
{
l9_279=in.varStereoViewID;
}
int l9_280=l9_279;
l9_278=1-l9_280;
}
else
{
int l9_281;
if (sc_StereoRenderingMode_tmp==0)
{
l9_281=0;
}
else
{
l9_281=in.varStereoViewID;
}
int l9_282=l9_281;
l9_278=l9_282;
}
int l9_283=l9_278;
float2 l9_284=l9_277;
int l9_285=opacityTexLayout_tmp;
int l9_286=l9_283;
float2 l9_287=l9_29;
bool l9_288=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_289=(*sc_set2.UserUniforms).opacityTexTransform;
int2 l9_290=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_291=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_292=(*sc_set2.UserUniforms).opacityTexUvMinMax;
bool l9_293=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_294=(*sc_set2.UserUniforms).opacityTexBorderColor;
float l9_295=0.0;
bool l9_296=l9_293&&(!l9_291);
float l9_297=1.0;
float l9_298=l9_287.x;
int l9_299=l9_290.x;
if (l9_299==1)
{
l9_298=fract(l9_298);
}
else
{
if (l9_299==2)
{
float l9_300=fract(l9_298);
float l9_301=l9_298-l9_300;
float l9_302=step(0.25,fract(l9_301*0.5));
l9_298=mix(l9_300,1.0-l9_300,fast::clamp(l9_302,0.0,1.0));
}
}
l9_287.x=l9_298;
float l9_303=l9_287.y;
int l9_304=l9_290.y;
if (l9_304==1)
{
l9_303=fract(l9_303);
}
else
{
if (l9_304==2)
{
float l9_305=fract(l9_303);
float l9_306=l9_303-l9_305;
float l9_307=step(0.25,fract(l9_306*0.5));
l9_303=mix(l9_305,1.0-l9_305,fast::clamp(l9_307,0.0,1.0));
}
}
l9_287.y=l9_303;
if (l9_291)
{
bool l9_308=l9_293;
bool l9_309;
if (l9_308)
{
l9_309=l9_290.x==3;
}
else
{
l9_309=l9_308;
}
float l9_310=l9_287.x;
float l9_311=l9_292.x;
float l9_312=l9_292.z;
bool l9_313=l9_309;
float l9_314=l9_297;
float l9_315=fast::clamp(l9_310,l9_311,l9_312);
float l9_316=step(abs(l9_310-l9_315),1e-05);
l9_314*=(l9_316+((1.0-float(l9_313))*(1.0-l9_316)));
l9_310=l9_315;
l9_287.x=l9_310;
l9_297=l9_314;
bool l9_317=l9_293;
bool l9_318;
if (l9_317)
{
l9_318=l9_290.y==3;
}
else
{
l9_318=l9_317;
}
float l9_319=l9_287.y;
float l9_320=l9_292.y;
float l9_321=l9_292.w;
bool l9_322=l9_318;
float l9_323=l9_297;
float l9_324=fast::clamp(l9_319,l9_320,l9_321);
float l9_325=step(abs(l9_319-l9_324),1e-05);
l9_323*=(l9_325+((1.0-float(l9_322))*(1.0-l9_325)));
l9_319=l9_324;
l9_287.y=l9_319;
l9_297=l9_323;
}
float2 l9_326=l9_287;
bool l9_327=l9_288;
float3x3 l9_328=l9_289;
if (l9_327)
{
l9_326=float2((l9_328*float3(l9_326,1.0)).xy);
}
float2 l9_329=l9_326;
float2 l9_330=l9_329;
float2 l9_331=l9_330;
l9_287=l9_331;
float l9_332=l9_287.x;
int l9_333=l9_290.x;
bool l9_334=l9_296;
float l9_335=l9_297;
if ((l9_333==0)||(l9_333==3))
{
float l9_336=l9_332;
float l9_337=0.0;
float l9_338=1.0;
bool l9_339=l9_334;
float l9_340=l9_335;
float l9_341=fast::clamp(l9_336,l9_337,l9_338);
float l9_342=step(abs(l9_336-l9_341),1e-05);
l9_340*=(l9_342+((1.0-float(l9_339))*(1.0-l9_342)));
l9_336=l9_341;
l9_332=l9_336;
l9_335=l9_340;
}
l9_287.x=l9_332;
l9_297=l9_335;
float l9_343=l9_287.y;
int l9_344=l9_290.y;
bool l9_345=l9_296;
float l9_346=l9_297;
if ((l9_344==0)||(l9_344==3))
{
float l9_347=l9_343;
float l9_348=0.0;
float l9_349=1.0;
bool l9_350=l9_345;
float l9_351=l9_346;
float l9_352=fast::clamp(l9_347,l9_348,l9_349);
float l9_353=step(abs(l9_347-l9_352),1e-05);
l9_351*=(l9_353+((1.0-float(l9_350))*(1.0-l9_353)));
l9_347=l9_352;
l9_343=l9_347;
l9_346=l9_351;
}
l9_287.y=l9_343;
l9_297=l9_346;
float2 l9_354=l9_284;
float2 l9_355=l9_287;
int l9_356=l9_285;
int l9_357=l9_286;
float l9_358=l9_295;
float2 l9_359=l9_355;
int l9_360=l9_356;
int l9_361=l9_357;
float3 l9_362;
if (l9_360==0)
{
l9_362=float3(l9_359,0.0);
}
else
{
if (l9_360==1)
{
l9_362=float3(l9_359.x,(l9_359.y*0.5)+(0.5-(float(l9_361)*0.5)),0.0);
}
else
{
l9_362=float3(l9_359,float(l9_361));
}
}
float3 l9_363=l9_362;
float3 l9_364=l9_363;
float2 l9_365=l9_354;
float2 l9_366=l9_364.xy;
float l9_367=l9_358;
float4 l9_368=sc_set2.opacityTex.sample(sc_set2.opacityTexSmpSC,l9_366,bias(l9_367));
float4 l9_369=l9_368;
float4 l9_370=l9_369;
if (l9_293)
{
l9_370=mix(l9_294,l9_370,float4(l9_297));
}
float4 l9_371=l9_370;
float4 l9_372=l9_371;
l9_275=l9_371;
float4 l9_373=float4(0.0);
l9_373=l9_275;
float l9_374=0.0;
l9_374=l9_373.x;
float3 l9_375=float3(0.0);
l9_375=mix((*sc_set2.UserUniforms).Port_Input0_N006,l9_18,float3(l9_374));
param_1=l9_375;
param_3=param_1;
}
else
{
float3 l9_376=float3(0.0);
ssGlobals l9_377=param_4;
float3 l9_378;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_379;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_380=abs(in.varShadowTex-float2(0.5));
float l9_381=fast::max(l9_380.x,l9_380.y);
float l9_382=step(l9_381,0.5);
float4 l9_383=sc_set2.sc_ShadowTexture.sample(sc_set2.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_382;
float3 l9_384=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_383.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float l9_385=l9_383.w*(*sc_set2.UserUniforms).sc_ShadowDensity;
l9_379=mix(float3(1.0),l9_384,float3(l9_385));
}
else
{
l9_379=float3(1.0);
}
float3 l9_386=l9_379;
l9_378=l9_386;
}
else
{
l9_378=float3(1.0);
}
l9_376=l9_378;
param_2=l9_376;
param_3=param_2;
}
Output_N3=param_3;
float4 Value_N1=float4(0.0);
Value_N1=float4(Output_N3.x,Output_N3.y,Output_N3.z,Value_N1.w);
Value_N1.w=(*sc_set2.UserUniforms).Port_Value2_N001;
FinalColor=Value_N1;
float param_5=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_5<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_387=gl_FragCoord;
float2 l9_388=floor(mod(l9_387.xy,float2(4.0)));
float l9_389=(mod(dot(l9_388,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_5<l9_389)
{
discard_fragment();
}
}
float4 param_6=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_390=param_6;
float4 l9_391=l9_390;
float l9_392=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_392=l9_391.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_392=fast::clamp(l9_391.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_392=fast::clamp(dot(l9_391.xyz,float3(l9_391.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_392=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_392=(1.0-dot(l9_391.xyz,float3(0.33333)))*l9_391.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_392=(1.0-fast::clamp(dot(l9_391.xyz,float3(1.0)),0.0,1.0))*l9_391.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_392=fast::clamp(dot(l9_391.xyz,float3(1.0)),0.0,1.0)*l9_391.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_392=fast::clamp(dot(l9_391.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_392=fast::clamp(dot(l9_391.xyz,float3(1.0)),0.0,1.0)*l9_391.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_392=dot(l9_391.xyz,float3(0.33333))*l9_391.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_392=1.0-fast::clamp(dot(l9_391.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_392=fast::clamp(dot(l9_391.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_393=l9_392;
float l9_394=l9_393;
float l9_395=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_394;
float3 l9_396=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_390.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_397=float4(l9_396.x,l9_396.y,l9_396.z,l9_395);
param_6=l9_397;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_6=float4(param_6.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_398=param_6;
float4 l9_399;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_400=out.FragColor0;
float4 l9_401=l9_400;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_401.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_402=l9_401;
l9_399=l9_402;
}
else
{
float4 l9_403=gl_FragCoord;
float2 l9_404=(l9_403.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_405=l9_404;
float2 l9_406;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_407=float3(l9_405,0.0);
int l9_408=1;
int l9_409;
if (sc_StereoRenderingMode_tmp==0)
{
l9_409=0;
}
else
{
l9_409=in.varStereoViewID;
}
int l9_410=l9_409;
int l9_411=l9_410;
float3 l9_412=float3(l9_405,0.0);
int l9_413=l9_408;
int l9_414=l9_411;
if (l9_413==1)
{
l9_412.y=((2.0*l9_412.y)+float(l9_414))-1.0;
}
float2 l9_415=l9_412.xy;
l9_406=l9_415;
}
else
{
l9_406=l9_405;
}
float2 l9_416=l9_406;
float2 l9_417=l9_416;
float2 l9_418=l9_417;
int l9_419;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_420;
if (sc_StereoRenderingMode_tmp==0)
{
l9_420=0;
}
else
{
l9_420=in.varStereoViewID;
}
int l9_421=l9_420;
l9_419=1-l9_421;
}
else
{
int l9_422;
if (sc_StereoRenderingMode_tmp==0)
{
l9_422=0;
}
else
{
l9_422=in.varStereoViewID;
}
int l9_423=l9_422;
l9_419=l9_423;
}
int l9_424=l9_419;
float2 l9_425=l9_418;
int l9_426=l9_424;
float2 l9_427=l9_425;
int l9_428=l9_426;
float l9_429=0.0;
float2 l9_430=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_431=l9_430;
float2 l9_432=l9_427;
int l9_433=sc_ScreenTextureLayout_tmp;
int l9_434=l9_428;
float l9_435=l9_429;
float2 l9_436=l9_432;
int l9_437=l9_433;
int l9_438=l9_434;
float3 l9_439;
if (l9_437==0)
{
l9_439=float3(l9_436,0.0);
}
else
{
if (l9_437==1)
{
l9_439=float3(l9_436.x,(l9_436.y*0.5)+(0.5-(float(l9_438)*0.5)),0.0);
}
else
{
l9_439=float3(l9_436,float(l9_438));
}
}
float3 l9_440=l9_439;
float3 l9_441=l9_440;
float2 l9_442=l9_431;
float2 l9_443=l9_441.xy;
float l9_444=l9_435;
float4 l9_445=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_443,bias(l9_444));
float4 l9_446=l9_445;
float4 l9_447=l9_446;
float4 l9_448=l9_447;
float4 l9_449=l9_448;
float4 l9_450=l9_449;
l9_399=l9_450;
}
float4 l9_451=l9_399;
float4 l9_452=l9_451;
float3 l9_453=l9_452.xyz;
float3 l9_454=l9_453;
float3 l9_455=l9_398.xyz;
float3 l9_456=definedBlend(l9_454,l9_455,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
float4 l9_457;
l9_457=float4(l9_456.x,l9_456.y,l9_456.z,l9_457.w);
float3 l9_458=mix(l9_453,l9_457.xyz,float3(l9_398.w));
l9_457=float4(l9_458.x,l9_458.y,l9_458.z,l9_457.w);
l9_457.w=1.0;
float4 l9_459=l9_457;
param_6=l9_459;
}
else
{
float4 l9_460=param_6;
float4 l9_461;
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_461=float4(mix(float3(1.0),l9_460.xyz,float3(l9_460.w)),l9_460.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_462=l9_460.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_462=fast::clamp(l9_462,0.0,1.0);
}
l9_461=float4(l9_460.xyz*l9_462,l9_462);
}
else
{
l9_461=l9_460;
}
}
float4 l9_463=l9_461;
param_6=l9_463;
}
}
}
float4 l9_464=param_6;
FinalColor=l9_464;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_465;
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_465=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_465=float4(0.0);
}
float4 l9_466=l9_465;
float4 Cost=l9_466;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_7=FinalColor;
out.FragColor0=param_7;
float4 param_8=FinalColor;
return out;
}
} // FRAGMENT SHADER
