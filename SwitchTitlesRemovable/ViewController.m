#import "ViewController.h"
#import "DetailedPageViewController.h"

@interface ViewController ()
{
    NSMutableArray * passedData;
    NSArray * temporaryArray;
    NSMutableArray *removeIndexesArray;
    NSMutableArray *tArray;
}
@property (retain) NSIndexPath* selectedIndexPath;

@end

@implementation ViewController
@synthesize tableValuesArray;
@synthesize selectedIndexPath;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
   
     temporaryArray = [[NSArray alloc]initWithObjects:@"Patients",@"Incharge",@"In patient",@"Out Patient",@"service charges",@"Maintainance",@"Hospitality",@"Skin Burn treatment",@"lost Health",@"Fysician",@"Candidates", nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"Cell1";
    static NSString *CellIdentifier2 = @"Cell2";
    
    UITableViewCell *cell;
    
    NSIndexPath* indexPathSelected = self.selectedIndexPath;
    
    if ( nil == indexPathSelected || [indexPathSelected compare: indexPath] != NSOrderedSame )
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        }
        cell.textLabel.text = tableValuesArray[indexPath.row];
        cell.imageView.image = nil;
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier2];
        }
        
        cell.textLabel.text = tableValuesArray[indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat: @"%li(expanded!)", indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"GreenBackground"];
    }
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableValuesArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( self.selectedIndexPath != nil && [self.selectedIndexPath compare: indexPath] == NSOrderedSame )
    {
        return 200;
    }
    
    return 90;
}

- (void)recieveData:(NSMutableArray *)theData {
    
    passedData = theData;
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    self.dataDisplayTV.delegate = self;
    self.dataDisplayTV.dataSource = self;

    tArray = [temporaryArray mutableCopy];
    removeIndexesArray = [[NSMutableArray alloc] init];
    NSArray *tempArr = [[NSUserDefaults standardUserDefaults] objectForKey:@"valueKeyOne"];
    if (tempArr > 0) {
        for (int i = 0; i < tempArr.count ; i++) {
            if ([[tempArr objectAtIndex:i] isEqualToString:@"0"]) {
                [removeIndexesArray addObject:[NSString stringWithFormat:@"%d",i]];
            }
            }
        NSUInteger removeValues = 0;
        NSMutableArray * pArray = [temporaryArray mutableCopy];
        if (removeIndexesArray.count > 0) {
            if(removeIndexesArray.count > 1){
                
                for (int p=0; p<removeIndexesArray.count; p++) {
                    removeValues = [[removeIndexesArray objectAtIndex:p]integerValue];
                    [pArray replaceObjectAtIndex:removeValues withObject:@""];
                }
            }else{
                [tArray removeObjectAtIndex:[[removeIndexesArray objectAtIndex:0]intValue]];
            }
        }
        for (int k=0; k<pArray.count; k++) {
            if ([[pArray objectAtIndex:k]isEqualToString:@""]) {
                [pArray removeObjectAtIndex:k];
            }
        }
        tableValuesArray = pArray;

    }
    else{
        tableValuesArray = tArray;
    }
    NSLog(@"count after reused:%lu",(unsigned long)tableValuesArray.count);
    [self.dataDisplayTV reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedPageViewController * dPVC = [[DetailedPageViewController alloc]init];
    dPVC.detailedListArrays = temporaryArray;
    dPVC.switchOffArrays = tableValuesArray;
    dPVC.delegate = self;
    [self.navigationController pushViewController:dPVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end