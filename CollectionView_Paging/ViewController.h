//
//  ViewController.h
//  CollectionView_Paging
//
//  Created by Sandip on 5/1/16.
//  Copyright © 2016 Sandip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageCtrl;

@end

