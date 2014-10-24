//
//  CustomEventCollectionViewCell.h
//  We Build SG
//
//  Created by Behera, Subhransu on 10/24/14.
//  Copyright (c) 2014 Behera, Subhransu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomEventCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *organizerLabel;

@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end
