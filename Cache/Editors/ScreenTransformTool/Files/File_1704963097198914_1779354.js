"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AnchorPoint = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Gizmo/Points/SidePoint");
}
const _SidePoint = RequireModule.requireModule("@src/Editor/Gizmo/Points/SidePoint");
class AnchorPoint extends _SidePoint.module.SidePoint {
    constructor(sceneObject) {
        super(sceneObject);
    }
    setPosition(position) {
        this.screenTransform.anchors.setCenter(position);
    }
}
exports.AnchorPoint = AnchorPoint;
