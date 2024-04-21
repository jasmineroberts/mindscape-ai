"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.OffsetHighlight = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/LineRenderer");
}
const _LineRenderer = RequireModule.requireModule("@src/Editor/LineRenderer");
if (false) {
    require("@src/Editor/Gizmo/GizmoUtils");
}
const _GizmoUtils = RequireModule.requireModule("@src/Editor/Gizmo/GizmoUtils");
if (false) {
    require("@src/Editor/Utils");
}
const _Utils = RequireModule.requireModule("@src/Editor/Utils");
class OffsetHighlight {
    constructor(offsetLineRenderer, camera) {
        this.offsetLineRenderer = offsetLineRenderer;
        this.camera = camera;
        this.lines = [];
        this.endLineSize = 0.1;
        this.shrinkLineValue = 0.05;
        this.minDistanceToShow = 0.4;
        for (let i = 0; i < 4; i++) {
            this.lines.push([vec3.zero(), vec3.zero()]);
        }
    }
    reset() {
        this.offsetLineRenderer.instance.reset();
    }
    drawOffsets(screenTransform, fijiScreenTransform) {
        if (!_Utils.module.Utils.isEditor()) {
            return;
        }
        this.offsetLineRenderer.instance.reset();
        const offsets = screenTransform.offsets;
        const worldSpaceCenter = screenTransform.localPointToWorldPoint(vec2.zero());
        const parentSpaceCenter = screenTransform.worldPointToParentPoint(worldSpaceCenter);
        this.lines.forEach((line) => {
            line[0].z = worldSpaceCenter.z;
            line[1].z = worldSpaceCenter.z;
        });
        const parentWidth = _GizmoUtils.module.GizmoUtils.getParentWorldWidth(screenTransform);
        const parentHeight = _GizmoUtils.module.GizmoUtils.getParentWorldHeight(screenTransform);
        const constraints = fijiScreenTransform === null || fijiScreenTransform === void 0 ? void 0 : fijiScreenTransform.constraints;
        if (constraints.pinToLeft) {
            let distanceToLeftParentSide = parentWidth * (parentSpaceCenter.x + 1) / 2;
            let distanceToLeftLocalSide = distanceToLeftParentSide - offsets.left;
            if (Math.abs(distanceToLeftLocalSide - distanceToLeftParentSide) > this.minDistanceToShow) {
                distanceToLeftParentSide -= this.shrinkLineValue * (distanceToLeftParentSide < distanceToLeftLocalSide ? -1 : 1);
                distanceToLeftLocalSide += this.shrinkLineValue * 6 * (distanceToLeftParentSide < distanceToLeftLocalSide ? -1 : 1);
                this.lines[0][0].x = worldSpaceCenter.x - distanceToLeftParentSide;
                this.lines[0][0].y = worldSpaceCenter.y;
                this.lines[0][1].x = worldSpaceCenter.x - distanceToLeftLocalSide;
                this.lines[0][1].y = worldSpaceCenter.y;
                const endLineDirection = vec3.up();
                this.offsetLineRenderer.instance.addLine(this.lines[0][0], this.lines[0][1]);
                this.offsetLineRenderer.instance.addLine(this.lines[0][0].add(endLineDirection.uniformScale(this.endLineSize)), this.lines[0][0].add(endLineDirection.uniformScale(-this.endLineSize)));
                this.offsetLineRenderer.instance.addLine(this.lines[0][1].add(endLineDirection.uniformScale(this.endLineSize)), this.lines[0][1].add(endLineDirection.uniformScale(-this.endLineSize)));
            }
        }
        if (constraints.pinToRight) {
            let distanceToRightParentSide = parentWidth - parentWidth * (parentSpaceCenter.x + 1) / 2;
            let distanceToRightLocalSide = distanceToRightParentSide + offsets.right;
            if (Math.abs(distanceToRightLocalSide - distanceToRightParentSide) > this.minDistanceToShow) {
                distanceToRightParentSide -= this.shrinkLineValue * (distanceToRightParentSide < distanceToRightLocalSide ? -1 : 1);
                distanceToRightLocalSide += this.shrinkLineValue * 6 * (distanceToRightParentSide < distanceToRightLocalSide ? -1 : 1);
                this.lines[1][0].x = worldSpaceCenter.x + distanceToRightParentSide;
                this.lines[1][0].y = worldSpaceCenter.y;
                this.lines[1][1].x = worldSpaceCenter.x + distanceToRightLocalSide;
                this.lines[1][1].y = worldSpaceCenter.y;
                const endLineDirection = vec3.up();
                this.offsetLineRenderer.instance.addLine(this.lines[1][0], this.lines[1][1]);
                this.offsetLineRenderer.instance.addLine(this.lines[1][0].add(endLineDirection.uniformScale(this.endLineSize)), this.lines[1][0].add(endLineDirection.uniformScale(-this.endLineSize)));
                this.offsetLineRenderer.instance.addLine(this.lines[1][1].add(endLineDirection.uniformScale(this.endLineSize)), this.lines[1][1].add(endLineDirection.uniformScale(-this.endLineSize)));
            }
        }
        if (constraints.pinToTop) {
            let distanceToTopParentSide = parentHeight - parentHeight * (parentSpaceCenter.y + 1) / 2;
            let distanceToTopLocalSide = distanceToTopParentSide + offsets.top;
            if (Math.abs(distanceToTopLocalSide - distanceToTopParentSide) > this.minDistanceToShow) {
                distanceToTopParentSide -= this.shrinkLineValue * (distanceToTopParentSide < distanceToTopLocalSide ? -1 : 1);
                distanceToTopLocalSide += this.shrinkLineValue * 6 * (distanceToTopParentSide < distanceToTopLocalSide ? -1 : 1);
                this.lines[2][0].x = worldSpaceCenter.x;
                this.lines[2][0].y = worldSpaceCenter.y + distanceToTopParentSide;
                this.lines[2][1].x = worldSpaceCenter.x;
                this.lines[2][1].y = worldSpaceCenter.y + distanceToTopLocalSide;
                const endLineDirection = vec3.left();
                this.offsetLineRenderer.instance.addLine(this.lines[2][0], this.lines[2][1]);
                this.offsetLineRenderer.instance.addLine(this.lines[2][0].add(endLineDirection.uniformScale(this.endLineSize)), this.lines[2][0].add(endLineDirection.uniformScale(-this.endLineSize)));
                this.offsetLineRenderer.instance.addLine(this.lines[2][1].add(endLineDirection.uniformScale(this.endLineSize)), this.lines[2][1].add(endLineDirection.uniformScale(-this.endLineSize)));
            }
        }
        if (constraints.pinToBottom) {
            let distanceToBottomParentSide = parentHeight * (parentSpaceCenter.y + 1) / 2;
            let distanceToBottomLocalSide = distanceToBottomParentSide - offsets.bottom;
            if (Math.abs(distanceToBottomLocalSide - distanceToBottomParentSide) > this.minDistanceToShow) {
                distanceToBottomParentSide -= this.shrinkLineValue * (distanceToBottomParentSide < distanceToBottomLocalSide ? -1 : 1);
                distanceToBottomLocalSide += this.shrinkLineValue * 6 * (distanceToBottomParentSide < distanceToBottomLocalSide ? -1 : 1);
                this.lines[3][0].x = worldSpaceCenter.x;
                this.lines[3][0].y = worldSpaceCenter.y - distanceToBottomParentSide;
                this.lines[3][1].x = worldSpaceCenter.x;
                this.lines[3][1].y = worldSpaceCenter.y - distanceToBottomLocalSide;
                const endLineDirection = vec3.left();
                this.offsetLineRenderer.instance.addLine(this.lines[3][0], this.lines[3][1]);
                this.offsetLineRenderer.instance.addLine(this.lines[3][0].add(endLineDirection.uniformScale(this.endLineSize)), this.lines[3][0].add(endLineDirection.uniformScale(-this.endLineSize)));
                this.offsetLineRenderer.instance.addLine(this.lines[3][1].add(endLineDirection.uniformScale(this.endLineSize)), this.lines[3][1].add(endLineDirection.uniformScale(-this.endLineSize)));
            }
        }
        this.offsetLineRenderer.instance.update();
    }
}
exports.OffsetHighlight = OffsetHighlight;
