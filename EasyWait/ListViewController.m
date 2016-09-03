//
//  ListViewController.m
//  EasyWait
//
//  Created by Ruchin on 03/09/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma table view data source methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = (ListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"listCell"];
    cell.listImage.layer.cornerRadius = 35.0;
    cell.listImage.clipsToBounds = YES;
    cell.listImage.image = [UIImage imageNamed:@"icon_trans"];
    cell.listNameLabel.text = [NSString stringWithFormat:@"Doctor %ld",(long)indexPath.row];
    cell.listAddressLabel.text = @"hgjkla fds g gdf  fgd gw wdfg wfgd gfw wg wg wdfg wfg wdfg wfg wdfg";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *details = [storyboard instantiateViewControllerWithIdentifier:@"details"];
    details.name = @"easy wait";
    details.timing = @"10:00 am to 6:00 pm";
    details.address = @"hgjkla fds g gdf  fgd gw wdfg wfgd gfw wg wg wdfg wfg wdfg wfg wdfg";
    [self.navigationController pushViewController:details animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


@end
