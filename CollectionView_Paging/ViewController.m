//
//  ViewController.m
//  CollectionView_Paging
//
//  Created by Sandip on 5/1/16.
//  Copyright © 2016 Sandip. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *collectionViewTitleArr;
}
@end

@implementation ViewController

@synthesize myCollectionView;
@synthesize pageCtrl;
static NSString *cellID = @"myCell";
#pragma mark - View Controller Method
- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    collectionViewTitleArr = [NSArray arrayWithObjects:@"Easy",@"Medium",@"Hard", nil];
    [self.myCollectionView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView Method


// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger count = collectionViewTitleArr.count;
    pageCtrl.numberOfPages = count;
    return count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;

    if (kind == UICollectionElementKindSectionHeader) {
        UIView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [collectionViewTitleArr objectAtIndex:indexPath.section];
        UILabel *titleLbl =  [headerView viewWithTag:5];
       titleLbl.text = title;

        reusableview = headerView;
    }
    return reusableview;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    UILabel *lbl = [cell viewWithTag:10];
    lbl.text = [NSString stringWithFormat:@"%ld",(indexPath.section*10)+indexPath.row+1];
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index=   scrollView.contentOffset.x / scrollView.frame.size.width;
    pageCtrl.currentPage = index;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.frame.size.width/2.0f,ceilf(collectionView.frame.size.height/6.0f) );
}
@end
