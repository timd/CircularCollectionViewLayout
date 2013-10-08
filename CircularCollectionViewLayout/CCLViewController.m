//
//  CCLViewController.m
//  CircularCollectionViewLayout
//
//  Created by Tim on 08/10/2013.
//  Copyright (c) 2013 Charismatic Megafauna Ltd. All rights reserved.
//

#import "CCLViewController.h"

@interface CCLViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@end

static NSString *const reuseIdentifier = @"CollectionViewCell";
static const float kCellWidth = 100.0f;
static const float kCellHeight = 100.0f;

@implementation CCLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupData];
    [self configureCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Setup & configuration

-(void)setupData {
 
    self.dataArray = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
    
}

-(void)configureCollectionView {
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CCLCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(kCellWidth, kCellHeight)];
    [flowLayout setMinimumInteritemSpacing:10.0f];
    [flowLayout setMinimumLineSpacing:10.0f];
    [self.collectionView setCollectionViewLayout:flowLayout];
    
}

#pragma mark -
#pragma mark UICollectionView methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:1000];
    [cellLabel setText:[self.dataArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}

@end
