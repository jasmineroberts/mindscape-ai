"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CursorRemoteServiceModule = exports.CursorRemoteMediaModule = exports.CursorTextureUploadOptions = exports.TriggerType = exports.RequestType = exports.RotationType = exports.CursorType = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/MouseCursor/CursorUtils");
}
const _CursorUtils = RequireModule.requireModule("@src/Editor/MouseCursor/CursorUtils");
var CursorType;
(function (CursorType) {
    CursorType[CursorType["Canvas"] = 0] = "Canvas";
    CursorType[CursorType["ClosedHand"] = 1] = "ClosedHand";
    CursorType[CursorType["OpenHand"] = 2] = "OpenHand";
    CursorType[CursorType["Rotation"] = 3] = "Rotation";
    CursorType[CursorType["Scale"] = 4] = "Scale";
    CursorType[CursorType["ZoomIn"] = 5] = "ZoomIn";
    CursorType[CursorType["ZoomOut"] = 6] = "ZoomOut";
    CursorType[CursorType["Default"] = 7] = "Default";
    CursorType[CursorType["Custom"] = 8] = "Custom";
})(CursorType = exports.CursorType || (exports.CursorType = {}));
var RotationType;
(function (RotationType) {
    RotationType[RotationType["Custom"] = 0] = "Custom";
    RotationType[RotationType["LockToWorldRotation"] = 1] = "LockToWorldRotation";
})(RotationType = exports.RotationType || (exports.RotationType = {}));
var RequestType;
(function (RequestType) {
    RequestType["SetCursor"] = "setCursor";
    RequestType["UnsetCursor"] = "unsetCursor";
})(RequestType = exports.RequestType || (exports.RequestType = {}));
var TriggerType;
(function (TriggerType) {
    TriggerType[TriggerType["onHover"] = 0] = "onHover";
    TriggerType[TriggerType["onTouch"] = 1] = "onTouch";
    TriggerType[TriggerType["onPinch"] = 2] = "onPinch";
    TriggerType[TriggerType["onPan"] = 3] = "onPan";
})(TriggerType = exports.TriggerType || (exports.TriggerType = {}));
exports.CursorTextureUploadOptions = ImageUploadOptions.create();
exports.CursorTextureUploadOptions.compressionQuality = CompressionQuality.MaximumQuality;
if (_CursorUtils.module.CursorUtils.isEditor()) {
    exports.CursorTextureUploadOptions.compressionMethod = ImageUploadCompressionMethod.PNG;
    exports.CursorTextureUploadOptions.includeAlpha = true;
}
exports.CursorRemoteMediaModule = global.assetSystem.createAsset("Asset.RemoteMediaModule");
exports.CursorRemoteServiceModule = global.assetSystem.createAsset("Asset.RemoteServiceModule");
exports.CursorRemoteServiceModule.apiSpecId = 'editor';
