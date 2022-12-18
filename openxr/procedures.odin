package openxr


import "core:c"
import "core:c/libc"

// Vulkan Types
import vk "vendor:vulkan"

timespec :: libc.timespec
wchar_t :: libc.wchar_t
jobject :: rawptr

when ODIN_OS == .Windows {
	import win32 "core:sys/windows"
        LARGE_INTEGER :: win32.LARGE_INTEGER
} else {
        LARGE_INTEGER :: distinct distinct c.longlong
}

ProcGetInstanceProcAddr :: #type proc "c" (
	instance: Instance,
	name: cstring,
	function: ^ProcVoidFunction,
) -> Result

ProcEnumerateApiLayerProperties :: #type proc "c" (
	propertyCapacityInput: u32,
	propertyCountOutput: ^u32,
	properties: ^ApiLayerProperties,
) -> Result

ProcEnumerateInstanceExtensionProperties :: #type proc "c" (
	layerName: cstring,
	propertyCapacityInput: u32,
	propertyCountOutput: ^u32,
	properties: ^ExtensionProperties,
) -> Result

ProcCreateInstance :: #type proc "c" (
	createInfo: ^InstanceCreateInfo,
	instance: ^Instance,
) -> Result

ProcDestroyInstance :: #type proc "c" (
	instance: Instance,
) -> Result

ProcResultToString :: #type proc "c" (
	instance: Instance,
	value: Result,
	buffer: [^]u8,
) -> Result

ProcStructureTypeToString :: #type proc "c" (
	instance: Instance,
	value: StructureType,
	buffer: [^]u8,
) -> Result

ProcGetInstanceProperties :: #type proc "c" (
	instance: Instance,
	instanceProperties: ^InstanceProperties,
) -> Result

ProcGetSystem :: #type proc "c" (
	instance: Instance,
	getInfo: ^SystemGetInfo,
	systemId: ^SystemId,
) -> Result

ProcGetSystemProperties :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	properties: ^SystemProperties,
) -> Result

ProcCreateSession :: #type proc "c" (
	instance: Instance,
	createInfo: ^SessionCreateInfo,
	session: ^Session,
) -> Result

ProcDestroySession :: #type proc "c" (
	session: Session,
) -> Result

ProcDestroySpace :: #type proc "c" (
	space: Space,
) -> Result

ProcEnumerateSwapchainFormats :: #type proc "c" (
	session: Session,
	formatCapacityInput: u32,
	formatCountOutput: ^u32,
	formats: ^i64,
) -> Result

ProcCreateSwapchain :: #type proc "c" (
	session: Session,
	createInfo: ^SwapchainCreateInfo,
	swapchain: ^Swapchain,
) -> Result

ProcDestroySwapchain :: #type proc "c" (
	swapchain: Swapchain,
) -> Result

ProcEnumerateSwapchainImages :: #type proc "c" (
	swapchain: Swapchain,
	imageCapacityInput: u32,
	imageCountOutput: ^u32,
	images: ^SwapchainImageBaseHeader,
) -> Result

ProcAcquireSwapchainImage :: #type proc "c" (
	swapchain: Swapchain,
	acquireInfo: ^SwapchainImageAcquireInfo,
	index: ^u32,
) -> Result

ProcWaitSwapchainImage :: #type proc "c" (
	swapchain: Swapchain,
	waitInfo: ^SwapchainImageWaitInfo,
) -> Result

ProcReleaseSwapchainImage :: #type proc "c" (
	swapchain: Swapchain,
	releaseInfo: ^SwapchainImageReleaseInfo,
) -> Result

ProcBeginSession :: #type proc "c" (
	session: Session,
	beginInfo: ^SessionBeginInfo,
) -> Result

ProcEndSession :: #type proc "c" (
	session: Session,
) -> Result

ProcRequestExitSession :: #type proc "c" (
	session: Session,
) -> Result

ProcEnumerateReferenceSpaces :: #type proc "c" (
	session: Session,
	spaceCapacityInput: u32,
	spaceCountOutput: ^u32,
	spaces: ^ReferenceSpaceType,
) -> Result

ProcCreateReferenceSpace :: #type proc "c" (
	session: Session,
	createInfo: ^ReferenceSpaceCreateInfo,
	space: ^Space,
) -> Result

ProcCreateActionSpace :: #type proc "c" (
	session: Session,
	createInfo: ^ActionSpaceCreateInfo,
	space: ^Space,
) -> Result

ProcLocateSpace :: #type proc "c" (
	space: Space,
	baseSpace: Space,
	time: Time,
	location: ^SpaceLocation,
) -> Result

ProcEnumerateViewConfigurations :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	viewConfigurationTypeCapacityInput: u32,
	viewConfigurationTypeCountOutput: ^u32,
	viewConfigurationTypes: ^ViewConfigurationType,
) -> Result

ProcEnumerateEnvironmentBlendModes :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	viewConfigurationType: ViewConfigurationType,
	environmentBlendModeCapacityInput: u32,
	environmentBlendModeCountOutput: ^u32,
	environmentBlendModes: ^EnvironmentBlendMode,
) -> Result

ProcGetViewConfigurationProperties :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	viewConfigurationType: ViewConfigurationType,
	configurationProperties: ^ViewConfigurationProperties,
) -> Result

ProcEnumerateViewConfigurationViews :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	viewConfigurationType: ViewConfigurationType,
	viewCapacityInput: u32,
	viewCountOutput: ^u32,
	views: ^ViewConfigurationView,
) -> Result

ProcBeginFrame :: #type proc "c" (
	session: Session,
	frameBeginInfo: ^FrameBeginInfo,
) -> Result

ProcLocateViews :: #type proc "c" (
	session: Session,
	viewLocateInfo: ^ViewLocateInfo,
	viewState: ^ViewState,
	viewCapacityInput: u32,
	viewCountOutput: ^u32,
	views: ^View,
) -> Result

ProcEndFrame :: #type proc "c" (
	session: Session,
	frameEndInfo: ^FrameEndInfo,
) -> Result

ProcWaitFrame :: #type proc "c" (
	session: Session,
	frameWaitInfo: ^FrameWaitInfo,
	frameState: ^FrameState,
) -> Result

ProcApplyHapticFeedback :: #type proc "c" (
	session: Session,
	hapticActionInfo: ^HapticActionInfo,
	hapticFeedback: ^HapticBaseHeader,
) -> Result

ProcStopHapticFeedback :: #type proc "c" (
	session: Session,
	hapticActionInfo: ^HapticActionInfo,
) -> Result

ProcPollEvent :: #type proc "c" (
	instance: Instance,
	eventData: ^EventDataBuffer,
) -> Result

ProcStringToPath :: #type proc "c" (
	instance: Instance,
	pathString: cstring,
	path: ^Path,
) -> Result

ProcPathToString :: #type proc "c" (
	instance: Instance,
	path: Path,
	bufferCapacityInput: u32,
	bufferCountOutput: ^u32,
	buffer: cstring,
) -> Result

ProcGetReferenceSpaceBoundsRect :: #type proc "c" (
	session: Session,
	referenceSpaceType: ReferenceSpaceType,
	bounds: ^Extent2Df,
) -> Result

ProcSetAndroidApplicationThreadKHR :: #type proc "c" (
	session: Session,
	threadType: AndroidThreadTypeKHR,
	threadId: u32,
) -> Result

ProcCreateSwapchainAndroidSurfaceKHR :: #type proc "c" (
	session: Session,
	info: ^SwapchainCreateInfo,
	swapchain: ^Swapchain,
	surface: ^jobject,
) -> Result

ProcGetActionStateBoolean :: #type proc "c" (
	session: Session,
	getInfo: ^ActionStateGetInfo,
	state: ^ActionStateBoolean,
) -> Result

ProcGetActionStateFloat :: #type proc "c" (
	session: Session,
	getInfo: ^ActionStateGetInfo,
	state: ^ActionStateFloat,
) -> Result

ProcGetActionStateVector2f :: #type proc "c" (
	session: Session,
	getInfo: ^ActionStateGetInfo,
	state: ^ActionStateVector2f,
) -> Result

ProcGetActionStatePose :: #type proc "c" (
	session: Session,
	getInfo: ^ActionStateGetInfo,
	state: ^ActionStatePose,
) -> Result

ProcCreateActionSet :: #type proc "c" (
	instance: Instance,
	createInfo: ^ActionSetCreateInfo,
	actionSet: ^ActionSet,
) -> Result

ProcDestroyActionSet :: #type proc "c" (
	actionSet: ActionSet,
) -> Result

ProcCreateAction :: #type proc "c" (
	actionSet: ActionSet,
	createInfo: ^ActionCreateInfo,
	action: ^Action,
) -> Result

ProcDestroyAction :: #type proc "c" (
	action: Action,
) -> Result

ProcSuggestInteractionProfileBindings :: #type proc "c" (
	instance: Instance,
	suggestedBindings: ^InteractionProfileSuggestedBinding,
) -> Result

ProcAttachSessionActionSets :: #type proc "c" (
	session: Session,
	attachInfo: ^SessionActionSetsAttachInfo,
) -> Result

ProcGetCurrentInteractionProfile :: #type proc "c" (
	session: Session,
	topLevelUserPath: Path,
	interactionProfile: ^InteractionProfileState,
) -> Result

ProcSyncActions :: #type proc "c" (
	session: Session,
	syncInfo: ^ActionsSyncInfo,
) -> Result

ProcEnumerateBoundSourcesForAction :: #type proc "c" (
	session: Session,
	enumerateInfo: ^BoundSourcesForActionEnumerateInfo,
	sourceCapacityInput: u32,
	sourceCountOutput: ^u32,
	sources: ^Path,
) -> Result

ProcGetInputSourceLocalizedName :: #type proc "c" (
	session: Session,
	getInfo: ^InputSourceLocalizedNameGetInfo,
	bufferCapacityInput: u32,
	bufferCountOutput: ^u32,
	buffer: cstring,
) -> Result

ProcGetVulkanInstanceExtensionsKHR :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	bufferCapacityInput: u32,
	bufferCountOutput: ^u32,
	buffer: cstring,
) -> Result

ProcGetVulkanDeviceExtensionsKHR :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	bufferCapacityInput: u32,
	bufferCountOutput: ^u32,
	buffer: cstring,
) -> Result

ProcGetVulkanGraphicsDeviceKHR :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	vkInstance: vk.Instance,
	vkPhysicalDevice: ^vk.PhysicalDevice,
) -> Result

ProcGetOpenGLGraphicsRequirementsKHR :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	graphicsRequirements: ^GraphicsRequirementsOpenGLKHR,
) -> Result

ProcGetOpenGLESGraphicsRequirementsKHR :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	graphicsRequirements: ^GraphicsRequirementsOpenGLESKHR,
) -> Result

ProcGetVulkanGraphicsRequirementsKHR :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	graphicsRequirements: ^GraphicsRequirementsVulkanKHR,
) -> Result

ProcGetD3D11GraphicsRequirementsKHR :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	graphicsRequirements: ^GraphicsRequirementsD3D11KHR,
) -> Result

ProcGetD3D12GraphicsRequirementsKHR :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	graphicsRequirements: ^GraphicsRequirementsD3D12KHR,
) -> Result

ProcPerfSettingsSetPerformanceLevelEXT :: #type proc "c" (
	session: Session,
	domain: PerfSettingsDomainEXT,
	level: PerfSettingsLevelEXT,
) -> Result

ProcThermalGetTemperatureTrendEXT :: #type proc "c" (
	session: Session,
	domain: PerfSettingsDomainEXT,
	notificationLevel: ^PerfSettingsNotificationLevelEXT,
	tempHeadroom: ^f32,
	tempSlope: ^f32,
) -> Result

ProcSetDebugUtilsObjectNameEXT :: #type proc "c" (
	instance: Instance,
	nameInfo: ^DebugUtilsObjectNameInfoEXT,
) -> Result

ProcCreateDebugUtilsMessengerEXT :: #type proc "c" (
	instance: Instance,
	createInfo: ^DebugUtilsMessengerCreateInfoEXT,
	messenger: ^DebugUtilsMessengerEXT,
) -> Result

ProcDestroyDebugUtilsMessengerEXT :: #type proc "c" (
	messenger: DebugUtilsMessengerEXT,
) -> Result

ProcSubmitDebugUtilsMessageEXT :: #type proc "c" (
	instance: Instance,
	messageSeverity: DebugUtilsMessageSeverityFlagsEXT,
	messageTypes: DebugUtilsMessageTypeFlagsEXT,
	callbackData: ^DebugUtilsMessengerCallbackDataEXT,
) -> Result

ProcSessionBeginDebugUtilsLabelRegionEXT :: #type proc "c" (
	session: Session,
	labelInfo: ^DebugUtilsLabelEXT,
) -> Result

ProcSessionEndDebugUtilsLabelRegionEXT :: #type proc "c" (
	session: Session,
) -> Result

ProcSessionInsertDebugUtilsLabelEXT :: #type proc "c" (
	session: Session,
	labelInfo: ^DebugUtilsLabelEXT,
) -> Result

ProcConvertTimeToWin32PerformanceCounterKHR :: #type proc "c" (
	instance: Instance,
	time: Time,
	performanceCounter: ^LARGE_INTEGER,
) -> Result

ProcConvertWin32PerformanceCounterToTimeKHR :: #type proc "c" (
	instance: Instance,
	performanceCounter: ^LARGE_INTEGER,
	time: ^Time,
) -> Result

ProcCreateVulkanInstanceKHR :: #type proc "c" (
	instance: Instance,
	createInfo: ^VulkanInstanceCreateInfoKHR,
	vulkanInstance: ^vk.Instance,
	vulkanResult: ^vk.Result,
) -> Result

ProcCreateVulkanDeviceKHR :: #type proc "c" (
	instance: Instance,
	createInfo: ^VulkanDeviceCreateInfoKHR,
	vulkanDevice: ^vk.Device,
	vulkanResult: ^vk.Result,
) -> Result

ProcGetVulkanGraphicsDevice2KHR :: #type proc "c" (
	instance: Instance,
	getInfo: ^VulkanGraphicsDeviceGetInfoKHR,
	vulkanPhysicalDevice: ^vk.PhysicalDevice,
) -> Result

ProcConvertTimeToTimespecTimeKHR :: #type proc "c" (
	instance: Instance,
	time: Time,
	timespecTime: ^timespec,
) -> Result

ProcConvertTimespecTimeToTimeKHR :: #type proc "c" (
	instance: Instance,
	timespecTime: ^timespec,
	time: ^Time,
) -> Result

ProcGetVisibilityMaskKHR :: #type proc "c" (
	session: Session,
	viewConfigurationType: ViewConfigurationType,
	viewIndex: u32,
	visibilityMaskType: VisibilityMaskTypeKHR,
	visibilityMask: ^VisibilityMaskKHR,
) -> Result

ProcCreateSpatialAnchorMSFT :: #type proc "c" (
	session: Session,
	createInfo: ^SpatialAnchorCreateInfoMSFT,
	anchor: ^SpatialAnchorMSFT,
) -> Result

ProcCreateSpatialAnchorSpaceMSFT :: #type proc "c" (
	session: Session,
	createInfo: ^SpatialAnchorSpaceCreateInfoMSFT,
	space: ^Space,
) -> Result

ProcDestroySpatialAnchorMSFT :: #type proc "c" (
	anchor: SpatialAnchorMSFT,
) -> Result

ProcSetInputDeviceActiveEXT :: #type proc "c" (
	session: Session,
	interactionProfile: Path,
	topLevelPath: Path,
	isActive: b32,
) -> Result

ProcSetInputDeviceStateBoolEXT :: #type proc "c" (
	session: Session,
	topLevelPath: Path,
	inputSourcePath: Path,
	state: b32,
) -> Result

ProcSetInputDeviceStateFloatEXT :: #type proc "c" (
	session: Session,
	topLevelPath: Path,
	inputSourcePath: Path,
	state: f32,
) -> Result

ProcSetInputDeviceStateVector2fEXT :: #type proc "c" (
	session: Session,
	topLevelPath: Path,
	inputSourcePath: Path,
	state: Vector2f,
) -> Result

ProcSetInputDeviceLocationEXT :: #type proc "c" (
	session: Session,
	topLevelPath: Path,
	inputSourcePath: Path,
	space: Space,
	pose: Posef,
) -> Result

ProcInitializeLoaderKHR :: #type proc "c" (
	loaderInitInfo: ^LoaderInitInfoBaseHeaderKHR,
) -> Result

ProcCreateSpatialGraphNodeSpaceMSFT :: #type proc "c" (
	session: Session,
	createInfo: ^SpatialGraphNodeSpaceCreateInfoMSFT,
	space: ^Space,
) -> Result

ProcTryCreateSpatialGraphStaticNodeBindingMSFT :: #type proc "c" (
	session: Session,
	createInfo: ^SpatialGraphStaticNodeBindingCreateInfoMSFT,
	nodeBinding: ^SpatialGraphNodeBindingMSFT,
) -> Result

ProcDestroySpatialGraphNodeBindingMSFT :: #type proc "c" (
	nodeBinding: SpatialGraphNodeBindingMSFT,
) -> Result

ProcGetSpatialGraphNodeBindingPropertiesMSFT :: #type proc "c" (
	nodeBinding: SpatialGraphNodeBindingMSFT,
	getInfo: ^SpatialGraphNodeBindingPropertiesGetInfoMSFT,
	properties: ^SpatialGraphNodeBindingPropertiesMSFT,
) -> Result

ProcCreateHandTrackerEXT :: #type proc "c" (
	session: Session,
	createInfo: ^HandTrackerCreateInfoEXT,
	handTracker: ^HandTrackerEXT,
) -> Result

ProcDestroyHandTrackerEXT :: #type proc "c" (
	handTracker: HandTrackerEXT,
) -> Result

ProcLocateHandJointsEXT :: #type proc "c" (
	handTracker: HandTrackerEXT,
	locateInfo: ^HandJointsLocateInfoEXT,
	locations: ^HandJointLocationsEXT,
) -> Result

ProcCreateHandMeshSpaceMSFT :: #type proc "c" (
	handTracker: HandTrackerEXT,
	createInfo: ^HandMeshSpaceCreateInfoMSFT,
	space: ^Space,
) -> Result

ProcUpdateHandMeshMSFT :: #type proc "c" (
	handTracker: HandTrackerEXT,
	updateInfo: ^HandMeshUpdateInfoMSFT,
	handMesh: ^HandMeshMSFT,
) -> Result

ProcGetControllerModelKeyMSFT :: #type proc "c" (
	session: Session,
	topLevelUserPath: Path,
	controllerModelKeyState: ^ControllerModelKeyStateMSFT,
) -> Result

ProcLoadControllerModelMSFT :: #type proc "c" (
	session: Session,
	modelKey: ControllerModelKeyMSFT,
	bufferCapacityInput: u32,
	bufferCountOutput: ^u32,
	buffer: ^u8,
) -> Result

ProcGetControllerModelPropertiesMSFT :: #type proc "c" (
	session: Session,
	modelKey: ControllerModelKeyMSFT,
	properties: ^ControllerModelPropertiesMSFT,
) -> Result

ProcGetControllerModelStateMSFT :: #type proc "c" (
	session: Session,
	modelKey: ControllerModelKeyMSFT,
	state: ^ControllerModelStateMSFT,
) -> Result

ProcEnumerateSceneComputeFeaturesMSFT :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	featureCapacityInput: u32,
	featureCountOutput: ^u32,
	features: ^SceneComputeFeatureMSFT,
) -> Result

ProcCreateSceneObserverMSFT :: #type proc "c" (
	session: Session,
	createInfo: ^SceneObserverCreateInfoMSFT,
	sceneObserver: ^SceneObserverMSFT,
) -> Result

ProcDestroySceneObserverMSFT :: #type proc "c" (
	sceneObserver: SceneObserverMSFT,
) -> Result

ProcCreateSceneMSFT :: #type proc "c" (
	sceneObserver: SceneObserverMSFT,
	createInfo: ^SceneCreateInfoMSFT,
	scene: ^SceneMSFT,
) -> Result

ProcDestroySceneMSFT :: #type proc "c" (
	scene: SceneMSFT,
) -> Result

ProcComputeNewSceneMSFT :: #type proc "c" (
	sceneObserver: SceneObserverMSFT,
	computeInfo: ^NewSceneComputeInfoMSFT,
) -> Result

ProcGetSceneComputeStateMSFT :: #type proc "c" (
	sceneObserver: SceneObserverMSFT,
	state: ^SceneComputeStateMSFT,
) -> Result

ProcGetSceneComponentsMSFT :: #type proc "c" (
	scene: SceneMSFT,
	getInfo: ^SceneComponentsGetInfoMSFT,
	components: ^SceneComponentsMSFT,
) -> Result

ProcLocateSceneComponentsMSFT :: #type proc "c" (
	scene: SceneMSFT,
	locateInfo: ^SceneComponentsLocateInfoMSFT,
	locations: ^SceneComponentLocationsMSFT,
) -> Result

ProcGetSceneMeshBuffersMSFT :: #type proc "c" (
	scene: SceneMSFT,
	getInfo: ^SceneMeshBuffersGetInfoMSFT,
	buffers: ^SceneMeshBuffersMSFT,
) -> Result

ProcDeserializeSceneMSFT :: #type proc "c" (
	sceneObserver: SceneObserverMSFT,
	deserializeInfo: ^SceneDeserializeInfoMSFT,
) -> Result

ProcGetSerializedSceneFragmentDataMSFT :: #type proc "c" (
	scene: SceneMSFT,
	getInfo: ^SerializedSceneFragmentDataGetInfoMSFT,
	countInput: u32,
	readOutput: ^u32,
	buffer: ^u8,
) -> Result

ProcEnumerateDisplayRefreshRatesFB :: #type proc "c" (
	session: Session,
	displayRefreshRateCapacityInput: u32,
	displayRefreshRateCountOutput: ^u32,
	displayRefreshRates: ^f32,
) -> Result

ProcGetDisplayRefreshRateFB :: #type proc "c" (
	session: Session,
	displayRefreshRate: ^f32,
) -> Result

ProcRequestDisplayRefreshRateFB :: #type proc "c" (
	session: Session,
	displayRefreshRate: f32,
) -> Result

ProcCreateSpatialAnchorFromPerceptionAnchorMSFT :: #type proc "c" (
	session: Session,
	perceptionAnchor: ^IUnknown,
	anchor: ^SpatialAnchorMSFT,
) -> Result

ProcTryGetPerceptionAnchorFromSpatialAnchorMSFT :: #type proc "c" (
	session: Session,
	anchor: SpatialAnchorMSFT,
	perceptionAnchor: ^^IUnknown,
) -> Result

ProcUpdateSwapchainFB :: #type proc "c" (
	swapchain: Swapchain,
	state: ^SwapchainStateBaseHeaderFB,
) -> Result

ProcGetSwapchainStateFB :: #type proc "c" (
	swapchain: Swapchain,
	state: ^SwapchainStateBaseHeaderFB,
) -> Result

ProcEnumerateColorSpacesFB :: #type proc "c" (
	session: Session,
	colorSpaceCapacityInput: u32,
	colorSpaceCountOutput: ^u32,
	colorSpaces: ^ColorSpaceFB,
) -> Result

ProcSetColorSpaceFB :: #type proc "c" (
	session: Session,
	colorspace: ColorSpaceFB,
) -> Result

ProcCreateFoveationProfileFB :: #type proc "c" (
	session: Session,
	createInfo: ^FoveationProfileCreateInfoFB,
	profile: ^FoveationProfileFB,
) -> Result

ProcDestroyFoveationProfileFB :: #type proc "c" (
	profile: FoveationProfileFB,
) -> Result

ProcGetHandMeshFB :: #type proc "c" (
	handTracker: HandTrackerEXT,
	mesh: ^HandTrackingMeshFB,
) -> Result

ProcEnumerateRenderModelPathsFB :: #type proc "c" (
	session: Session,
	pathCapacityInput: u32,
	pathCountOutput: ^u32,
	paths: ^RenderModelPathInfoFB,
) -> Result

ProcGetRenderModelPropertiesFB :: #type proc "c" (
	session: Session,
	path: Path,
	properties: ^RenderModelPropertiesFB,
) -> Result

ProcLoadRenderModelFB :: #type proc "c" (
	session: Session,
	info: ^RenderModelLoadInfoFB,
	buffer: ^RenderModelBufferFB,
) -> Result

ProcQuerySystemTrackedKeyboardFB :: #type proc "c" (
	session: Session,
	queryInfo: ^KeyboardTrackingQueryFB,
	keyboard: ^KeyboardTrackingDescriptionFB,
) -> Result

ProcCreateKeyboardSpaceFB :: #type proc "c" (
	session: Session,
	createInfo: ^KeyboardSpaceCreateInfoFB,
	keyboardSpace: ^Space,
) -> Result

ProcSetEnvironmentDepthEstimationVARJO :: #type proc "c" (
	session: Session,
	enabled: b32,
) -> Result

ProcEnumerateReprojectionModesMSFT :: #type proc "c" (
	instance: Instance,
	systemId: SystemId,
	viewConfigurationType: ViewConfigurationType,
	modeCapacityInput: u32,
	modeCountOutput: ^u32,
	modes: ^ReprojectionModeMSFT,
) -> Result

ProcGetAudioOutputDeviceGuidOculus :: #type proc "c" (
	instance: Instance,
	buffer: [^]wchar_t,
) -> Result

ProcGetAudioInputDeviceGuidOculus :: #type proc "c" (
	instance: Instance,
	buffer: [^]wchar_t,
) -> Result

ProcCreateSpatialAnchorFB :: #type proc "c" (
	session: Session,
	info: ^SpatialAnchorCreateInfoFB,
	requestId: ^AsyncRequestIdFB,
) -> Result

ProcGetSpaceUuidFB :: #type proc "c" (
	space: Space,
	uuid: ^UuidEXT,
) -> Result

ProcEnumerateSpaceSupportedComponentsFB :: #type proc "c" (
	space: Space,
	componentTypeCapacityInput: u32,
	componentTypeCountOutput: ^u32,
	componentTypes: ^SpaceComponentTypeFB,
) -> Result

ProcSetSpaceComponentStatusFB :: #type proc "c" (
	space: Space,
	info: ^SpaceComponentStatusSetInfoFB,
	requestId: ^AsyncRequestIdFB,
) -> Result

ProcGetSpaceComponentStatusFB :: #type proc "c" (
	space: Space,
	componentType: SpaceComponentTypeFB,
	status: ^SpaceComponentStatusFB,
) -> Result

ProcCreateTriangleMeshFB :: #type proc "c" (
	session: Session,
	createInfo: ^TriangleMeshCreateInfoFB,
	outTriangleMesh: ^TriangleMeshFB,
) -> Result

ProcDestroyTriangleMeshFB :: #type proc "c" (
	mesh: TriangleMeshFB,
) -> Result

ProcTriangleMeshGetVertexBufferFB :: #type proc "c" (
	mesh: TriangleMeshFB,
	outVertexBuffer: ^^Vector3f,
) -> Result

ProcTriangleMeshGetIndexBufferFB :: #type proc "c" (
	mesh: TriangleMeshFB,
	outIndexBuffer: ^^u32,
) -> Result

ProcTriangleMeshBeginUpdateFB :: #type proc "c" (
	mesh: TriangleMeshFB,
) -> Result

ProcTriangleMeshEndUpdateFB :: #type proc "c" (
	mesh: TriangleMeshFB,
	vertexCount: u32,
	triangleCount: u32,
) -> Result

ProcTriangleMeshBeginVertexBufferUpdateFB :: #type proc "c" (
	mesh: TriangleMeshFB,
	outVertexCount: ^u32,
) -> Result

ProcTriangleMeshEndVertexBufferUpdateFB :: #type proc "c" (
	mesh: TriangleMeshFB,
) -> Result

ProcCreatePassthroughFB :: #type proc "c" (
	session: Session,
	createInfo: ^PassthroughCreateInfoFB,
	outPassthrough: ^PassthroughFB,
) -> Result

ProcDestroyPassthroughFB :: #type proc "c" (
	passthrough: PassthroughFB,
) -> Result

ProcPassthroughStartFB :: #type proc "c" (
	passthrough: PassthroughFB,
) -> Result

ProcPassthroughPauseFB :: #type proc "c" (
	passthrough: PassthroughFB,
) -> Result

ProcCreatePassthroughLayerFB :: #type proc "c" (
	session: Session,
	createInfo: ^PassthroughLayerCreateInfoFB,
	outLayer: ^PassthroughLayerFB,
) -> Result

ProcDestroyPassthroughLayerFB :: #type proc "c" (
	layer: PassthroughLayerFB,
) -> Result

ProcPassthroughLayerPauseFB :: #type proc "c" (
	layer: PassthroughLayerFB,
) -> Result

ProcPassthroughLayerResumeFB :: #type proc "c" (
	layer: PassthroughLayerFB,
) -> Result

ProcPassthroughLayerSetStyleFB :: #type proc "c" (
	layer: PassthroughLayerFB,
	style: ^PassthroughStyleFB,
) -> Result

ProcCreateGeometryInstanceFB :: #type proc "c" (
	session: Session,
	createInfo: ^GeometryInstanceCreateInfoFB,
	outGeometryInstance: ^GeometryInstanceFB,
) -> Result

ProcDestroyGeometryInstanceFB :: #type proc "c" (
	instance: GeometryInstanceFB,
) -> Result

ProcGeometryInstanceSetTransformFB :: #type proc "c" (
	instance: GeometryInstanceFB,
	transformation: ^GeometryInstanceTransformFB,
) -> Result

ProcQuerySpacesFB :: #type proc "c" (
	session: Session,
	info: ^SpaceQueryInfoBaseHeaderFB,
	requestId: ^AsyncRequestIdFB,
) -> Result

ProcRetrieveSpaceQueryResultsFB :: #type proc "c" (
	session: Session,
	requestId: AsyncRequestIdFB,
	results: ^SpaceQueryResultsFB,
) -> Result

ProcSaveSpaceFB :: #type proc "c" (
	session: Session,
	info: ^SpaceSaveInfoFB,
	requestId: ^AsyncRequestIdFB,
) -> Result

ProcEraseSpaceFB :: #type proc "c" (
	session: Session,
	info: ^SpaceEraseInfoFB,
	requestId: ^AsyncRequestIdFB,
) -> Result

ProcGetSpaceContainerFB :: #type proc "c" (
	session: Session,
	space: Space,
	spaceContainerOutput: ^SpaceContainerFB,
) -> Result

ProcGetSpaceBoundingBox2DFB :: #type proc "c" (
	session: Session,
	space: Space,
	boundingBox2DOutput: ^Rect2Df,
) -> Result

ProcGetSpaceBoundingBox3DFB :: #type proc "c" (
	session: Session,
	space: Space,
	boundingBox3DOutput: ^Rect3DfFB,
) -> Result

ProcGetSpaceSemanticLabelsFB :: #type proc "c" (
	session: Session,
	space: Space,
	semanticLabelsOutput: ^SemanticLabelsFB,
) -> Result

ProcGetSpaceBoundary2DFB :: #type proc "c" (
	session: Session,
	space: Space,
	boundary2DOutput: ^Boundary2DFB,
) -> Result

ProcGetSpaceRoomLayoutFB :: #type proc "c" (
	session: Session,
	space: Space,
	roomLayoutOutput: ^RoomLayoutFB,
) -> Result

ProcPassthroughLayerSetKeyboardHandsIntensityFB :: #type proc "c" (
	layer: PassthroughLayerFB,
	intensity: ^PassthroughKeyboardHandsIntensityFB,
) -> Result

ProcCreateSpatialAnchorStoreConnectionMSFT :: #type proc "c" (
	session: Session,
	spatialAnchorStore: ^SpatialAnchorStoreConnectionMSFT,
) -> Result

ProcDestroySpatialAnchorStoreConnectionMSFT :: #type proc "c" (
	spatialAnchorStore: SpatialAnchorStoreConnectionMSFT,
) -> Result

ProcPersistSpatialAnchorMSFT :: #type proc "c" (
	spatialAnchorStore: SpatialAnchorStoreConnectionMSFT,
	spatialAnchorPersistenceInfo: ^SpatialAnchorPersistenceInfoMSFT,
) -> Result

ProcEnumeratePersistedSpatialAnchorNamesMSFT :: #type proc "c" (
	spatialAnchorStore: SpatialAnchorStoreConnectionMSFT,
	spatialAnchorNamesCapacityInput: u32,
	spatialAnchorNamesCountOutput: ^u32,
	persistedAnchorNames: ^SpatialAnchorPersistenceNameMSFT,
) -> Result

ProcCreateSpatialAnchorFromPersistedNameMSFT :: #type proc "c" (
	session: Session,
	spatialAnchorCreateInfo: ^SpatialAnchorFromPersistedAnchorCreateInfoMSFT,
	spatialAnchor: ^SpatialAnchorMSFT,
) -> Result

ProcUnpersistSpatialAnchorMSFT :: #type proc "c" (
	spatialAnchorStore: SpatialAnchorStoreConnectionMSFT,
	spatialAnchorPersistenceName: ^SpatialAnchorPersistenceNameMSFT,
) -> Result

ProcClearSpatialAnchorStoreMSFT :: #type proc "c" (
	spatialAnchorStore: SpatialAnchorStoreConnectionMSFT,
) -> Result

ProcCreateFacialTrackerHTC :: #type proc "c" (
	session: Session,
	createInfo: ^FacialTrackerCreateInfoHTC,
	facialTracker: ^FacialTrackerHTC,
) -> Result

ProcDestroyFacialTrackerHTC :: #type proc "c" (
	facialTracker: FacialTrackerHTC,
) -> Result

ProcGetFacialExpressionsHTC :: #type proc "c" (
	facialTracker: FacialTrackerHTC,
	facialExpressions: ^FacialExpressionsHTC,
) -> Result

ProcCreatePassthroughHTC :: #type proc "c" (
	session: Session,
	createInfo: ^PassthroughCreateInfoHTC,
	passthrough: ^PassthroughHTC,
) -> Result

ProcDestroyPassthroughHTC :: #type proc "c" (
	passthrough: PassthroughHTC,
) -> Result

ProcEnumerateViveTrackerPathsHTCX :: #type proc "c" (
	instance: Instance,
	pathCapacityInput: u32,
	pathCountOutput: ^u32,
	paths: ^ViveTrackerPathsHTCX,
) -> Result

ProcSetMarkerTrackingVARJO :: #type proc "c" (
	session: Session,
	enabled: b32,
) -> Result

ProcSetMarkerTrackingTimeoutVARJO :: #type proc "c" (
	session: Session,
	markerId: u64,
	timeout: Duration,
) -> Result

ProcSetMarkerTrackingPredictionVARJO :: #type proc "c" (
	session: Session,
	markerId: u64,
	enabled: b32,
) -> Result

ProcGetMarkerSizeVARJO :: #type proc "c" (
	session: Session,
	markerId: u64,
	size: ^Extent2Df,
) -> Result

ProcCreateMarkerSpaceVARJO :: #type proc "c" (
	session: Session,
	createInfo: ^MarkerSpaceCreateInfoVARJO,
	space: ^Space,
) -> Result

ProcSetDigitalLensControlALMALENCE :: #type proc "c" (
	session: Session,
	digitalLensControl: ^DigitalLensControlALMALENCE,
) -> Result

ProcSetViewOffsetVARJO :: #type proc "c" (
	session: Session,
	offset: f32,
) -> Result

ProcEnumeratePerformanceMetricsCounterPathsMETA :: #type proc "c" (
	instance: Instance,
	counterPathCapacityInput: u32,
	counterPathCountOutput: ^u32,
	counterPaths: ^Path,
) -> Result

ProcSetPerformanceMetricsStateMETA :: #type proc "c" (
	session: Session,
	state: ^PerformanceMetricsStateMETA,
) -> Result

ProcGetPerformanceMetricsStateMETA :: #type proc "c" (
	session: Session,
	state: ^PerformanceMetricsStateMETA,
) -> Result

ProcQueryPerformanceMetricsCounterMETA :: #type proc "c" (
	session: Session,
	counterPath: Path,
	counter: ^PerformanceMetricsCounterMETA,
) -> Result

ProcApplyFoveationHTC :: #type proc "c" (
	session: Session,
	applyInfo: ^FoveationApplyInfoHTC,
) -> Result



GetInstanceProcAddr: ProcGetInstanceProcAddr
EnumerateApiLayerProperties: ProcEnumerateApiLayerProperties
EnumerateInstanceExtensionProperties: ProcEnumerateInstanceExtensionProperties
CreateInstance: ProcCreateInstance
DestroyInstance: ProcDestroyInstance
ResultToString: ProcResultToString
StructureTypeToString: ProcStructureTypeToString
GetInstanceProperties: ProcGetInstanceProperties
GetSystem: ProcGetSystem
GetSystemProperties: ProcGetSystemProperties
CreateSession: ProcCreateSession
DestroySession: ProcDestroySession
DestroySpace: ProcDestroySpace
EnumerateSwapchainFormats: ProcEnumerateSwapchainFormats
CreateSwapchain: ProcCreateSwapchain
DestroySwapchain: ProcDestroySwapchain
EnumerateSwapchainImages: ProcEnumerateSwapchainImages
AcquireSwapchainImage: ProcAcquireSwapchainImage
WaitSwapchainImage: ProcWaitSwapchainImage
ReleaseSwapchainImage: ProcReleaseSwapchainImage
BeginSession: ProcBeginSession
EndSession: ProcEndSession
RequestExitSession: ProcRequestExitSession
EnumerateReferenceSpaces: ProcEnumerateReferenceSpaces
CreateReferenceSpace: ProcCreateReferenceSpace
CreateActionSpace: ProcCreateActionSpace
LocateSpace: ProcLocateSpace
EnumerateViewConfigurations: ProcEnumerateViewConfigurations
EnumerateEnvironmentBlendModes: ProcEnumerateEnvironmentBlendModes
GetViewConfigurationProperties: ProcGetViewConfigurationProperties
EnumerateViewConfigurationViews: ProcEnumerateViewConfigurationViews
BeginFrame: ProcBeginFrame
LocateViews: ProcLocateViews
EndFrame: ProcEndFrame
WaitFrame: ProcWaitFrame
ApplyHapticFeedback: ProcApplyHapticFeedback
StopHapticFeedback: ProcStopHapticFeedback
PollEvent: ProcPollEvent
StringToPath: ProcStringToPath
PathToString: ProcPathToString
GetReferenceSpaceBoundsRect: ProcGetReferenceSpaceBoundsRect
SetAndroidApplicationThreadKHR: ProcSetAndroidApplicationThreadKHR
CreateSwapchainAndroidSurfaceKHR: ProcCreateSwapchainAndroidSurfaceKHR
GetActionStateBoolean: ProcGetActionStateBoolean
GetActionStateFloat: ProcGetActionStateFloat
GetActionStateVector2f: ProcGetActionStateVector2f
GetActionStatePose: ProcGetActionStatePose
CreateActionSet: ProcCreateActionSet
DestroyActionSet: ProcDestroyActionSet
CreateAction: ProcCreateAction
DestroyAction: ProcDestroyAction
SuggestInteractionProfileBindings: ProcSuggestInteractionProfileBindings
AttachSessionActionSets: ProcAttachSessionActionSets
GetCurrentInteractionProfile: ProcGetCurrentInteractionProfile
SyncActions: ProcSyncActions
EnumerateBoundSourcesForAction: ProcEnumerateBoundSourcesForAction
GetInputSourceLocalizedName: ProcGetInputSourceLocalizedName
GetVulkanInstanceExtensionsKHR: ProcGetVulkanInstanceExtensionsKHR
GetVulkanDeviceExtensionsKHR: ProcGetVulkanDeviceExtensionsKHR
GetVulkanGraphicsDeviceKHR: ProcGetVulkanGraphicsDeviceKHR
GetOpenGLGraphicsRequirementsKHR: ProcGetOpenGLGraphicsRequirementsKHR
GetOpenGLESGraphicsRequirementsKHR: ProcGetOpenGLESGraphicsRequirementsKHR
GetVulkanGraphicsRequirementsKHR: ProcGetVulkanGraphicsRequirementsKHR
GetD3D11GraphicsRequirementsKHR: ProcGetD3D11GraphicsRequirementsKHR
GetD3D12GraphicsRequirementsKHR: ProcGetD3D12GraphicsRequirementsKHR
PerfSettingsSetPerformanceLevelEXT: ProcPerfSettingsSetPerformanceLevelEXT
ThermalGetTemperatureTrendEXT: ProcThermalGetTemperatureTrendEXT
SetDebugUtilsObjectNameEXT: ProcSetDebugUtilsObjectNameEXT
CreateDebugUtilsMessengerEXT: ProcCreateDebugUtilsMessengerEXT
DestroyDebugUtilsMessengerEXT: ProcDestroyDebugUtilsMessengerEXT
SubmitDebugUtilsMessageEXT: ProcSubmitDebugUtilsMessageEXT
SessionBeginDebugUtilsLabelRegionEXT: ProcSessionBeginDebugUtilsLabelRegionEXT
SessionEndDebugUtilsLabelRegionEXT: ProcSessionEndDebugUtilsLabelRegionEXT
SessionInsertDebugUtilsLabelEXT: ProcSessionInsertDebugUtilsLabelEXT
ConvertTimeToWin32PerformanceCounterKHR: ProcConvertTimeToWin32PerformanceCounterKHR
ConvertWin32PerformanceCounterToTimeKHR: ProcConvertWin32PerformanceCounterToTimeKHR
CreateVulkanInstanceKHR: ProcCreateVulkanInstanceKHR
CreateVulkanDeviceKHR: ProcCreateVulkanDeviceKHR
GetVulkanGraphicsDevice2KHR: ProcGetVulkanGraphicsDevice2KHR
GetVulkanGraphicsRequirements2KHR: ProcGetVulkanGraphicsRequirementsKHR
ConvertTimeToTimespecTimeKHR: ProcConvertTimeToTimespecTimeKHR
ConvertTimespecTimeToTimeKHR: ProcConvertTimespecTimeToTimeKHR
GetVisibilityMaskKHR: ProcGetVisibilityMaskKHR
CreateSpatialAnchorMSFT: ProcCreateSpatialAnchorMSFT
CreateSpatialAnchorSpaceMSFT: ProcCreateSpatialAnchorSpaceMSFT
DestroySpatialAnchorMSFT: ProcDestroySpatialAnchorMSFT
SetInputDeviceActiveEXT: ProcSetInputDeviceActiveEXT
SetInputDeviceStateBoolEXT: ProcSetInputDeviceStateBoolEXT
SetInputDeviceStateFloatEXT: ProcSetInputDeviceStateFloatEXT
SetInputDeviceStateVector2fEXT: ProcSetInputDeviceStateVector2fEXT
SetInputDeviceLocationEXT: ProcSetInputDeviceLocationEXT
InitializeLoaderKHR: ProcInitializeLoaderKHR
CreateSpatialGraphNodeSpaceMSFT: ProcCreateSpatialGraphNodeSpaceMSFT
TryCreateSpatialGraphStaticNodeBindingMSFT: ProcTryCreateSpatialGraphStaticNodeBindingMSFT
DestroySpatialGraphNodeBindingMSFT: ProcDestroySpatialGraphNodeBindingMSFT
GetSpatialGraphNodeBindingPropertiesMSFT: ProcGetSpatialGraphNodeBindingPropertiesMSFT
CreateHandTrackerEXT: ProcCreateHandTrackerEXT
DestroyHandTrackerEXT: ProcDestroyHandTrackerEXT
LocateHandJointsEXT: ProcLocateHandJointsEXT
CreateHandMeshSpaceMSFT: ProcCreateHandMeshSpaceMSFT
UpdateHandMeshMSFT: ProcUpdateHandMeshMSFT
GetControllerModelKeyMSFT: ProcGetControllerModelKeyMSFT
LoadControllerModelMSFT: ProcLoadControllerModelMSFT
GetControllerModelPropertiesMSFT: ProcGetControllerModelPropertiesMSFT
GetControllerModelStateMSFT: ProcGetControllerModelStateMSFT
EnumerateSceneComputeFeaturesMSFT: ProcEnumerateSceneComputeFeaturesMSFT
CreateSceneObserverMSFT: ProcCreateSceneObserverMSFT
DestroySceneObserverMSFT: ProcDestroySceneObserverMSFT
CreateSceneMSFT: ProcCreateSceneMSFT
DestroySceneMSFT: ProcDestroySceneMSFT
ComputeNewSceneMSFT: ProcComputeNewSceneMSFT
GetSceneComputeStateMSFT: ProcGetSceneComputeStateMSFT
GetSceneComponentsMSFT: ProcGetSceneComponentsMSFT
LocateSceneComponentsMSFT: ProcLocateSceneComponentsMSFT
GetSceneMeshBuffersMSFT: ProcGetSceneMeshBuffersMSFT
DeserializeSceneMSFT: ProcDeserializeSceneMSFT
GetSerializedSceneFragmentDataMSFT: ProcGetSerializedSceneFragmentDataMSFT
EnumerateDisplayRefreshRatesFB: ProcEnumerateDisplayRefreshRatesFB
GetDisplayRefreshRateFB: ProcGetDisplayRefreshRateFB
RequestDisplayRefreshRateFB: ProcRequestDisplayRefreshRateFB
CreateSpatialAnchorFromPerceptionAnchorMSFT: ProcCreateSpatialAnchorFromPerceptionAnchorMSFT
TryGetPerceptionAnchorFromSpatialAnchorMSFT: ProcTryGetPerceptionAnchorFromSpatialAnchorMSFT
UpdateSwapchainFB: ProcUpdateSwapchainFB
GetSwapchainStateFB: ProcGetSwapchainStateFB
EnumerateColorSpacesFB: ProcEnumerateColorSpacesFB
SetColorSpaceFB: ProcSetColorSpaceFB
CreateFoveationProfileFB: ProcCreateFoveationProfileFB
DestroyFoveationProfileFB: ProcDestroyFoveationProfileFB
GetHandMeshFB: ProcGetHandMeshFB
EnumerateRenderModelPathsFB: ProcEnumerateRenderModelPathsFB
GetRenderModelPropertiesFB: ProcGetRenderModelPropertiesFB
LoadRenderModelFB: ProcLoadRenderModelFB
QuerySystemTrackedKeyboardFB: ProcQuerySystemTrackedKeyboardFB
CreateKeyboardSpaceFB: ProcCreateKeyboardSpaceFB
SetEnvironmentDepthEstimationVARJO: ProcSetEnvironmentDepthEstimationVARJO
EnumerateReprojectionModesMSFT: ProcEnumerateReprojectionModesMSFT
GetAudioOutputDeviceGuidOculus: ProcGetAudioOutputDeviceGuidOculus
GetAudioInputDeviceGuidOculus: ProcGetAudioInputDeviceGuidOculus
CreateSpatialAnchorFB: ProcCreateSpatialAnchorFB
GetSpaceUuidFB: ProcGetSpaceUuidFB
EnumerateSpaceSupportedComponentsFB: ProcEnumerateSpaceSupportedComponentsFB
SetSpaceComponentStatusFB: ProcSetSpaceComponentStatusFB
GetSpaceComponentStatusFB: ProcGetSpaceComponentStatusFB
CreateTriangleMeshFB: ProcCreateTriangleMeshFB
DestroyTriangleMeshFB: ProcDestroyTriangleMeshFB
TriangleMeshGetVertexBufferFB: ProcTriangleMeshGetVertexBufferFB
TriangleMeshGetIndexBufferFB: ProcTriangleMeshGetIndexBufferFB
TriangleMeshBeginUpdateFB: ProcTriangleMeshBeginUpdateFB
TriangleMeshEndUpdateFB: ProcTriangleMeshEndUpdateFB
TriangleMeshBeginVertexBufferUpdateFB: ProcTriangleMeshBeginVertexBufferUpdateFB
TriangleMeshEndVertexBufferUpdateFB: ProcTriangleMeshEndVertexBufferUpdateFB
CreatePassthroughFB: ProcCreatePassthroughFB
DestroyPassthroughFB: ProcDestroyPassthroughFB
PassthroughStartFB: ProcPassthroughStartFB
PassthroughPauseFB: ProcPassthroughPauseFB
CreatePassthroughLayerFB: ProcCreatePassthroughLayerFB
DestroyPassthroughLayerFB: ProcDestroyPassthroughLayerFB
PassthroughLayerPauseFB: ProcPassthroughLayerPauseFB
PassthroughLayerResumeFB: ProcPassthroughLayerResumeFB
PassthroughLayerSetStyleFB: ProcPassthroughLayerSetStyleFB
CreateGeometryInstanceFB: ProcCreateGeometryInstanceFB
DestroyGeometryInstanceFB: ProcDestroyGeometryInstanceFB
GeometryInstanceSetTransformFB: ProcGeometryInstanceSetTransformFB
QuerySpacesFB: ProcQuerySpacesFB
RetrieveSpaceQueryResultsFB: ProcRetrieveSpaceQueryResultsFB
SaveSpaceFB: ProcSaveSpaceFB
EraseSpaceFB: ProcEraseSpaceFB
GetSpaceContainerFB: ProcGetSpaceContainerFB
GetSpaceBoundingBox2DFB: ProcGetSpaceBoundingBox2DFB
GetSpaceBoundingBox3DFB: ProcGetSpaceBoundingBox3DFB
GetSpaceSemanticLabelsFB: ProcGetSpaceSemanticLabelsFB
GetSpaceBoundary2DFB: ProcGetSpaceBoundary2DFB
GetSpaceRoomLayoutFB: ProcGetSpaceRoomLayoutFB
PassthroughLayerSetKeyboardHandsIntensityFB: ProcPassthroughLayerSetKeyboardHandsIntensityFB
CreateSpatialAnchorStoreConnectionMSFT: ProcCreateSpatialAnchorStoreConnectionMSFT
DestroySpatialAnchorStoreConnectionMSFT: ProcDestroySpatialAnchorStoreConnectionMSFT
PersistSpatialAnchorMSFT: ProcPersistSpatialAnchorMSFT
EnumeratePersistedSpatialAnchorNamesMSFT: ProcEnumeratePersistedSpatialAnchorNamesMSFT
CreateSpatialAnchorFromPersistedNameMSFT: ProcCreateSpatialAnchorFromPersistedNameMSFT
UnpersistSpatialAnchorMSFT: ProcUnpersistSpatialAnchorMSFT
ClearSpatialAnchorStoreMSFT: ProcClearSpatialAnchorStoreMSFT
CreateFacialTrackerHTC: ProcCreateFacialTrackerHTC
DestroyFacialTrackerHTC: ProcDestroyFacialTrackerHTC
GetFacialExpressionsHTC: ProcGetFacialExpressionsHTC
CreatePassthroughHTC: ProcCreatePassthroughHTC
DestroyPassthroughHTC: ProcDestroyPassthroughHTC
EnumerateViveTrackerPathsHTCX: ProcEnumerateViveTrackerPathsHTCX
SetMarkerTrackingVARJO: ProcSetMarkerTrackingVARJO
SetMarkerTrackingTimeoutVARJO: ProcSetMarkerTrackingTimeoutVARJO
SetMarkerTrackingPredictionVARJO: ProcSetMarkerTrackingPredictionVARJO
GetMarkerSizeVARJO: ProcGetMarkerSizeVARJO
CreateMarkerSpaceVARJO: ProcCreateMarkerSpaceVARJO
SetDigitalLensControlALMALENCE: ProcSetDigitalLensControlALMALENCE
SetViewOffsetVARJO: ProcSetViewOffsetVARJO
EnumeratePerformanceMetricsCounterPathsMETA: ProcEnumeratePerformanceMetricsCounterPathsMETA
SetPerformanceMetricsStateMETA: ProcSetPerformanceMetricsStateMETA
GetPerformanceMetricsStateMETA: ProcGetPerformanceMetricsStateMETA
QueryPerformanceMetricsCounterMETA: ProcQueryPerformanceMetricsCounterMETA
ApplyFoveationHTC: ProcApplyFoveationHTC
