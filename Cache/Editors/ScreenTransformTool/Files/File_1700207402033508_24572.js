"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DrawHelper = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/LineRenderer");
}
const _LineRenderer = RequireModule.requireModule("@src/Editor/LineRenderer");
class DrawHelper {
    constructor(horizontal, vertical, lineRenderer, camera) {
        this.horizontal = horizontal;
        this.vertical = vertical;
        this.lineRenderer = lineRenderer;
        this.camera = camera;
        this.EPS = 1e-5;
        this.extraPoints = [];
        this.screenPoint = vec2.zero();
        let isTouchActive = false;
        this.lineRenderer.createEvent("TouchStartEvent").bind(() => {
            isTouchActive = true;
        });
        this.lineRenderer.createEvent("TouchEndEvent").bind(() => {
            isTouchActive = false;
        });
        this.lineRenderer.createEvent("LateUpdateEvent").bind(() => {
            if (!isTouchActive) {
                this.lineRenderer.instance.reset();
            }
        });
    }
    drawLines(corners, extraPoints = []) {
        this.extraPoints = extraPoints;
        this.drawVerticals(corners);
        this.drawHorizontals(corners);
    }
    drawHorizontals(corners) {
        if (!this.horizontal.length) {
            return;
        }
        corners.forEach((cornerPoint) => {
            let upperBound = this.upperBound(this.horizontal, cornerPoint, (pointA, pointB) => {
                return pointA.y - pointB.y;
            });
            let lowerBound = this.lowerBound(this.horizontal, cornerPoint, (pointA, pointB) => {
                return pointA.y - pointB.y;
            });
            this.extraPoints.forEach((point) => {
                if (point.y !== cornerPoint.y) {
                    return;
                }
                if (upperBound.y !== cornerPoint.y) {
                    upperBound.x = point.x;
                    upperBound.y = cornerPoint.y;
                }
                if (lowerBound.y !== cornerPoint.y) {
                    lowerBound.x = point.x;
                    lowerBound.y = cornerPoint.y;
                }
                upperBound.x = Math.min(upperBound.x, point.x);
                lowerBound.x = Math.max(lowerBound.x, point.x);
            });
            if (cornerPoint.y !== upperBound.y || upperBound.y !== lowerBound.y || upperBound.x > lowerBound.x) {
                return;
            }
            this.drawHorizontalMinMax(Math.min(upperBound.x, cornerPoint.x), Math.max(lowerBound.x, cornerPoint.x), cornerPoint.y);
        });
    }
    drawHorizontalMinMax(minX, maxX, Y) {
        if (minX > maxX) {
            return;
        }
        this.screenPoint.y = Y;
        this.screenPoint.x = minX;
        const worldPointA = this.camera.screenSpaceToWorldSpace(this.screenPoint, 10);
        this.screenPoint.x = maxX;
        const worldPointB = this.camera.screenSpaceToWorldSpace(this.screenPoint, 10);
        this.lineRenderer.instance.addLine(worldPointA, worldPointB);
    }
    drawVerticals(corners) {
        if (!this.vertical.length) {
            return;
        }
        corners.forEach((cornerPoint) => {
            const upperBound = this.upperBound(this.vertical, cornerPoint, (pointA, pointB) => {
                return pointA.x - pointB.x;
            });
            const lowerBound = this.lowerBound(this.vertical, cornerPoint, (pointA, pointB) => {
                return pointA.x - pointB.x;
            });
            this.extraPoints.forEach((point) => {
                if (point.x !== cornerPoint.x) {
                    return;
                }
                if (upperBound.x !== cornerPoint.x) {
                    upperBound.x = cornerPoint.x;
                    upperBound.y = point.y;
                }
                if (lowerBound.x !== cornerPoint.x) {
                    lowerBound.x = cornerPoint.x;
                    lowerBound.y = point.y;
                }
                upperBound.y = Math.min(upperBound.y, point.y);
                lowerBound.y = Math.max(lowerBound.y, point.y);
            });
            if (cornerPoint.x !== upperBound.x || upperBound.x !== lowerBound.x || upperBound.y > lowerBound.y) {
                return;
            }
            this.drawVerticalMinMax(Math.min(upperBound.y, cornerPoint.y), Math.max(lowerBound.y, cornerPoint.y), cornerPoint.x);
        });
    }
    drawVerticalMinMax(minY, maxY, X) {
        if (minY > maxY) {
            return;
        }
        this.screenPoint.x = X;
        this.screenPoint.y = minY;
        const worldPointA = this.camera.screenSpaceToWorldSpace(this.screenPoint, 10);
        this.screenPoint.y = maxY;
        const worldPointB = this.camera.screenSpaceToWorldSpace(this.screenPoint, 10);
        this.lineRenderer.instance.addLine(worldPointA, worldPointB);
    }
    lowerBound(arr, point, func) {
        let l = 0;
        let r = arr.length - 1;
        while (r - l > 0) {
            const mid = Math.floor((l + r) / 2);
            if (func(arr[mid], point) < 0) {
                l = mid + 1;
            }
            else {
                r = mid;
            }
        }
        return new vec2(arr[l].x, arr[l].y);
    }
    upperBound(arr, point, func) {
        let l = 0;
        let r = arr.length - 1;
        while (r - l > 0) {
            const mid = Math.floor((l + r + 1) / 2);
            if (func(arr[mid], point) <= 0) {
                l = mid;
            }
            else {
                r = mid - 1;
            }
        }
        return new vec2(arr[l].x, arr[l].y);
    }
}
exports.DrawHelper = DrawHelper;
