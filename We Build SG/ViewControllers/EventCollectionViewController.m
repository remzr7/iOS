//
//  EventCollectionViewController.m
//  We Build SG
//
//  Created by Behera, Subhransu on 10/24/14.
//  Copyright (c) 2014 Behera, Subhransu. All rights reserved.
//

#import "EventCollectionViewController.h"
#import "CustomEventCollectionViewCell.h"

@interface EventCollectionViewController ()

@end

@implementation EventCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCustomTitleToNavBar:@"Open Events"];
}

- (void)addCustomTitleToNavBar:(NSString *)customTitle {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 3, 200, 40)];
    titleLabel.font = [UIFont fontWithName:@"RobotoSlab-Bold" size:14.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithRed:(191.0/255.0) green:(21.0/255.0) blue:(33.0/255.0) alpha:1.0];
    titleLabel.text = customTitle;
    
    self.navigationItem.titleView = titleLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomEventCollectionViewCell *cell = (CustomEventCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CustomEventCells" forIndexPath:indexPath];
    
    cell.eventTitleLabel.font = [UIFont fontWithName:@"RobotoSlab-Regular" size:16.0];
    cell.eventTitleLabel.textColor = [UIColor colorWithRed:(222.0/255.0) green:(98.0/255.0) blue:(78.0/255.0) alpha:1.0];
    [cell.eventTitleLabel sizeToFit];
    
    cell.organizerLabel.font = [UIFont fontWithName:@"RobotoSlab-Regular" size:14.0];
    [cell.organizerLabel sizeToFit];

    cell.dateLabel.font = [UIFont fontWithName:@"RobotoSlab-Bold" size:14.0];
    cell.dayLabel.font = [UIFont fontWithName:@"RobotoSlab-Bold" size:14.0];

    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomEventCollectionViewCell *customCell = (CustomEventCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    float dynamicWidth = self.view.frame.size.width - (customCell.frame.origin.x * 2);
    
    return CGSizeMake(dynamicWidth, 170);
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
