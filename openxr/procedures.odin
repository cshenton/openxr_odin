package openxr

ProcGetInstanceProcAddr :: #type proc() -> Result
ProcEnumerateApiLayerProperties :: #type proc() -> Result
ProcEnumerateInstanceExtensionProperties :: #type proc() -> Result
ProcCreateInstance :: #type proc() -> Result
ProcDestroyInstance :: #type proc() -> Result
ProcResultToString :: #type proc() -> Result
ProcStructureTypeToString :: #type proc() -> Result
ProcGetInstanceProperties :: #type proc() -> Result
ProcGetSystem :: #type proc() -> Result
ProcGetSystemProperties :: #type proc() -> Result
ProcCreateSession :: #type proc() -> Result
ProcDestroySession :: #type proc() -> Result
ProcDestroySpace :: #type proc() -> Result
ProcEnumerateSwapchainFormats :: #type proc() -> Result
ProcCreateSwapchain :: #type proc() -> Result
ProcDestroySwapchain :: #type proc() -> Result
ProcEnumerateSwapchainImages :: #type proc() -> Result
ProcAcquireSwapchainImage :: #type proc() -> Result
ProcWaitSwapchainImage :: #type proc() -> Result
ProcReleaseSwapchainImage :: #type proc() -> Result
ProcBeginSession :: #type proc() -> Result
ProcEndSession :: #type proc() -> Result
ProcRequestExitSession :: #type proc() -> Result
ProcEnumerateReferenceSpaces :: #type proc() -> Result
ProcCreateReferenceSpace :: #type proc() -> Result
ProcCreateActionSpace :: #type proc() -> Result
ProcLocateSpace :: #type proc() -> Result
ProcEnumerateViewConfigurations :: #type proc() -> Result
ProcEnumerateEnvironmentBlendModes :: #type proc() -> Result
ProcGetViewConfigurationProperties :: #type proc() -> Result
ProcEnumerateViewConfigurationViews :: #type proc() -> Result
ProcBeginFrame :: #type proc() -> Result
ProcLocateViews :: #type proc() -> Result
ProcEndFrame :: #type proc() -> Result
ProcWaitFrame :: #type proc() -> Result
ProcApplyHapticFeedback :: #type proc() -> Result
ProcStopHapticFeedback :: #type proc() -> Result
ProcPollEvent :: #type proc() -> Result
ProcStringToPath :: #type proc() -> Result
ProcPathToString :: #type proc() -> Result
ProcGetReferenceSpaceBoundsRect :: #type proc() -> Result
ProcSetAndroidApplicationThreadKHR :: #type proc() -> Result
ProcCreateSwapchainAndroidSurfaceKHR :: #type proc() -> Result
ProcGetActionStateBoolean :: #type proc() -> Result
ProcGetActionStateFloat :: #type proc() -> Result
ProcGetActionStateVector2f :: #type proc() -> Result
ProcGetActionStatePose :: #type proc() -> Result
ProcCreateActionSet :: #type proc() -> Result
ProcDestroyActionSet :: #type proc() -> Result
ProcCreateAction :: #type proc() -> Result
ProcDestroyAction :: #type proc() -> Result
ProcSuggestInteractionProfileBindings :: #type proc() -> Result
ProcAttachSessionActionSets :: #type proc() -> Result
ProcGetCurrentInteractionProfile :: #type proc() -> Result
ProcSyncActions :: #type proc() -> Result
ProcEnumerateBoundSourcesForAction :: #type proc() -> Result
ProcGetInputSourceLocalizedName :: #type proc() -> Result
ProcGetVulkanInstanceExtensionsKHR :: #type proc() -> Result
ProcGetVulkanDeviceExtensionsKHR :: #type proc() -> Result
ProcGetVulkanGraphicsDeviceKHR :: #type proc() -> Result
ProcGetOpenGLGraphicsRequirementsKHR :: #type proc() -> Result
ProcGetOpenGLESGraphicsRequirementsKHR :: #type proc() -> Result
ProcGetVulkanGraphicsRequirementsKHR :: #type proc() -> Result
ProcGetD3D11GraphicsRequirementsKHR :: #type proc() -> Result
ProcGetD3D12GraphicsRequirementsKHR :: #type proc() -> Result
ProcPerfSettingsSetPerformanceLevelEXT :: #type proc() -> Result
ProcThermalGetTemperatureTrendEXT :: #type proc() -> Result
ProcSetDebugUtilsObjectNameEXT :: #type proc() -> Result
ProcCreateDebugUtilsMessengerEXT :: #type proc() -> Result
ProcDestroyDebugUtilsMessengerEXT :: #type proc() -> Result
ProcSubmitDebugUtilsMessageEXT :: #type proc() -> Result
ProcSessionBeginDebugUtilsLabelRegionEXT :: #type proc() -> Result
ProcSessionEndDebugUtilsLabelRegionEXT :: #type proc() -> Result
ProcSessionInsertDebugUtilsLabelEXT :: #type proc() -> Result
ProcConvertTimeToWin32PerformanceCounterKHR :: #type proc() -> Result
ProcConvertWin32PerformanceCounterToTimeKHR :: #type proc() -> Result
ProcCreateVulkanInstanceKHR :: #type proc() -> Result
ProcCreateVulkanDeviceKHR :: #type proc() -> Result
ProcGetVulkanGraphicsDevice2KHR :: #type proc() -> Result
ProcConvertTimeToTimespecTimeKHR :: #type proc() -> Result
ProcConvertTimespecTimeToTimeKHR :: #type proc() -> Result
ProcGetVisibilityMaskKHR :: #type proc() -> Result
ProcCreateSpatialAnchorMSFT :: #type proc() -> Result
ProcCreateSpatialAnchorSpaceMSFT :: #type proc() -> Result
ProcDestroySpatialAnchorMSFT :: #type proc() -> Result
ProcSetInputDeviceActiveEXT :: #type proc() -> Result
ProcSetInputDeviceStateBoolEXT :: #type proc() -> Result
ProcSetInputDeviceStateFloatEXT :: #type proc() -> Result
ProcSetInputDeviceStateVector2fEXT :: #type proc() -> Result
ProcSetInputDeviceLocationEXT :: #type proc() -> Result
ProcInitializeLoaderKHR :: #type proc() -> Result
ProcCreateSpatialGraphNodeSpaceMSFT :: #type proc() -> Result
ProcTryCreateSpatialGraphStaticNodeBindingMSFT :: #type proc() -> Result
ProcDestroySpatialGraphNodeBindingMSFT :: #type proc() -> Result
ProcGetSpatialGraphNodeBindingPropertiesMSFT :: #type proc() -> Result
ProcCreateHandTrackerEXT :: #type proc() -> Result
ProcDestroyHandTrackerEXT :: #type proc() -> Result
ProcLocateHandJointsEXT :: #type proc() -> Result
ProcCreateHandMeshSpaceMSFT :: #type proc() -> Result
ProcUpdateHandMeshMSFT :: #type proc() -> Result
ProcGetControllerModelKeyMSFT :: #type proc() -> Result
ProcLoadControllerModelMSFT :: #type proc() -> Result
ProcGetControllerModelPropertiesMSFT :: #type proc() -> Result
ProcGetControllerModelStateMSFT :: #type proc() -> Result
ProcEnumerateSceneComputeFeaturesMSFT :: #type proc() -> Result
ProcCreateSceneObserverMSFT :: #type proc() -> Result
ProcDestroySceneObserverMSFT :: #type proc() -> Result
ProcCreateSceneMSFT :: #type proc() -> Result
ProcDestroySceneMSFT :: #type proc() -> Result
ProcComputeNewSceneMSFT :: #type proc() -> Result
ProcGetSceneComputeStateMSFT :: #type proc() -> Result
ProcGetSceneComponentsMSFT :: #type proc() -> Result
ProcLocateSceneComponentsMSFT :: #type proc() -> Result
ProcGetSceneMeshBuffersMSFT :: #type proc() -> Result
ProcDeserializeSceneMSFT :: #type proc() -> Result
ProcGetSerializedSceneFragmentDataMSFT :: #type proc() -> Result
ProcEnumerateDisplayRefreshRatesFB :: #type proc() -> Result
ProcGetDisplayRefreshRateFB :: #type proc() -> Result
ProcRequestDisplayRefreshRateFB :: #type proc() -> Result
ProcCreateSpatialAnchorFromPerceptionAnchorMSFT :: #type proc() -> Result
ProcTryGetPerceptionAnchorFromSpatialAnchorMSFT :: #type proc() -> Result
ProcUpdateSwapchainFB :: #type proc() -> Result
ProcGetSwapchainStateFB :: #type proc() -> Result
ProcEnumerateColorSpacesFB :: #type proc() -> Result
ProcSetColorSpaceFB :: #type proc() -> Result
ProcCreateFoveationProfileFB :: #type proc() -> Result
ProcDestroyFoveationProfileFB :: #type proc() -> Result
ProcGetHandMeshFB :: #type proc() -> Result
ProcEnumerateRenderModelPathsFB :: #type proc() -> Result
ProcGetRenderModelPropertiesFB :: #type proc() -> Result
ProcLoadRenderModelFB :: #type proc() -> Result
ProcQuerySystemTrackedKeyboardFB :: #type proc() -> Result
ProcCreateKeyboardSpaceFB :: #type proc() -> Result
ProcSetEnvironmentDepthEstimationVARJO :: #type proc() -> Result
ProcEnumerateReprojectionModesMSFT :: #type proc() -> Result
ProcGetAudioOutputDeviceGuidOculus :: #type proc() -> Result
ProcGetAudioInputDeviceGuidOculus :: #type proc() -> Result
ProcCreateSpatialAnchorFB :: #type proc() -> Result
ProcGetSpaceUuidFB :: #type proc() -> Result
ProcEnumerateSpaceSupportedComponentsFB :: #type proc() -> Result
ProcSetSpaceComponentStatusFB :: #type proc() -> Result
ProcGetSpaceComponentStatusFB :: #type proc() -> Result
ProcCreateTriangleMeshFB :: #type proc() -> Result
ProcDestroyTriangleMeshFB :: #type proc() -> Result
ProcTriangleMeshGetVertexBufferFB :: #type proc() -> Result
ProcTriangleMeshGetIndexBufferFB :: #type proc() -> Result
ProcTriangleMeshBeginUpdateFB :: #type proc() -> Result
ProcTriangleMeshEndUpdateFB :: #type proc() -> Result
ProcTriangleMeshBeginVertexBufferUpdateFB :: #type proc() -> Result
ProcTriangleMeshEndVertexBufferUpdateFB :: #type proc() -> Result
ProcCreatePassthroughFB :: #type proc() -> Result
ProcDestroyPassthroughFB :: #type proc() -> Result
ProcPassthroughStartFB :: #type proc() -> Result
ProcPassthroughPauseFB :: #type proc() -> Result
ProcCreatePassthroughLayerFB :: #type proc() -> Result
ProcDestroyPassthroughLayerFB :: #type proc() -> Result
ProcPassthroughLayerPauseFB :: #type proc() -> Result
ProcPassthroughLayerResumeFB :: #type proc() -> Result
ProcPassthroughLayerSetStyleFB :: #type proc() -> Result
ProcCreateGeometryInstanceFB :: #type proc() -> Result
ProcDestroyGeometryInstanceFB :: #type proc() -> Result
ProcGeometryInstanceSetTransformFB :: #type proc() -> Result
ProcQuerySpacesFB :: #type proc() -> Result
ProcRetrieveSpaceQueryResultsFB :: #type proc() -> Result
ProcSaveSpaceFB :: #type proc() -> Result
ProcEraseSpaceFB :: #type proc() -> Result
ProcGetSpaceContainerFB :: #type proc() -> Result
ProcGetSpaceBoundingBox2DFB :: #type proc() -> Result
ProcGetSpaceBoundingBox3DFB :: #type proc() -> Result
ProcGetSpaceSemanticLabelsFB :: #type proc() -> Result
ProcGetSpaceBoundary2DFB :: #type proc() -> Result
ProcGetSpaceRoomLayoutFB :: #type proc() -> Result
ProcPassthroughLayerSetKeyboardHandsIntensityFB :: #type proc() -> Result
ProcCreateSpatialAnchorStoreConnectionMSFT :: #type proc() -> Result
ProcDestroySpatialAnchorStoreConnectionMSFT :: #type proc() -> Result
ProcPersistSpatialAnchorMSFT :: #type proc() -> Result
ProcEnumeratePersistedSpatialAnchorNamesMSFT :: #type proc() -> Result
ProcCreateSpatialAnchorFromPersistedNameMSFT :: #type proc() -> Result
ProcUnpersistSpatialAnchorMSFT :: #type proc() -> Result
ProcClearSpatialAnchorStoreMSFT :: #type proc() -> Result
ProcCreateFacialTrackerHTC :: #type proc() -> Result
ProcDestroyFacialTrackerHTC :: #type proc() -> Result
ProcGetFacialExpressionsHTC :: #type proc() -> Result
ProcCreatePassthroughHTC :: #type proc() -> Result
ProcDestroyPassthroughHTC :: #type proc() -> Result
ProcEnumerateViveTrackerPathsHTCX :: #type proc() -> Result
ProcSetMarkerTrackingVARJO :: #type proc() -> Result
ProcSetMarkerTrackingTimeoutVARJO :: #type proc() -> Result
ProcSetMarkerTrackingPredictionVARJO :: #type proc() -> Result
ProcGetMarkerSizeVARJO :: #type proc() -> Result
ProcCreateMarkerSpaceVARJO :: #type proc() -> Result
ProcSetDigitalLensControlALMALENCE :: #type proc() -> Result
ProcSetViewOffsetVARJO :: #type proc() -> Result
ProcEnumeratePerformanceMetricsCounterPathsMETA :: #type proc() -> Result
ProcSetPerformanceMetricsStateMETA :: #type proc() -> Result
ProcGetPerformanceMetricsStateMETA :: #type proc() -> Result
ProcQueryPerformanceMetricsCounterMETA :: #type proc() -> Result
ProcApplyFoveationHTC :: #type proc() -> Result


GetInstanceProcAddr : ProcGetInstanceProcAddr
EnumerateApiLayerProperties : ProcEnumerateApiLayerProperties
EnumerateInstanceExtensionProperties : ProcEnumerateInstanceExtensionProperties
CreateInstance : ProcCreateInstance
DestroyInstance : ProcDestroyInstance
ResultToString : ProcResultToString
StructureTypeToString : ProcStructureTypeToString
GetInstanceProperties : ProcGetInstanceProperties
GetSystem : ProcGetSystem
GetSystemProperties : ProcGetSystemProperties
CreateSession : ProcCreateSession
DestroySession : ProcDestroySession
DestroySpace : ProcDestroySpace
EnumerateSwapchainFormats : ProcEnumerateSwapchainFormats
CreateSwapchain : ProcCreateSwapchain
DestroySwapchain : ProcDestroySwapchain
EnumerateSwapchainImages : ProcEnumerateSwapchainImages
AcquireSwapchainImage : ProcAcquireSwapchainImage
WaitSwapchainImage : ProcWaitSwapchainImage
ReleaseSwapchainImage : ProcReleaseSwapchainImage
BeginSession : ProcBeginSession
EndSession : ProcEndSession
RequestExitSession : ProcRequestExitSession
EnumerateReferenceSpaces : ProcEnumerateReferenceSpaces
CreateReferenceSpace : ProcCreateReferenceSpace
CreateActionSpace : ProcCreateActionSpace
LocateSpace : ProcLocateSpace
EnumerateViewConfigurations : ProcEnumerateViewConfigurations
EnumerateEnvironmentBlendModes : ProcEnumerateEnvironmentBlendModes
GetViewConfigurationProperties : ProcGetViewConfigurationProperties
EnumerateViewConfigurationViews : ProcEnumerateViewConfigurationViews
BeginFrame : ProcBeginFrame
LocateViews : ProcLocateViews
EndFrame : ProcEndFrame
WaitFrame : ProcWaitFrame
ApplyHapticFeedback : ProcApplyHapticFeedback
StopHapticFeedback : ProcStopHapticFeedback
PollEvent : ProcPollEvent
StringToPath : ProcStringToPath
PathToString : ProcPathToString
GetReferenceSpaceBoundsRect : ProcGetReferenceSpaceBoundsRect
SetAndroidApplicationThreadKHR : ProcSetAndroidApplicationThreadKHR
CreateSwapchainAndroidSurfaceKHR : ProcCreateSwapchainAndroidSurfaceKHR
GetActionStateBoolean : ProcGetActionStateBoolean
GetActionStateFloat : ProcGetActionStateFloat
GetActionStateVector2f : ProcGetActionStateVector2f
GetActionStatePose : ProcGetActionStatePose
CreateActionSet : ProcCreateActionSet
DestroyActionSet : ProcDestroyActionSet
CreateAction : ProcCreateAction
DestroyAction : ProcDestroyAction
SuggestInteractionProfileBindings : ProcSuggestInteractionProfileBindings
AttachSessionActionSets : ProcAttachSessionActionSets
GetCurrentInteractionProfile : ProcGetCurrentInteractionProfile
SyncActions : ProcSyncActions
EnumerateBoundSourcesForAction : ProcEnumerateBoundSourcesForAction
GetInputSourceLocalizedName : ProcGetInputSourceLocalizedName
GetVulkanInstanceExtensionsKHR : ProcGetVulkanInstanceExtensionsKHR
GetVulkanDeviceExtensionsKHR : ProcGetVulkanDeviceExtensionsKHR
GetVulkanGraphicsDeviceKHR : ProcGetVulkanGraphicsDeviceKHR
GetOpenGLGraphicsRequirementsKHR : ProcGetOpenGLGraphicsRequirementsKHR
GetOpenGLESGraphicsRequirementsKHR : ProcGetOpenGLESGraphicsRequirementsKHR
GetVulkanGraphicsRequirementsKHR : ProcGetVulkanGraphicsRequirementsKHR
GetD3D11GraphicsRequirementsKHR : ProcGetD3D11GraphicsRequirementsKHR
GetD3D12GraphicsRequirementsKHR : ProcGetD3D12GraphicsRequirementsKHR
PerfSettingsSetPerformanceLevelEXT : ProcPerfSettingsSetPerformanceLevelEXT
ThermalGetTemperatureTrendEXT : ProcThermalGetTemperatureTrendEXT
SetDebugUtilsObjectNameEXT : ProcSetDebugUtilsObjectNameEXT
CreateDebugUtilsMessengerEXT : ProcCreateDebugUtilsMessengerEXT
DestroyDebugUtilsMessengerEXT : ProcDestroyDebugUtilsMessengerEXT
SubmitDebugUtilsMessageEXT : ProcSubmitDebugUtilsMessageEXT
SessionBeginDebugUtilsLabelRegionEXT : ProcSessionBeginDebugUtilsLabelRegionEXT
SessionEndDebugUtilsLabelRegionEXT : ProcSessionEndDebugUtilsLabelRegionEXT
SessionInsertDebugUtilsLabelEXT : ProcSessionInsertDebugUtilsLabelEXT
ConvertTimeToWin32PerformanceCounterKHR : ProcConvertTimeToWin32PerformanceCounterKHR
ConvertWin32PerformanceCounterToTimeKHR : ProcConvertWin32PerformanceCounterToTimeKHR
CreateVulkanInstanceKHR : ProcCreateVulkanInstanceKHR
CreateVulkanDeviceKHR : ProcCreateVulkanDeviceKHR
GetVulkanGraphicsDevice2KHR : ProcGetVulkanGraphicsDevice2KHR
GetVulkanGraphicsRequirements2KHR : ProcGetVulkanGraphicsRequirementsKHR
ConvertTimeToTimespecTimeKHR : ProcConvertTimeToTimespecTimeKHR
ConvertTimespecTimeToTimeKHR : ProcConvertTimespecTimeToTimeKHR
GetVisibilityMaskKHR : ProcGetVisibilityMaskKHR
CreateSpatialAnchorMSFT : ProcCreateSpatialAnchorMSFT
CreateSpatialAnchorSpaceMSFT : ProcCreateSpatialAnchorSpaceMSFT
DestroySpatialAnchorMSFT : ProcDestroySpatialAnchorMSFT
SetInputDeviceActiveEXT : ProcSetInputDeviceActiveEXT
SetInputDeviceStateBoolEXT : ProcSetInputDeviceStateBoolEXT
SetInputDeviceStateFloatEXT : ProcSetInputDeviceStateFloatEXT
SetInputDeviceStateVector2fEXT : ProcSetInputDeviceStateVector2fEXT
SetInputDeviceLocationEXT : ProcSetInputDeviceLocationEXT
InitializeLoaderKHR : ProcInitializeLoaderKHR
CreateSpatialGraphNodeSpaceMSFT : ProcCreateSpatialGraphNodeSpaceMSFT
TryCreateSpatialGraphStaticNodeBindingMSFT : ProcTryCreateSpatialGraphStaticNodeBindingMSFT
DestroySpatialGraphNodeBindingMSFT : ProcDestroySpatialGraphNodeBindingMSFT
GetSpatialGraphNodeBindingPropertiesMSFT : ProcGetSpatialGraphNodeBindingPropertiesMSFT
CreateHandTrackerEXT : ProcCreateHandTrackerEXT
DestroyHandTrackerEXT : ProcDestroyHandTrackerEXT
LocateHandJointsEXT : ProcLocateHandJointsEXT
CreateHandMeshSpaceMSFT : ProcCreateHandMeshSpaceMSFT
UpdateHandMeshMSFT : ProcUpdateHandMeshMSFT
GetControllerModelKeyMSFT : ProcGetControllerModelKeyMSFT
LoadControllerModelMSFT : ProcLoadControllerModelMSFT
GetControllerModelPropertiesMSFT : ProcGetControllerModelPropertiesMSFT
GetControllerModelStateMSFT : ProcGetControllerModelStateMSFT
EnumerateSceneComputeFeaturesMSFT : ProcEnumerateSceneComputeFeaturesMSFT
CreateSceneObserverMSFT : ProcCreateSceneObserverMSFT
DestroySceneObserverMSFT : ProcDestroySceneObserverMSFT
CreateSceneMSFT : ProcCreateSceneMSFT
DestroySceneMSFT : ProcDestroySceneMSFT
ComputeNewSceneMSFT : ProcComputeNewSceneMSFT
GetSceneComputeStateMSFT : ProcGetSceneComputeStateMSFT
GetSceneComponentsMSFT : ProcGetSceneComponentsMSFT
LocateSceneComponentsMSFT : ProcLocateSceneComponentsMSFT
GetSceneMeshBuffersMSFT : ProcGetSceneMeshBuffersMSFT
DeserializeSceneMSFT : ProcDeserializeSceneMSFT
GetSerializedSceneFragmentDataMSFT : ProcGetSerializedSceneFragmentDataMSFT
EnumerateDisplayRefreshRatesFB : ProcEnumerateDisplayRefreshRatesFB
GetDisplayRefreshRateFB : ProcGetDisplayRefreshRateFB
RequestDisplayRefreshRateFB : ProcRequestDisplayRefreshRateFB
CreateSpatialAnchorFromPerceptionAnchorMSFT : ProcCreateSpatialAnchorFromPerceptionAnchorMSFT
TryGetPerceptionAnchorFromSpatialAnchorMSFT : ProcTryGetPerceptionAnchorFromSpatialAnchorMSFT
UpdateSwapchainFB : ProcUpdateSwapchainFB
GetSwapchainStateFB : ProcGetSwapchainStateFB
EnumerateColorSpacesFB : ProcEnumerateColorSpacesFB
SetColorSpaceFB : ProcSetColorSpaceFB
CreateFoveationProfileFB : ProcCreateFoveationProfileFB
DestroyFoveationProfileFB : ProcDestroyFoveationProfileFB
GetHandMeshFB : ProcGetHandMeshFB
EnumerateRenderModelPathsFB : ProcEnumerateRenderModelPathsFB
GetRenderModelPropertiesFB : ProcGetRenderModelPropertiesFB
LoadRenderModelFB : ProcLoadRenderModelFB
QuerySystemTrackedKeyboardFB : ProcQuerySystemTrackedKeyboardFB
CreateKeyboardSpaceFB : ProcCreateKeyboardSpaceFB
SetEnvironmentDepthEstimationVARJO : ProcSetEnvironmentDepthEstimationVARJO
EnumerateReprojectionModesMSFT : ProcEnumerateReprojectionModesMSFT
GetAudioOutputDeviceGuidOculus : ProcGetAudioOutputDeviceGuidOculus
GetAudioInputDeviceGuidOculus : ProcGetAudioInputDeviceGuidOculus
CreateSpatialAnchorFB : ProcCreateSpatialAnchorFB
GetSpaceUuidFB : ProcGetSpaceUuidFB
EnumerateSpaceSupportedComponentsFB : ProcEnumerateSpaceSupportedComponentsFB
SetSpaceComponentStatusFB : ProcSetSpaceComponentStatusFB
GetSpaceComponentStatusFB : ProcGetSpaceComponentStatusFB
CreateTriangleMeshFB : ProcCreateTriangleMeshFB
DestroyTriangleMeshFB : ProcDestroyTriangleMeshFB
TriangleMeshGetVertexBufferFB : ProcTriangleMeshGetVertexBufferFB
TriangleMeshGetIndexBufferFB : ProcTriangleMeshGetIndexBufferFB
TriangleMeshBeginUpdateFB : ProcTriangleMeshBeginUpdateFB
TriangleMeshEndUpdateFB : ProcTriangleMeshEndUpdateFB
TriangleMeshBeginVertexBufferUpdateFB : ProcTriangleMeshBeginVertexBufferUpdateFB
TriangleMeshEndVertexBufferUpdateFB : ProcTriangleMeshEndVertexBufferUpdateFB
CreatePassthroughFB : ProcCreatePassthroughFB
DestroyPassthroughFB : ProcDestroyPassthroughFB
PassthroughStartFB : ProcPassthroughStartFB
PassthroughPauseFB : ProcPassthroughPauseFB
CreatePassthroughLayerFB : ProcCreatePassthroughLayerFB
DestroyPassthroughLayerFB : ProcDestroyPassthroughLayerFB
PassthroughLayerPauseFB : ProcPassthroughLayerPauseFB
PassthroughLayerResumeFB : ProcPassthroughLayerResumeFB
PassthroughLayerSetStyleFB : ProcPassthroughLayerSetStyleFB
CreateGeometryInstanceFB : ProcCreateGeometryInstanceFB
DestroyGeometryInstanceFB : ProcDestroyGeometryInstanceFB
GeometryInstanceSetTransformFB : ProcGeometryInstanceSetTransformFB
QuerySpacesFB : ProcQuerySpacesFB
RetrieveSpaceQueryResultsFB : ProcRetrieveSpaceQueryResultsFB
SaveSpaceFB : ProcSaveSpaceFB
EraseSpaceFB : ProcEraseSpaceFB
GetSpaceContainerFB : ProcGetSpaceContainerFB
GetSpaceBoundingBox2DFB : ProcGetSpaceBoundingBox2DFB
GetSpaceBoundingBox3DFB : ProcGetSpaceBoundingBox3DFB
GetSpaceSemanticLabelsFB : ProcGetSpaceSemanticLabelsFB
GetSpaceBoundary2DFB : ProcGetSpaceBoundary2DFB
GetSpaceRoomLayoutFB : ProcGetSpaceRoomLayoutFB
PassthroughLayerSetKeyboardHandsIntensityFB : ProcPassthroughLayerSetKeyboardHandsIntensityFB
CreateSpatialAnchorStoreConnectionMSFT : ProcCreateSpatialAnchorStoreConnectionMSFT
DestroySpatialAnchorStoreConnectionMSFT : ProcDestroySpatialAnchorStoreConnectionMSFT
PersistSpatialAnchorMSFT : ProcPersistSpatialAnchorMSFT
EnumeratePersistedSpatialAnchorNamesMSFT : ProcEnumeratePersistedSpatialAnchorNamesMSFT
CreateSpatialAnchorFromPersistedNameMSFT : ProcCreateSpatialAnchorFromPersistedNameMSFT
UnpersistSpatialAnchorMSFT : ProcUnpersistSpatialAnchorMSFT
ClearSpatialAnchorStoreMSFT : ProcClearSpatialAnchorStoreMSFT
CreateFacialTrackerHTC : ProcCreateFacialTrackerHTC
DestroyFacialTrackerHTC : ProcDestroyFacialTrackerHTC
GetFacialExpressionsHTC : ProcGetFacialExpressionsHTC
CreatePassthroughHTC : ProcCreatePassthroughHTC
DestroyPassthroughHTC : ProcDestroyPassthroughHTC
EnumerateViveTrackerPathsHTCX : ProcEnumerateViveTrackerPathsHTCX
SetMarkerTrackingVARJO : ProcSetMarkerTrackingVARJO
SetMarkerTrackingTimeoutVARJO : ProcSetMarkerTrackingTimeoutVARJO
SetMarkerTrackingPredictionVARJO : ProcSetMarkerTrackingPredictionVARJO
GetMarkerSizeVARJO : ProcGetMarkerSizeVARJO
CreateMarkerSpaceVARJO : ProcCreateMarkerSpaceVARJO
SetDigitalLensControlALMALENCE : ProcSetDigitalLensControlALMALENCE
SetViewOffsetVARJO : ProcSetViewOffsetVARJO
EnumeratePerformanceMetricsCounterPathsMETA : ProcEnumeratePerformanceMetricsCounterPathsMETA
SetPerformanceMetricsStateMETA : ProcSetPerformanceMetricsStateMETA
GetPerformanceMetricsStateMETA : ProcGetPerformanceMetricsStateMETA
QueryPerformanceMetricsCounterMETA : ProcQueryPerformanceMetricsCounterMETA
ApplyFoveationHTC : ProcApplyFoveationHTC
