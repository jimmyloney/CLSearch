//
//  TableViewController.m
//  UISearchBar
//
//  Created by 梅恩豪 on 16/3/18.
//  Copyright © 2016年 zuanshishang. All rights reserved.
//

#import "TableViewController.h"
#import "ResultTableViewController.h"

@interface TableViewController ()<UISearchResultsUpdating,UISearchControllerDelegate>

@property (strong,nonatomic) NSMutableArray  *dataList;


@property (nonatomic, strong) UISearchController *searchC;



@property (nonatomic, strong) ResultTableViewController *resultTableView;


@end

@implementation TableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultTableView = [[ResultTableViewController alloc] init];
    self.resultTableView.view.backgroundColor = [UIColor redColor];
    
    
    
    self.searchC = [[UISearchController alloc] initWithSearchResultsController:self.resultTableView];
    
    
    
    self.searchC.searchBar.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    self.tableView.tableHeaderView = self.searchC.searchBar;
    self.searchC.searchBar.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    self.searchC.delegate = self;
    self.searchC.searchResultsUpdater = self;
    self.dataList=[NSMutableArray arrayWithCapacity:100];
    
    for (NSInteger i=0; i<100; i++) {
        [self.dataList addObject:[NSString stringWithFormat:@"%ld-FlyElephant",(long)i]];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }


    cell.textLabel.text = self.dataList[indexPath.row];
    
    return cell;
}




- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{

    
//    // 谓词的包含语法,之前文章介绍过http://www.cnblogs.com/xiaofeixiang/
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", self.searchC.searchBar.text];

//    //过滤数据
    NSArray *relustArray = [NSMutableArray arrayWithArray:[_dataList filteredArrayUsingPredicate:preicate]];

    NSLog(@"%@",relustArray);
    
    

    self.resultTableView.searchList = relustArray;
    
    [self.resultTableView.tableView reloadData];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
