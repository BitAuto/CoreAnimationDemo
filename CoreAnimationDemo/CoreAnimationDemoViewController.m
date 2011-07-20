//
//  CoreAnimationDemoViewController.m
//  CoreAnimationDemo
//
//  Created by Joost on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreAnimationDemoViewController.h"
#import  <QuartzCore/QuartzCore.h>

float degreeToRadian(float degree)
{
    return degree * M_PI/180.0f;
}


@implementation CoreAnimationDemoViewController
@synthesize radianValue;
@synthesize time;
@synthesize lx;
@synthesize ly;
@synthesize lz;
@synthesize lr;
@synthesize endSet;
@synthesize elephant;
@synthesize hippo;
@synthesize segmented;
@synthesize xValue;
@synthesize yValue;
@synthesize zValue;
@synthesize controlButton;

- (void)dealloc
{
    [elephant release];
    [hippo release];
    [segmented release];
    [xValue release];
    [yValue release];
    [zValue release];
    [controlButton release];
    [radianValue release];
    [time release];
    [lx release];
    [ly release];
    [lz release];
    [lr release];
    [endSet release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self switchAnimation: segmented];

}


- (void)viewDidUnload
{
    [self setElephant:nil];
    [self setHippo:nil];
    [self setSegmented:nil];
    [self setXValue:nil];
    [self setYValue:nil];
    [self setZValue:nil];
    [self setControlButton:nil];
    [self setRadianValue:nil];
    [self setTime:nil];
    [self setLx:nil];
    [self setLy:nil];
    [self setLz:nil];
    [self setLr:nil];
    [self setEndSet:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}
const static float kScale = 0.5;
const static float kAnimationTime=0.75;
- (CABasicAnimation*) animationOfKeyPath:(NSString *) name
{
    
    CABasicAnimation * scaleAnimation =[CABasicAnimation animationWithKeyPath: name];
    scaleAnimation.duration=[time.text floatValue];
    return scaleAnimation;
}


- (IBAction)switchAnimation:(id)sender
{
    switch (segmented.selectedSegmentIndex)
    {
        case 0:
            xValue.text = @"1.3";
            yValue.text = @"1.3";
            zValue.text = @"1.0";
            lx.text = @"x -axis scale";
            ly.text = @"y -axis scale";
            lz.text = @"z -axis scale";
            lr.text = @"N/A";
            break;
        case 1:
            xValue.text = @"0";
            yValue.text = @"0";
            zValue.text = @"1.0";
            radianValue.text = @"35";
            lx.text = @"vector x";
            ly.text = @"vector y";
            lz.text = @"vector z";
            lr.text = @"angle";
            break;
        case 2:
            xValue.text = @"30";
            yValue.text = @"40";
            lx.text = @"x -axis offset";
            ly.text = @"y -axis offset";
            lz.text = @"N/A";
            lr.text = @"N/A";
            break;
        case 3:
            xValue.text = @"0";
            yValue.text = @"1";
            lx.text = @"begin shadowOpacity";
            ly.text = @"end shadowOpacity";
            lz.text = @"N/A";
            lr.text = @"N/A";
            break;
        case 4:
            lx.text = @"begin - width";
            ly.text = @"begin - height";
            lz.text = @"end - width";
            lr.text = @"end -height";
            break;
        case 5:
            lx.text = @"animationKeyPath";
            xValue.text = @"transform.rotation.z";
            time.text = @"0.5";
            radianValue.text = @"3";
            lr.text = @"angle";
            
            lz.text = @"N/A";
            ly.text = @"N/A";
            
            break;
            
        case 6:
            lx.text = @"animationKeyPath";
            xValue.text = @"position";
            time.text = @"0.5";
            radianValue.text = @"3";
            lr.text = @"angle";
            
            lz.text = @"N/A";
            ly.text = @"N/A";
            break;
        case 7:
            lx.text = @"type";
            ly.text = @"subType";
            lz.text = @"startProgress";
            lr.text = @"endProgress";
            xValue.text = @"0";
            yValue.text = @"0";
            zValue.text = @"0";
            radianValue.text = @"1.0";
            break;
            
        default:
            break;
    }
}

- (CAKeyframeAnimation *) jumpAnimation
{
    CAKeyframeAnimation * _jump = [CAKeyframeAnimation animationWithKeyPath: @"position"];
    _jump.duration = [time.text floatValue];
    _jump.repeatCount = 1;
    CGPoint _pos = elephant.layer.position;
    _jump.beginTime = CACurrentMediaTime();
    NSMutableArray *_values = [NSMutableArray arrayWithCapacity:3];
    [_values addObject:  [NSValue valueWithCGPoint: CGPointMake(_pos.x,_pos.y)]];
     [_values addObject:  [NSValue valueWithCGPoint: CGPointMake(_pos.x+50,_pos.y+30)]];
    [_values addObject:  [NSValue valueWithCGPoint: CGPointMake(_pos.x+100,_pos.y-30)]];
    [_values addObject:  [NSValue valueWithCGPoint: CGPointMake(_pos.x+150,_pos.y+30)]];
    _jump.values = _values;
    return  _jump;
}
- (CAKeyframeAnimation *) shakeAnimation
{
    CAKeyframeAnimation * _shake = [CAKeyframeAnimation animationWithKeyPath: @"transform.rotation.z"];
    _shake.duration = [time.text floatValue];
    _shake.repeatCount = 1000;
    srand([[NSDate date] timeIntervalSince1970]);
    float _rand = (float)random();
    _shake.beginTime = CACurrentMediaTime();
    NSMutableArray *_values = [NSMutableArray arrayWithCapacity:3];
    [_values addObject: [NSNumber numberWithFloat:  degreeToRadian(-[radianValue.text floatValue]) ]];
    [_values addObject: [NSNumber numberWithFloat:  degreeToRadian([radianValue.text floatValue]) ]];
    [_values addObject: [NSNumber numberWithFloat:  degreeToRadian(-[radianValue.text floatValue]) ]];
    _shake.values = _values;
    return  _shake;
}

- (IBAction)show:(id)sender
{

    switch (segmented.selectedSegmentIndex)
    {
        case 0:
        {
            CABasicAnimation * scaleAnimation = [self animationOfKeyPath: @"transform"];
            scaleAnimation.fromValue=[NSValue valueWithCATransform3D:CATransform3DIdentity];
            CATransform3D _transform =CATransform3DMakeScale([xValue.text floatValue],[yValue.text floatValue],[zValue.text floatValue]);
            scaleAnimation.toValue=[NSValue valueWithCATransform3D: _transform];
            [elephant.layer addAnimation: scaleAnimation forKey:nil];
            /* key
             A string that specifies an identifier for the animation. Only one animation per unique key is added to the layer. The special key kCATransition is automatically used for transition animations. The nil pointer is also a valid key.
             */
            if (endSet.on)
            {
                 [elephant.layer setTransform: _transform];
            }
           
        }
            break;
        case 1:
        {
            
            CABasicAnimation * scaleAnimation = [self animationOfKeyPath: @"transform"];
            scaleAnimation.fromValue=[NSValue valueWithCATransform3D:CATransform3DIdentity];
            CATransform3D _transform = CATransform3DMakeRotation(degreeToRadian([radianValue.text floatValue]) ,[xValue.text floatValue],[yValue.text floatValue],[zValue.text floatValue]);
            scaleAnimation.toValue=[NSValue valueWithCATransform3D: _transform];
            [elephant.layer addAnimation: scaleAnimation forKey:nil];
            /* key
             A string that specifies an identifier for the animation. Only one animation per unique key is added to the layer. The special key kCATransition is automatically used for transition animations. The nil pointer is also a valid key.
             */
            if (endSet.on)
            {
                [elephant.layer setTransform: _transform];
            }
            break;
        }
        case 2:
        {
            CABasicAnimation * scaleAnimation = [self animationOfKeyPath: @"transform"];
            scaleAnimation.fromValue=[NSValue valueWithCATransform3D:CATransform3DIdentity];
            CATransform3D _transform = CATransform3DMakeTranslation([xValue.text floatValue],[yValue.text floatValue],[zValue.text floatValue]);
            scaleAnimation.toValue=[NSValue valueWithCATransform3D: _transform];
            [elephant.layer addAnimation: scaleAnimation forKey:nil];
            /* key
             A string that specifies an identifier for the animation. Only one animation per unique key is added to the layer. The special key kCATransition is automatically used for transition animations. The nil pointer is also a valid key.
             */
            if (endSet.on)
            {
                [elephant.layer setTransform: _transform];
            }
            break;
        }
        case 3:
        {
            CABasicAnimation * scaleAnimation = [self animationOfKeyPath: @"shadowOpacity"];
            scaleAnimation.fromValue=[NSNumber numberWithFloat: [xValue.text floatValue]];
           
            scaleAnimation.toValue=[NSNumber numberWithFloat: [yValue.text floatValue]];
            [elephant.layer addAnimation: scaleAnimation forKey:nil];
            if (endSet.on)
            {
            elephant.layer.shadowOpacity = 1.0f;
            }

        }
            
            break;
        case 4:
        {
            CABasicAnimation * scaleAnimation = [self animationOfKeyPath: @"shadowOffset"];
            scaleAnimation.fromValue=[NSValue valueWithCGSize: CGSizeFromString([NSString stringWithFormat:@"{%@,%@}",xValue.text,yValue.text])];
            
            scaleAnimation.toValue=[NSValue valueWithCGSize: CGSizeFromString([NSString stringWithFormat:@"{%@,%@}",zValue.text,radianValue.text])];
            [elephant.layer addAnimation: scaleAnimation forKey:nil];
            if (endSet.on)
            {
            elephant.layer.shadowOffset = CGSizeFromString([NSString stringWithFormat:@"{%@,%@}",zValue.text,radianValue.text]);
            }
            
        }
            
            break;
        case 5:
        {
            [elephant.layer addAnimation: [self shakeAnimation] forKey:@"shake"];
            break;
        }
        case 6:
        {
            CAAnimationGroup * _group = [CAAnimationGroup animation];
            _group.animations = [NSArray arrayWithObjects: [self jumpAnimation], [self shakeAnimation],nil];
            [elephant.layer addAnimation: [self jumpAnimation] forKey:@"group"];
            break;
        }
            case 7:
        {
            NSString *types[4] = {kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
            NSString *subtypes[4] = {kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom};
            
            CATransition * _animation = [CATransition animation];
            _animation.type =types[[xValue.text intValue]];
            if ([xValue.text intValue]<3) 
            {
                 _animation.subtype = subtypes[[yValue.text intValue]];
            }
           
            _animation.startProgress = [zValue.text floatValue];
            _animation.endProgress = [radianValue.text floatValue];
            _animation.duration = [time.text floatValue];
            [elephant.layer addAnimation: _animation forKey:@"transition"];
            
            elephant.hidden = !elephant.hidden;
            break;
        }
        default:
            break;
    }

}
- (IBAction)reset:(id)sender 
{
    elephant.layer.shadowColor = [UIColor greenColor].CGColor;
    elephant.layer.shouldRasterize = YES;
    elephant.layer.masksToBounds = NO;
    elephant.layer.shadowOpacity = 1.0;
    elephant.layer.shadowOffset = CGSizeZero;
    elephant.layer.transform = CATransform3DIdentity;
    [elephant.layer removeAllAnimations];
    elephant.hidden = NO;
}
@end
