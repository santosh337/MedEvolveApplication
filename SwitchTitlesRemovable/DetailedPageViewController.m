//
//  DetailedPageViewController.m
//  SwitchTitlesRemovable
//
//  Created by pressmartmac on 4/14/16.
//  Copyright © 2016 pressmartmac. All rights reserved.
//

#import "DetailedPageViewController.h"
#import "DetailedCell.h"

#define iPhone5 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)
#define iPhone6 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6Plus ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 736)

@interface DetailedPageViewController ()
{
    NSMutableArray * switchArray;
    NSMutableArray * shortlistedArray;
    NSMutableArray *selectedTableData;
    UIButton * btn;
}

@end

@implementation DetailedPageViewController
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listViewTV.delegate = self;
    self.listViewTV.dataSource = self;
    
    switchArray = [[NSMutableArray alloc]init];
    shortlistedArray = [[NSMutableArray alloc]init];
    selectedTableData = [[NSMutableArray alloc]init];
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"valueKeyOne"]!= nil)
        
    {
        selectedTableData = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"valueKeyOne"] mutableCopy];
    }
    
    else
    {
        selectedTableData = [[NSMutableArray alloc] initWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1", nil];
    }
    
    
    // Do any additional setup after loading the view from its nib.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GenericCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

    }
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (iPhone5) {
        btn.frame = CGRectMake(self.view.bounds.size.width-80, 10, 50, 35);
    }
    else if (iPhone6)
    {
        btn.frame = CGRectMake(self.view.bounds.size.width-80, 14, 53, 37);
        
    }
    else if (iPhone6Plus){
        btn.frame = CGRectMake(self.view.bounds.size.width-80, 18, 55, 40);
        
    }
    else{
        
        btn.frame = CGRectMake(self.view.bounds.size.width-80, 18, 50, 35);
    }
    
    
    [btn setImage:[UIImage imageNamed:@"onimage"] forState:UIControlStateNormal];
    btn.tag = indexPath.row;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:btn];
    
    if ([[selectedTableData objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
        
        [btn setImage:[UIImage imageNamed:@"offImage"] forState:UIControlStateNormal];
    }
    
    cell.textLabel.text = self.detailedListArrays[indexPath.row];
    return cell;
}

-(void)btnAction:(id)sender
{
    if ([[selectedTableData objectAtIndex:[sender tag]] isEqualToString:@"0"]) {
        
        [selectedTableData replaceObjectAtIndex:[sender tag] withObject:@"1"];
    }
    else{
        
        [selectedTableData replaceObjectAtIndex:[sender tag] withObject:@"0"];
        NSString * valuePassedString = [self.detailedListArrays objectAtIndex:[sender tag]];
        [shortlistedArray addObject:valuePassedString];
    }
 
    [self.listViewTV reloadData];
    
    [[NSUserDefaults standardUserDefaults]setObject:selectedTableData forKey:@"valueKeyOne"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.detailedListArrays.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [delegate recieveData:shortlistedArray];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

