package openxr

import "core:c"

Flags64 :: distinct u64

// Constants

MAX_EXTENSION_NAME_SIZE :: 128
MAX_API_LAYER_NAME_SIZE :: 256
MAX_API_LAYER_DESCRIPTION_SIZE :: 256
MAX_SYSTEM_NAME_SIZE :: 256
MAX_APPLICATION_NAME_SIZE :: 128
MAX_ENGINE_NAME_SIZE :: 128
MAX_RUNTIME_NAME_SIZE :: 128
MAX_PATH_LENGTH :: 256
MAX_STRUCTURE_NAME_SIZE :: 64
MAX_RESULT_STRING_SIZE :: 64
MAX_GRAPHICS_APIS_SUPPORTED :: 32
MAX_ACTION_SET_NAME_SIZE :: 64
MAX_ACTION_NAME_SIZE :: 64
MAX_LOCALIZED_ACTION_SET_NAME_SIZE :: 128
MAX_LOCALIZED_ACTION_NAME_SIZE :: 128


StructureType :: enum c.int {
	UNKNOWN = 0,
	API_LAYER_PROPERTIES = 1,
	EXTENSION_PROPERTIES = 2,
	INSTANCE_CREATE_INFO = 3,
	SYSTEM_GET_INFO = 4,
	SYSTEM_PROPERTIES = 5,
	VIEW_LOCATE_INFO = 6,
	VIEW = 7,
	SESSION_CREATE_INFO = 8,
	SWAPCHAIN_CREATE_INFO = 9,
	SESSION_BEGIN_INFO = 10,
	VIEW_STATE = 11,
	FRAME_END_INFO = 12,
	HAPTIC_VIBRATION = 13,
	EVENT_DATA_BUFFER = 16,
	EVENT_DATA_INSTANCE_LOSS_PENDING = 17,
	EVENT_DATA_SESSION_STATE_CHANGED = 18,
	ACTION_STATE_BOOLEAN = 23,
	ACTION_STATE_FLOAT = 24,
	ACTION_STATE_VECTOR2F = 25,
	ACTION_STATE_POSE = 27,
	ACTION_SET_CREATE_INFO = 28,
	ACTION_CREATE_INFO = 29,
	INSTANCE_PROPERTIES = 32,
	FRAME_WAIT_INFO = 33,
	COMPOSITION_LAYER_PROJECTION = 35,
	COMPOSITION_LAYER_QUAD = 36,
	REFERENCE_SPACE_CREATE_INFO = 37,
	ACTION_SPACE_CREATE_INFO = 38,
	EVENT_DATA_REFERENCE_SPACE_CHANGE_PENDING = 40,
	VIEW_CONFIGURATION_VIEW = 41,
	SPACE_LOCATION = 42,
	SPACE_VELOCITY = 43,
	FRAME_STATE = 44,
	VIEW_CONFIGURATION_PROPERTIES = 45,
	FRAME_BEGIN_INFO = 46,
	COMPOSITION_LAYER_PROJECTION_VIEW = 48,
	EVENT_DATA_EVENTS_LOST = 49,
	INTERACTION_PROFILE_SUGGESTED_BINDING = 51,
	EVENT_DATA_INTERACTION_PROFILE_CHANGED = 52,
	INTERACTION_PROFILE_STATE = 53,
	SWAPCHAIN_IMAGE_ACQUIRE_INFO = 55,
	SWAPCHAIN_IMAGE_WAIT_INFO = 56,
	SWAPCHAIN_IMAGE_RELEASE_INFO = 57,
	ACTION_STATE_GET_INFO = 58,
	HAPTIC_ACTION_INFO = 59,
	SESSION_ACTION_SETS_ATTACH_INFO = 60,
	ACTIONS_SYNC_INFO = 61,
	BOUND_SOURCES_FOR_ACTION_ENUMERATE_INFO = 62,
	INPUT_SOURCE_LOCALIZED_NAME_GET_INFO = 63,
}

Result :: enum c.int {
	SUCCESS = 0, // Function successfully completed.
	TIMEOUT_EXPIRED = 1, // The specified timeout time occurred before the operation could complete.
	SESSION_LOSS_PENDING = 3, // The session will be lost soon.
	EVENT_UNAVAILABLE = 4, // No event was available.
	SPACE_BOUNDS_UNAVAILABLE = 7, // The space's bounds are not known at the moment.
	SESSION_NOT_FOCUSED = 8, // The session is not in the focused state.
	FRAME_DISCARDED = 9, // A frame has been discarded from composition.
	ERROR_VALIDATION_FAILURE = -1, // The function usage was invalid in some way.
	ERROR_RUNTIME_FAILURE = -2, // The runtime failed to handle the function in an unexpected way that is not covered by another error result.
	ERROR_OUT_OF_MEMORY = -3, // A memory allocation has failed.
	ERROR_API_VERSION_UNSUPPORTED = -4, // The runtime does not support the requested API version.
	ERROR_INITIALIZATION_FAILED = -6, // Initialization of object could not be completed.
	ERROR_FUNCTION_UNSUPPORTED = -7, // The requested function was not found or is otherwise unsupported.
	ERROR_FEATURE_UNSUPPORTED = -8, // The requested feature is not supported.
	ERROR_EXTENSION_NOT_PRESENT = -9, // A requested extension is not supported.
	ERROR_LIMIT_REACHED = -10, // The runtime supports no more of the requested resource.
	ERROR_SIZE_INSUFFICIENT = -11, // The supplied size was smaller than required.
	ERROR_HANDLE_INVALID = -12, // A supplied object handle was invalid.
	ERROR_INSTANCE_LOST = -13, // The slink:XrInstance was lost or could not be found. It will need to be destroyed and optionally recreated.
	ERROR_SESSION_RUNNING = -14, // The session &lt;&lt;session_running, is already running&gt;&gt;.
	ERROR_SESSION_NOT_RUNNING = -16, // The session &lt;&lt;session_not_running, is not yet running&gt;&gt;.
	ERROR_SESSION_LOST = -17, // The slink:XrSession was lost. It will need to be destroyed and optionally recreated.
	ERROR_SYSTEM_INVALID = -18, // The provided basetype:XrSystemId was invalid.
	ERROR_PATH_INVALID = -19, // The provided basetype:XrPath was not valid.
	ERROR_PATH_COUNT_EXCEEDED = -20, // The maximum number of supported semantic paths has been reached.
	ERROR_PATH_FORMAT_INVALID = -21, // The semantic path character format is invalid.
	ERROR_PATH_UNSUPPORTED = -22, // The semantic path is unsupported.
	ERROR_LAYER_INVALID = -23, // The layer was NULL or otherwise invalid.
	ERROR_LAYER_LIMIT_EXCEEDED = -24, // The number of specified layers is greater than the supported number.
	ERROR_SWAPCHAIN_RECT_INVALID = -25, // The image rect was negatively sized or otherwise invalid.
	ERROR_SWAPCHAIN_FORMAT_UNSUPPORTED = -26, // The image format is not supported by the runtime or platform.
	ERROR_ACTION_TYPE_MISMATCH = -27, // The API used to retrieve an action's state does not match the action's type.
	ERROR_SESSION_NOT_READY = -28, // The session is not in the ready state.
	ERROR_SESSION_NOT_STOPPING = -29, // The session is not in the stopping state.
	ERROR_TIME_INVALID = -30, // The provided basetype:XrTime was zero, negative, or out of range.
	ERROR_REFERENCE_SPACE_UNSUPPORTED = -31, // The specified reference space is not supported by the runtime or system.
	ERROR_FILE_ACCESS_ERROR = -32, // The file could not be accessed.
	ERROR_FILE_CONTENTS_INVALID = -33, // The file's contents were invalid.
	ERROR_FORM_FACTOR_UNSUPPORTED = -34, // The specified form factor is not supported by the current runtime or platform.
	ERROR_FORM_FACTOR_UNAVAILABLE = -35, // The specified form factor is supported, but the device is currently not available, e.g. not plugged in or powered off.
	ERROR_API_LAYER_NOT_PRESENT = -36, // A requested API layer is not present or could not be loaded.
	ERROR_CALL_ORDER_INVALID = -37, // The call was made without having made a previously required call.
	ERROR_GRAPHICS_DEVICE_INVALID = -38, // The given graphics device is not in a valid state. The graphics device could be lost or initialized without meeting graphics requirements.
	ERROR_POSE_INVALID = -39, // The supplied pose was invalid with respect to the requirements.
	ERROR_INDEX_OUT_OF_RANGE = -40, // The supplied index was outside the range of valid indices.
	ERROR_VIEW_CONFIGURATION_TYPE_UNSUPPORTED = -41, // The specified view configuration type is not supported by the runtime or platform.
	ERROR_ENVIRONMENT_BLEND_MODE_UNSUPPORTED = -42, // The specified environment blend mode is not supported by the runtime or platform.
	ERROR_NAME_DUPLICATED = -44, // The name provided was a duplicate of an already-existing resource.
	ERROR_NAME_INVALID = -45, // The name provided was invalid.
	ERROR_ACTIONSET_NOT_ATTACHED = -46, // A referenced action set is not attached to the session.
	ERROR_ACTIONSETS_ALREADY_ATTACHED = -47, // The session already has attached action sets.
	ERROR_LOCALIZED_NAME_DUPLICATED = -48, // The localized name provided was a duplicate of an already-existing resource.
	ERROR_LOCALIZED_NAME_INVALID = -49, // The localized name provided was invalid.
	ERROR_GRAPHICS_REQUIREMENTS_CALL_MISSING = -50, // The fname:xrGetGraphicsRequirements* call was not made before calling fname:xrCreateSession.
	ERROR_RUNTIME_UNAVAILABLE = -51, // The loader was unable to find or load a runtime.
}

ObjectType :: enum c.int {
	UNKNOWN = 0,
	INSTANCE = 1, // XrInstance
	SESSION = 2, // XrSession
	SWAPCHAIN = 3, // XrSwapchain
	SPACE = 4, // XrSpace
	ACTION_SET = 5, // XrActionSet
	ACTION = 6, // XrAction
}

AndroidThreadTypeKHR :: enum c.int {
	APPLICATION_MAIN = 1,
	APPLICATION_WORKER = 2,
	RENDERER_MAIN = 3,
	RENDERER_WORKER = 4,
}

EyeVisibility :: enum c.int {
	BOTH = 0, // Display in both eyes.
	LEFT = 1, // Display in the left eye only.
	RIGHT = 2, // Display in the right eye only.
}

ActionType :: enum c.int {
	BOOLEAN_INPUT = 1,
	FLOAT_INPUT = 2,
	VECTOR2F_INPUT = 3,
	POSE_INPUT = 4,
	VIBRATION_OUTPUT = 100,
}

ReferenceSpaceType :: enum c.int {
	VIEW = 1,
	LOCAL = 2,
	STAGE = 3,
}

FormFactor :: enum c.int {
	HEAD_MOUNTED_DISPLAY = 1,
	HANDHELD_DISPLAY = 2,
}

ViewConfigurationType :: enum c.int {
	PRIMARY_MONO = 1,
	PRIMARY_STEREO = 2,
}

EnvironmentBlendMode :: enum c.int {
	OPAQUE = 1,
	ADDITIVE = 2,
	ALPHA_BLEND = 3,
}

SessionState :: enum c.int {
	UNKNOWN = 0,
	IDLE = 1,
	READY = 2,
	SYNCHRONIZED = 3,
	VISIBLE = 4,
	FOCUSED = 5,
	STOPPING = 6,
	LOSS_PENDING = 7,
	EXITING = 8,
}

PerfSettingsLevelEXT :: enum c.int {
	POWER_SAVINGS = 0, // Performance settings hint used by the application to indicate that it enters a non-XR section (head-locked / static screen), during which power savings are to be prioritized
	SUSTAINED_LOW = 25, // Performance settings hint used by the application to indicate that it enters a low and stable complexity section, during which reducing power is more important than occasional late rendering frames
	SUSTAINED_HIGH = 50, // Performance settings hint used by the application to indicate that it enters a high or dynamic complexity section, during which the XR Runtime strives for consistent XR compositing and frame rendering within a thermally sustainable range
	BOOST = 75, // Performance settings hint used by the application to indicate that the application enters a section with very high complexity, during which the XR Runtime is allowed to step up beyond the thermally sustainable range
}

PerfSettingsDomainEXT :: enum c.int {
	CPU = 1, // Indicates that the performance settings or notification applies to CPU domain
	GPU = 2, // Indicates that the performance settings or notification applies to GPU domain
}

PerfSettingsSubDomainEXT :: enum c.int {
	COMPOSITING = 1, // Indicates that the performance notification originates from the COMPOSITING sub-domain
	RENDERING = 2, // Indicates that the performance notification originates from the RENDERING sub-domain
	THERMAL = 3, // Indicates that the performance notification originates from the THERMAL sub-domain
}

PerfSettingsNotificationLevelEXT :: enum c.int {
	NORMAL = 0, // Notifies that the sub-domain has reached a level where no further actions other than currently applied are necessary
	WARNING = 25, // Notifies that the sub-domain has reached an early warning level where the application should start proactive mitigation actions with the goal to return to the ename:XR_PERF_NOTIF_LEVEL_NORMAL level
	IMPAIRED = 75, // Notifies that the sub-domain has reached a critical level with significant performance degradation. The application should take drastic mitigation action
}

VisibilityMaskTypeKHR :: enum c.int {
	HIDDEN_TRIANGLE_MESH = 1, // exclusive mesh; indicates that which the viewer cannot see.
	VISIBLE_TRIANGLE_MESH = 2, // inclusive mesh; indicates strictly that which the viewer can see.
	LINE_LOOP = 3, // line loop; traces the outline of the area the viewer can see.
}

HandEXT :: enum c.int {
	LEFT = 1,
	RIGHT = 2,
}

HandJointEXT :: enum c.int {
	PALM = 0,
	WRIST = 1,
	THUMB_METACARPAL = 2,
	THUMB_PROXIMAL = 3,
	THUMB_DISTAL = 4,
	THUMB_TIP = 5,
	INDEX_METACARPAL = 6,
	INDEX_PROXIMAL = 7,
	INDEX_INTERMEDIATE = 8,
	INDEX_DISTAL = 9,
	INDEX_TIP = 10,
	MIDDLE_METACARPAL = 11,
	MIDDLE_PROXIMAL = 12,
	MIDDLE_INTERMEDIATE = 13,
	MIDDLE_DISTAL = 14,
	MIDDLE_TIP = 15,
	RING_METACARPAL = 16,
	RING_PROXIMAL = 17,
	RING_INTERMEDIATE = 18,
	RING_DISTAL = 19,
	RING_TIP = 20,
	LITTLE_METACARPAL = 21,
	LITTLE_PROXIMAL = 22,
	LITTLE_INTERMEDIATE = 23,
	LITTLE_DISTAL = 24,
	LITTLE_TIP = 25,
}

HandJointSetEXT :: enum c.int {
	DEFAULT = 0,
}

HandJointsMotionRangeEXT :: enum c.int {
	UNOBSTRUCTED = 1,
	CONFORMING_TO_CONTROLLER = 2,
}

HandPoseTypeMSFT :: enum c.int {
	TRACKED = 0,
	REFERENCE_OPEN_PALM = 1,
}

ColorSpaceFB :: enum c.int {
	UNMANAGED = 0,
	REC2020 = 1,
	REC709 = 2,
	RIFT_CV1 = 3,
	RIFT_S = 4,
	QUEST = 5,
	P3 = 6,
	ADOBE_RGB = 7,
}

BlendFactorFB :: enum c.int {
	ZERO = 0,
	ONE = 1,
	SRC_ALPHA = 2,
	ONE_MINUS_SRC_ALPHA = 3,
	DST_ALPHA = 4,
	ONE_MINUS_DST_ALPHA = 5,
}

ReprojectionModeMSFT :: enum c.int {
	DEPTH = 1,
	PLANAR_FROM_DEPTH = 2,
	PLANAR_MANUAL = 3,
	ORIENTATION_ONLY = 4,
}

HandForearmJointULTRALEAP :: enum c.int {
	PALM = 0,
	WRIST = 1,
	THUMB_METACARPAL = 2,
	THUMB_PROXIMAL = 3,
	THUMB_DISTAL = 4,
	THUMB_TIP = 5,
	INDEX_METACARPAL = 6,
	INDEX_PROXIMAL = 7,
	INDEX_INTERMEDIATE = 8,
	INDEX_DISTAL = 9,
	INDEX_TIP = 10,
	MIDDLE_METACARPAL = 11,
	MIDDLE_PROXIMAL = 12,
	MIDDLE_INTERMEDIATE = 13,
	MIDDLE_DISTAL = 14,
	MIDDLE_TIP = 15,
	RING_METACARPAL = 16,
	RING_PROXIMAL = 17,
	RING_INTERMEDIATE = 18,
	RING_DISTAL = 19,
	RING_TIP = 20,
	LITTLE_METACARPAL = 21,
	LITTLE_PROXIMAL = 22,
	LITTLE_INTERMEDIATE = 23,
	LITTLE_DISTAL = 24,
	LITTLE_TIP = 25,
	ELBOW = 26,
}

InstanceCreateFlags :: distinct bit_set[InstanceCreateFlag; Flags64]
InstanceCreateFlag :: enum Flags64 {
}

SessionCreateFlags :: distinct bit_set[SessionCreateFlag; Flags64]
SessionCreateFlag :: enum Flags64 {
}

SwapchainCreateFlags :: distinct bit_set[SwapchainCreateFlag; Flags64]
SwapchainCreateFlag :: enum Flags64 {
	PROTECTED_CONTENT = 0, // Content will be protected from CPU access
	STATIC_IMAGE = 1, // Only one image will be acquired from this swapchain over its lifetime
}

SwapchainUsageFlags :: distinct bit_set[SwapchainUsageFlag; Flags64]
SwapchainUsageFlag :: enum Flags64 {
	COLOR_ATTACHMENT = 0, // Specifies that the image may: be a color rendering target.
	DEPTH_STENCIL_ATTACHMENT = 1, // Specifies that the image may: be a depth/stencil rendering target.
	UNORDERED_ACCESS = 2, // Specifies that the image may: be accessed out of order and that access may: be via atomic operations.
	TRANSFER_SRC = 3, // Specifies that the image may: be used as the source of a transfer operation.
	TRANSFER_DST = 4, // Specifies that the image may: be used as the destination of a transfer operation.
	SAMPLED = 5, // Specifies that the image may: be sampled by a shader.
	MUTABLE_FORMAT = 6, // Specifies that the image may: be reinterpreted as another image format.
}

ViewStateFlags :: distinct bit_set[ViewStateFlag; Flags64]
ViewStateFlag :: enum Flags64 {
	ORIENTATION_VALID = 0, // Indicates validity of all slink:XrView orientations
	POSITION_VALID = 1, // Indicates validity of all slink:XrView positions
	ORIENTATION_TRACKED = 2, // Indicates whether all slink:XrView orientations are actively tracked
	POSITION_TRACKED = 3, // Indicates whether all slink:XrView positions are actively tracked
}

CompositionLayerFlags :: distinct bit_set[CompositionLayerFlag; Flags64]
CompositionLayerFlag :: enum Flags64 {
	CORRECT_CHROMATIC_ABERRATION = 0, // Enables chromatic aberration correction when not done by default. This flag has no effect on any known conformant runtime, and is planned for deprecation for OpenXR 1.1
	BLEND_TEXTURE_SOURCE_ALPHA = 1, // Enables the layer texture alpha channel.
	UNPREMULTIPLIED_ALPHA = 2, // Indicates the texture color channels have not been premultiplied by the texture alpha channel.
}

SpaceLocationFlags :: distinct bit_set[SpaceLocationFlag; Flags64]
SpaceLocationFlag :: enum Flags64 {
	ORIENTATION_VALID = 0, // Indicates that the pname:orientation member contains valid data
	POSITION_VALID = 1, // Indicates that the pname:position member contains valid data
	ORIENTATION_TRACKED = 2, // Indicates whether pname:pose member contains an actively tracked pname:orientation
	POSITION_TRACKED = 3, // Indicates whether pname:pose member contains an actively tracked pname:position
}

SpaceVelocityFlags :: distinct bit_set[SpaceVelocityFlag; Flags64]
SpaceVelocityFlag :: enum Flags64 {
	LINEAR_VALID = 0, // Indicates that the pname:linearVelocity member contains valid data. Applications must: not read the pname:linearVelocity field if this flag is unset.
	ANGULAR_VALID = 1, // Indicates that the pname:angularVelocity member contains valid data. Applications must: not read the pname:angularVelocity field if this flag is unset.
}

InputSourceLocalizedNameFlags :: distinct bit_set[InputSourceLocalizedNameFlag; Flags64]
InputSourceLocalizedNameFlag :: enum Flags64 {
	USER_PATH = 0, // Asks for the part of the string which indicates the top level user path the source represents
	INTERACTION_PROFILE = 1, // Asks for the part of the string which represents the interaction profile of the source
	COMPONENT = 2, // Asks for the part of the string which represents the component on the device which needs to be interacted with
}

VulkanInstanceCreateFlagsKHR :: distinct bit_set[VulkanInstanceCreateFlagKHR; Flags64]
VulkanInstanceCreateFlagKHR :: enum Flags64 {
}

VulkanDeviceCreateFlagsKHR :: distinct bit_set[VulkanDeviceCreateFlagKHR; Flags64]
VulkanDeviceCreateFlagKHR :: enum Flags64 {
}

DebugUtilsMessageSeverityFlagsEXT :: distinct bit_set[DebugUtilsMessageSeverityFlagEXT; Flags64]
DebugUtilsMessageSeverityFlagEXT :: enum Flags64 {
	VERBOSE = 0, // Most verbose output severity, typically used for debugging.
	INFO = 4, // General info message
	WARNING = 8, // Indicates the item may be the cause of issues.
	ERROR = 12, // Indicates that the item is definitely related to erroneous behavior.
}

DebugUtilsMessageTypeFlagsEXT :: distinct bit_set[DebugUtilsMessageTypeFlagEXT; Flags64]
DebugUtilsMessageTypeFlagEXT :: enum Flags64 {
	GENERAL = 0, // Indicates this is a general message
	VALIDATION = 1, // Indicates the message is related to a validation message
	PERFORMANCE = 2, // Indicates the message is related to a potential performance situation
	CONFORMANCE = 3, // Indicates the message is related to a non-conformant runtime result
}

OverlayMainSessionFlagsEXTX :: distinct bit_set[OverlayMainSessionFlagEXTX; Flags64]
OverlayMainSessionFlagEXTX :: enum Flags64 {
	ENABLED_COMPOSITION_LAYER_INFO_DEPTH = 0, // Indicates the main session enabled `XR_KHR_composition_layer_depth`
}

OverlaySessionCreateFlagsEXTX :: distinct bit_set[OverlaySessionCreateFlagEXTX; Flags64]
OverlaySessionCreateFlagEXTX :: enum Flags64 {
}

SpatialGraphNodeTypeMSFT :: enum c.int {
	STATIC = 1,
	DYNAMIC = 2,
}

SceneObjectTypeMSFT :: enum c.int {
	UNCATEGORIZED = -1,
	BACKGROUND = 1,
	WALL = 2,
	FLOOR = 3,
	CEILING = 4,
	PLATFORM = 5,
	INFERRED = 6,
}

ScenePlaneAlignmentTypeMSFT :: enum c.int {
	NON_ORTHOGONAL = 0,
	HORIZONTAL = 1,
	VERTICAL = 2,
}

SceneComputeStateMSFT :: enum c.int {
	NONE = 0,
	UPDATING = 1,
	COMPLETED = 2,
	COMPLETED_WITH_ERROR = 3,
}

SceneComponentTypeMSFT :: enum c.int {
	INVALID = -1,
	OBJECT = 1,
	PLANE = 2,
	VISUAL_MESH = 3,
	COLLIDER_MESH = 4,
}

SceneComputeFeatureMSFT :: enum c.int {
	PLANE = 1,
	PLANE_MESH = 2,
	VISUAL_MESH = 3,
	COLLIDER_MESH = 4,
}

SceneComputeConsistencyMSFT :: enum c.int {
	SNAPSHOT_COMPLETE = 1,
	SNAPSHOT_INCOMPLETE_FAST = 2,
	OCCLUSION_OPTIMIZED = 3,
}

MeshComputeLodMSFT :: enum c.int {
	COARSE = 1,
	MEDIUM = 2,
	FINE = 3,
	UNLIMITED = 4,
}

AndroidSurfaceSwapchainFlagsFB :: distinct bit_set[AndroidSurfaceSwapchainFlagFB; Flags64]
AndroidSurfaceSwapchainFlagFB :: enum Flags64 {
	SYNCHRONOUS = 0, // Create the underlying BufferQueue in synchronous mode
	USE_TIMESTAMPS = 1, // Acquire most recent buffer whose presentation timestamp is not greater than display time of final composited frame
}

CompositionLayerImageLayoutFlagsFB :: distinct bit_set[CompositionLayerImageLayoutFlagFB; Flags64]
CompositionLayerImageLayoutFlagFB :: enum Flags64 {
	VERTICAL_FLIP = 0, // The coordinate origin of the swapchain image must be considered to be flipped vertically.
}

SwapchainCreateFoveationFlagsFB :: distinct bit_set[SwapchainCreateFoveationFlagFB; Flags64]
SwapchainCreateFoveationFlagFB :: enum Flags64 {
	SCALED_BIN = 0, // Explicitly create the swapchain with scaled bin foveation support. The application must ensure that the swapchain is using the OpenGL graphics API and that the QCOM_texture_foveated extension is supported and enabled.
	FRAGMENT_DENSITY_MAP = 1, // Explicitly create the swapchain with fragment density map foveation support. The application must ensure that the swapchain is using the Vulkan graphics API and that the VK_EXT_fragment_density_map extension is supported and enabled.
}

SwapchainStateFoveationFlagsFB :: distinct bit_set[SwapchainStateFoveationFlagFB; Flags64]
SwapchainStateFoveationFlagFB :: enum Flags64 {
}

CompositionLayerSecureContentFlagsFB :: distinct bit_set[CompositionLayerSecureContentFlagFB; Flags64]
CompositionLayerSecureContentFlagFB :: enum Flags64 {
	EXCLUDE_LAYER = 0, // Indicates the layer will only be visible inside the HMD, and not visible to external sources
	REPLACE_LAYER = 1, // Indicates the layer will be displayed inside the HMD, but replaced by proxy content when written to external sources
}

SpaceComponentTypeFB :: enum c.int {
	LOCATABLE = 0, // Enables tracking the 6 DOF pose of the slink:XrSpace with flink:xrLocateSpace.
	STORABLE = 1, // Enables persistence operations: save and erase.
	BOUNDED_2D = 3, // Bounded 2D component.
	BOUNDED_3D = 4, // Bounded 3D component.
	SEMANTIC_LABELS = 5, // Semantic labels component.
	ROOM_LAYOUT = 6, // Room layout component.
	SPACE_CONTAINER = 7, // Space container component.
}

FoveationLevelFB :: enum c.int {
	NONE = 0, // No foveation
	LOW = 1, // Less foveation (higher periphery visual fidelity, lower performance)
	MEDIUM = 2, // Medium foveation (medium periphery visual fidelity, medium performance)
	HIGH = 3, // High foveation (lower periphery visual fidelity, higher performance)
}

FoveationDynamicFB :: enum c.int {
	DISABLED = 0, // Static foveation at the maximum desired level
	LEVEL_ENABLED = 1, // Dynamic changing foveation based on performance headroom available up to the maximum desired level
}

WindingOrderFB :: enum c.int {
	UNKNOWN = 0, // Winding order is unknown and the runtime cannot make any assumptions on the triangle orientation
	CW = 1, // Clockwise winding order
	CCW = 2, // Counter-clockwise winding order
}

TriangleMeshFlagsFB :: distinct bit_set[TriangleMeshFlagFB; Flags64]
TriangleMeshFlagFB :: enum Flags64 {
	MUTABLE = 0, // The triangle mesh is mutable (can be modified after it is created).
}

PassthroughLayerPurposeFB :: enum c.int {
	RECONSTRUCTION = 0, // Reconstruction passthrough (full screen environment)
	PROJECTED = 1, // Projected passthrough (using a custom surface)
}

PassthroughFlagsFB :: distinct bit_set[PassthroughFlagFB; Flags64]
PassthroughFlagFB :: enum Flags64 {
	IS_RUNNING_AT_CREATION = 0, // The object (passthrough, layer) is running at creation.
	LAYER_DEPTH = 1, // The passthrough system sends depth information to the compositor. Only applicable to layer objects.
}

PassthroughStateChangedFlagsFB :: distinct bit_set[PassthroughStateChangedFlagFB; Flags64]
PassthroughStateChangedFlagFB :: enum Flags64 {
	REINIT_REQUIRED = 0, // Passthrough system requires reinitialization.
	NON_RECOVERABLE_ERROR = 1, // Non-recoverable error has occurred. A device reboot or a firmware update may be required.
	RECOVERABLE_ERROR = 2, // A recoverable error has occurred. The runtime will attempt to recover, but some functionality may be temporarily unavailable.
	RESTORED_ERROR = 3, // The runtime has recovered from a previous error and is functioning normally.
}

PassthroughCapabilityFlagsFB :: distinct bit_set[PassthroughCapabilityFlagFB; Flags64]
PassthroughCapabilityFlagFB :: enum Flags64 {
	XR_PASSTHROUGH_CAPABILITY = 0, // The system supports passthrough.
	COLOR = 1, // The system can show passthrough with realistic colors. ename:XR_PASSTHROUGH_CAPABILITY_BIT_FB must: be set if ename:XR_PASSTHROUGH_CAPABILITY_COLOR_BIT_FB is set.
	LAYER_DEPTH = 2, // The system supports passthrough layers composited using depth testing. ename:XR_PASSTHROUGH_CAPABILITY_BIT_FB must: be set if ename:XR_PASSTHROUGH_CAPABILITY_LAYER_DEPTH_BIT_FB is set.
}

SpaceQueryActionFB :: enum c.int {
	LOAD = 0, // Tells the query to perform a load operation on any slink:XrSpace returned by the query.
}

SpaceStorageLocationFB :: enum c.int {
	INVALID = 0, // Invalid storage location
	LOCAL = 1, // Local device storage
}

SpacePersistenceModeFB :: enum c.int {
	INVALID = 0, // Invalid storage persistence
	INDEFINITE = 1, // Store slink:XrSpace indefinitely, or until erased
}

HandTrackingAimFlagsFB :: distinct bit_set[HandTrackingAimFlagFB; Flags64]
HandTrackingAimFlagFB :: enum Flags64 {
	COMPUTED = 0, // Aiming data is computed from additional sources beyond the hand data in the base structure
	VALID = 1, // Aiming data is valid
	INDEX_PINCHING = 2, // Index finger pinch discrete signal
	MIDDLE_PINCHING = 3, // Middle finger pinch discrete signal
	RING_PINCHING = 4, // Ring finger pinch discrete signal
	LITTLE_PINCHING = 5, // Little finger pinch discrete signal
	SYSTEM_GESTURE = 6, // System gesture is active
	DOMINANT_HAND = 7, // Hand is currently marked as dominant for the system
	MENU_PRESSED = 8, // System menu gesture is active
}

KeyboardTrackingFlagsFB :: distinct bit_set[KeyboardTrackingFlagFB; Flags64]
KeyboardTrackingFlagFB :: enum Flags64 {
	EXISTS = 0, // indicates that the system has a physically tracked keyboard to report.  If not set then no other bits should be considered to be valid or meaningful.  If set either XR_KEYBOARD_TRACKING_LOCAL_BIT_FB or XR_KEYBOARD_TRACKING_REMOTE_BIT_FB must also be set.
	LOCAL = 1, // indicates that the physically tracked keyboard is intended to be used in a local pairing with the system.  Mutally exclusive with XR_KEYBOARD_TRACKING_REMOTE_BIT_FB.
	REMOTE = 2, // indicates that the physically tracked keyboard is intended to be used while paired to a separate remote computing device. Mutally exclusive with XR_KEYBOARD_TRACKING_LOCAL_BIT_FB.
	CONNECTED = 3, // indicates that the physically tracked keyboard is actively connected to the headset and capable of sending key data
}

KeyboardTrackingQueryFlagsFB :: distinct bit_set[KeyboardTrackingQueryFlagFB; Flags64]
KeyboardTrackingQueryFlagFB :: enum Flags64 {
	LOCAL = 1, // indicates the query is for the physically tracked keyboard that is intended to be used in a local pairing with the System. Mutally exclusive with XR_KEYBOARD_TRACKING_QUERY_REMOTE_BIT_FB.
	REMOTE = 2, // indicates the query is for the physically tracked keyboard that may be connected to a separate remote computing device. Mutally exclusive with XR_KEYBOARD_TRACKING_QUERY_LOCAL_BIT_FB.
}

CompositionLayerSpaceWarpInfoFlagsFB :: distinct bit_set[CompositionLayerSpaceWarpInfoFlagFB; Flags64]
CompositionLayerSpaceWarpInfoFlagFB :: enum Flags64 {
	FRAME_SKIP = 0, // Skip current frame's space warp extrapolation
}

RenderModelFlagsFB :: distinct bit_set[RenderModelFlagFB; Flags64]
RenderModelFlagFB :: enum Flags64 {
	SUPPORTS_GLTF_2_0_SUBSET_1 = 0, // Minimal level of support.  Can only contain a single mesh.  Can only contain a single texture.  Can not contain transparency.  Assumes unlit rendering.  Requires Extension KHR_texturebasisu.
	SUPPORTS_GLTF_2_0_SUBSET_2 = 1, // All of XR_RENDER_MODEL_SUPPORTS_GLTF_2_0_SUBSET_1_BIT_FB support plus: Multiple meshes. Multiple Textures. Texture Transparency.
}

FacialTrackingTypeHTC :: enum c.int {
	EYE_DEFAULT = 1, // Specifies this handle will observe eye expressions, with values indexed by elink:XrEyeExpressionHTC whose count is dlink:XR_FACIAL_EXPRESSION_EYE_COUNT_HTC.
	LIP_DEFAULT = 2, // Specifies this handle will observe lip expressions, with values indexed by elink:XrLipExpressionHTC whose count is dlink:XR_FACIAL_EXPRESSION_LIP_COUNT_HTC.
}

PassthroughFormHTC :: enum c.int {
	PLANAR = 0, // Presents the passthrough with full of the entire screen.
	PROJECTED = 1, // Presents the passthrough projecting onto a custom mesh.
}

EyeExpressionHTC :: enum c.int {
	LEFT_BLINK = 0,
	LEFT_WIDE = 1,
	RIGHT_BLINK = 2,
	RIGHT_WIDE = 3,
	LEFT_SQUEEZE = 4,
	RIGHT_SQUEEZE = 5,
	LEFT_DOWN = 6,
	RIGHT_DOWN = 7,
	LEFT_OUT = 8,
	RIGHT_IN = 9,
	LEFT_IN = 10,
	RIGHT_OUT = 11,
	LEFT_UP = 12,
	RIGHT_UP = 13,
}

LipExpressionHTC :: enum c.int {
	JAW_RIGHT = 0,
	JAW_LEFT = 1,
	JAW_FORWARD = 2,
	JAW_OPEN = 3,
	MOUTH_APE_SHAPE = 4,
	MOUTH_UPPER_RIGHT = 5,
	MOUTH_UPPER_LEFT = 6,
	MOUTH_LOWER_RIGHT = 7,
	MOUTH_LOWER_LEFT = 8,
	MOUTH_UPPER_OVERTURN = 9,
	MOUTH_LOWER_OVERTURN = 10,
	MOUTH_POUT = 11,
	MOUTH_SMILE_RIGHT = 12,
	MOUTH_SMILE_LEFT = 13,
	MOUTH_SAD_RIGHT = 14,
	MOUTH_SAD_LEFT = 15,
	CHEEK_PUFF_RIGHT = 16,
	CHEEK_PUFF_LEFT = 17,
	CHEEK_SUCK = 18,
	MOUTH_UPPER_UPRIGHT = 19,
	MOUTH_UPPER_UPLEFT = 20,
	MOUTH_LOWER_DOWNRIGHT = 21,
	MOUTH_LOWER_DOWNLEFT = 22,
	MOUTH_UPPER_INSIDE = 23,
	MOUTH_LOWER_INSIDE = 24,
	MOUTH_LOWER_OVERLAY = 25,
	TONGUE_LONGSTEP1 = 26,
	TONGUE_LEFT = 27,
	TONGUE_RIGHT = 28,
	TONGUE_UP = 29,
	TONGUE_DOWN = 30,
	TONGUE_ROLL = 31,
	TONGUE_LONGSTEP2 = 32,
	TONGUE_UPRIGHT_MORPH = 33,
	TONGUE_UPLEFT_MORPH = 34,
	TONGUE_DOWNRIGHT_MORPH = 35,
	TONGUE_DOWNLEFT_MORPH = 36,
}

DigitalLensControlFlagsALMALENCE :: distinct bit_set[DigitalLensControlFlagALMALENCE; Flags64]
DigitalLensControlFlagALMALENCE :: enum Flags64 {
	PROCESSING_DISABLE = 0, // disables Digital Lens processing of render textures
}

CompositionLayerSettingsFlagsFB :: distinct bit_set[CompositionLayerSettingsFlagFB; Flags64]
CompositionLayerSettingsFlagFB :: enum Flags64 {
	NORMAL_SUPER_SAMPLING = 0, // Indicates compositor may: use layer texture supersampling.
	QUALITY_SUPER_SAMPLING = 1, // Indicates compositor may: use high quality layer texture supersampling.
	NORMAL_SHARPENING = 2, // Indicates compositor may: use layer texture sharpening.
	QUALITY_SHARPENING = 3, // Indicates compositor may: use high quality layer texture sharpening.
}

PerformanceMetricsCounterFlagsMETA :: distinct bit_set[PerformanceMetricsCounterFlagMETA; Flags64]
PerformanceMetricsCounterFlagMETA :: enum Flags64 {
	ANY_VALUE_VALID = 0, // Indicates any of the values in XrPerformanceMetricsCounterMETA is valid.
	UINT_VALUE_VALID = 1, // Indicates the uintValue in XrPerformanceMetricsCounterMETA is valid.
	FLOAT_VALUE_VALID = 2, // Indicates the floatValue in XrPerformanceMetricsCounterMETA is valid.
}

PerformanceMetricsCounterUnitMETA :: enum c.int {
	GENERIC = 0, // the performance counter unit is generic (unspecified).
	PERCENTAGE = 1, // the performance counter unit is percentage (%).
	MILLISECONDS = 2, // the performance counter unit is millisecond.
	BYTES = 3, // the performance counter unit is byte.
	HERTZ = 4, // the performance counter unit is hertz (Hz).
}

FoveationModeHTC :: enum c.int {
	DISABLE = 0, // No foveation
	FIXED = 1, // Apply system default setting with fixed clear FOV and periphery quality.
	DYNAMIC = 2, // Allow system to set foveation dynamically according realtime system metric or other extensions.
	CUSTOM = 3, // Allow application to set foveation with desired clear FOV, periphery quality, and focal center offset.
}

FoveationDynamicFlagsHTC :: distinct bit_set[FoveationDynamicFlagHTC; Flags64]
FoveationDynamicFlagHTC :: enum Flags64 {
	LEVEL_ENABLED = 0, // Allow system to set periphery pixel density dynamically.
	CLEAR_FOV_ENABLED = 1, // Allow system to set clear FOV degree dynamically.
	FOCAL_CENTER_OFFSET_ENABLED = 2, // Allow system to set focal center offset dynamically.
}

FoveationLevelHTC :: enum c.int {
	NONE = 0, // No foveation
	LOW = 1, // Light periphery pixel density drop and lower performance gain.
	MEDIUM = 2, // Medium periphery pixel density drop and medium performance gain
	HIGH = 3, // Heavy periphery pixel density drop and higher performance gain
}

