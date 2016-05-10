//
//  DetailedPageViewController.h
//  SwitchTitlesRemovable
//
//  Created by pressmartmac on 4/14/16.
//  Copyright © 2016 pressmartmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailedPageViewControllerDelegate <NSObject>

- (void)recieveData:(NSMutableArray *)theData;

@end

@interface DetailedPageViewController : UIViewController<UITableViewDelegate ,UITableViewDataSource>


@property (nonatomic,strong) IBOutlet UITableView * listViewTV;
@property (nonatomic,strong) NSArray * detailedListArrays;
@property (nonatomic,strong) NSMutableArray * switchOffArrays;
@property(nonatomic,assign) id delegate;


@end
