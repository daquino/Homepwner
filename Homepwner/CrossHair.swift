import UIKit

class CrossHair: UIView {
    var crossHairColor: UIColor?
    required override init(frame: CGRect) {
        super.init(frame: frame)
        crossHairColor = UIColor(red: 8, green: 8, blue: 8, alpha: 0.7)
        backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        if let ctx = UIGraphicsGetCurrentContext() {
            let bounds = self.bounds
            var center = CGPoint()
            center.x = (bounds.origin.x + bounds.size.width) / 2.0
            center.y = (bounds.origin.y + bounds.size.height) / 2.0 - 20
            
            CGContextSetLineWidth(ctx, 2)
            
            var topVert = CGPoint()
            topVert.x = center.x
            topVert.y = center.y - 40
            
            var botVert = CGPoint()
            botVert.x = center.x
            botVert.y = center.y + 40
            
            var leadingHori = CGPoint()
            leadingHori.x = center.x - 40
            leadingHori.y = center.y
            
            var trailingHori = CGPoint()
            trailingHori.x = center.x + 40
            trailingHori.y = center.y
            
            self.crossHairColor?.setStroke()
            
            CGContextMoveToPoint(ctx, topVert.x, topVert.y)
            CGContextAddLineToPoint(ctx, botVert.x, botVert.y)
            CGContextStrokePath(ctx)
            
            CGContextMoveToPoint(ctx, leadingHori.x, leadingHori.y)
            CGContextAddLineToPoint(ctx, trailingHori.x, trailingHori.y)
            CGContextStrokePath(ctx)
        }
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return false
    }
}