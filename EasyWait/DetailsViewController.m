//
//  DetailsViewController.m
//  EasyWait
//
//  Created by Ruchin on 03/09/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int imageCount = 4;
    
    CGFloat scrollHeight = 250;//(self.view.frame.size.height - 64)/3;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * imageCount,scrollHeight);
    self.pageControl.numberOfPages = imageCount;
    for (int i=0; i<imageCount; i++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, scrollHeight)];
        img.contentMode = UIViewContentModeScaleAspectFit;
        if (i%2 == 0) {
            img.backgroundColor = [UIColor redColor];
        } else {
            img.backgroundColor = [UIColor greenColor];
        }
        //[img sd_setImageWithURL:[NSURL URLWithString:picUrl[i]] placeholderImage:[UIImage imageNamed:@"add_user"]];
        [self.scrollView addSubview:img];
    }
    [self.pageControl bringSubviewToFront:self.scrollView];
    
    self.nameLabel.text = self.name;
    self.timingLabel.text = self.timing;
    self.addressLabel.text = self.address;
    self.imageView.layer.cornerRadius = 35.0;
    self.imageView.clipsToBounds = YES;
    self.imageView.image = [UIImage imageNamed:@"icon_trans"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    CGFloat currentPage = floor(((self.scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1);
    self.pageControl.currentPage = currentPage;
}
- (IBAction)bookButtonPressed:(id)sender {
    [self.view makeToast:@"You have booked ur turn !!!" duration:2.0 position:CSToastPositionCenter];
}


@end
