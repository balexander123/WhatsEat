//
//  WeeklyMenuViewController.m
//  WhatsApp
//
//  Created by Barry Alexander on 5/31/15.
//  Copyright (c) 2015 Barry Alexander. All rights reserved.
//

#import "WeeklyMenuViewController.h"

#import <AsyncDisplayKit/AsyncDisplayKit.h>


@interface WeeklyMenuViewController () <ASCollectionViewDataSource, ASCollectionViewDelegate>
{
    ASCollectionView *_collectionView;
}
@end

@implementation WeeklyMenuViewController

- (instancetype)init
{
    if (!(self = [super init]))
        return nil;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[ASCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout asyncDataFetching:YES];
    _collectionView.asyncDataSource = self;
    _collectionView.asyncDelegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:_collectionView];
}

- (void)viewWillLayoutSubviews
{
    _collectionView.frame = self.view.bounds;
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

#pragma mark -
#pragma mark ASCollectionView data source.

- (ASCellNode *)collectionView:(ASCollectionView *)collectionView nodeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [NSString stringWithFormat:@"[%zd.%zd] says hi", indexPath.section, indexPath.item];
    ASTextCellNode *node = [[ASTextCellNode alloc] init];
    node.text = text;
    node.backgroundColor = [UIColor lightGrayColor];
    
    return node;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 14;
}

- (void)collectionViewLockDataSource:(ASCollectionView *)collectionView
{
    // lock the data source
    // The data source should not be change until it is unlocked.
}

- (void)collectionViewUnlockDataSource:(ASCollectionView *)collectionView
{
    // unlock the data source to enable data source updating.
}

- (void)collectionView:(UICollectionView *)collectionView willBeginBatchFetchWithContext:(ASBatchContext *)context
{
    NSLog(@"fetch additional content");
    [context completeBatchFetching:YES];
}

@end
