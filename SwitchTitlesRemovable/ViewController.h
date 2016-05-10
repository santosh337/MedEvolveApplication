//
//  ViewController.h
//  SwitchTitlesRemovable
//
//  Created by pressmartmac on 4/14/16.
//  Copyright © 2016 pressmartmac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailedPageViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate , DetailedPageViewControllerDelegate>

@property (nonatomic,strong) NSMutableArray * tableValuesArray;

@property (nonatomic,strong) IBOutlet UITableView * dataDisplayTV;





@end

