//
//  CoverFlowLayout.m
//  W3D4---Cover Flow
//
//  Created by Dylan McCrindle on 2016-11-17.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout

-(void)prepareLayout{
	[super prepareLayout];
	self.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
	self.itemSize =  CGSizeMake(300, 200);
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
	return YES;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
	NSArray* attributes = [super layoutAttributesForElementsInRect:rect];
	CGRect visibleRegion;
	visibleRegion.origin = self.collectionView.contentOffset;
	visibleRegion.size   = self.collectionView.bounds.size;
	
	
	
	
	//CGRect cellFrameInSuperview = [cv convertRect:cellRect toView:[cv superview]];
	
	//NSLog(@"%f",cellFrameInSuperview.origin.x);
	
	for (UICollectionViewLayoutAttributes *cellAttributes in attributes) {
		//cellAttributes.transform3D = CATransform3DMakeScale(0.5, 0.5, 0.5);
		CGFloat cellRect = CGRectGetMidX(cellAttributes.frame);
		
		CGFloat centerPoint = cellAttributes.center.x - visibleRegion.origin.x;

		cellAttributes.alpha = 1.0 - fabs(visibleRegion.size.width/2.0 - centerPoint)/(visibleRegion.size.width/2.0);
	}
	return attributes;
}

@end
