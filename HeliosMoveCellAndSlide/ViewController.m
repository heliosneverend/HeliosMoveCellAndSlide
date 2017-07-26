//
//  ViewController.m
//  HeliosMoveCellAndSlide
//
//  Created by beyo-zhaoyf on 2017/7/26.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "ViewController.h"
#import "HeliosTableViewCell.h"
#define Cell_Place @"Cell_Place"
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SHADOWCOLOR  [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HeliosSwipeTableViewCellDelegate>
{
    UITableView *_aTableView;
    NSMutableArray *_dataSource;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"move cell";
    [self setDataSource];
    [self makeUI];
    
}
- (void)setDataSource {
    _dataSource = [[NSMutableArray alloc]init];
    NSArray *array = @[@"Helios",@"Flora",@"Muses",@"Pan",@"Titan",@"Eros",@"Hygeia",@"Morpheus"];
    _dataSource = [NSMutableArray arrayWithArray:array];
    [_aTableView reloadData];
}
- (void)makeUI {
    _aTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT) style:UITableViewStylePlain];
    _aTableView.backgroundColor = [UIColor lightGrayColor];
    _aTableView.delegate = self;
    _aTableView.dataSource = self;
    [self.view addSubview:_aTableView];
     [_aTableView registerClass:[HeliosTableViewCell class] forCellReuseIdentifier:Cell_Place];
    UILabel *footerView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    footerView.text = @"From Helios:a coder!";
    footerView.textAlignment = NSTextAlignmentCenter;
    footerView.font = [UIFont systemFontOfSize:20.0];
    _aTableView.tableFooterView = footerView;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognized:)];
    [_aTableView addGestureRecognizer:longPress];

}
- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HeliosTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Cell_Place forIndexPath:indexPath];
    cell.delegate = self;
    cell.swipeViewAnimatedStyle = HeliosSwipeViewAnimatedStyleDefault;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = _dataSource[indexPath.row];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (UITableViewCellEditingStyle )tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    //可编辑删除
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_dataSource removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (NSArray<HeliosCellSwipeButton *> *)tableView:(UITableView *)tableView leftSwipeButtonsAtIndexPath:(NSIndexPath *)indexPath {
    HeliosCellSwipeButton *leftBtn = [[HeliosCellSwipeButton alloc] initWithTitle:@"左键1" image:nil even:^(UIButton *swipeButton) {
        NSLog(@"点击了检查1: --- %ld", indexPath.row);

    }];
    HeliosCellSwipeButton *leftBtn1 = [[HeliosCellSwipeButton alloc] initWithTitle:@"左键2" image:nil even:^(UIButton *swipeButton) {
        NSLog(@"点击了测试2: --- %ld", indexPath.row);
       
    }];
    
    HeliosCellSwipeButton *leftBtn2 = [[HeliosCellSwipeButton alloc] initWithTitle:@"左键3" image:nil even:^(UIButton *swipeButton) {
        NSLog(@"点击了检查3: --- %ld", indexPath.row);
    
    }];
    HeliosCellSwipeButton *leftBtn3 = [[HeliosCellSwipeButton alloc] initWithTitle:@"左键4" image:nil even:^(UIButton *swipeButton) {
        NSLog(@"点击了测试: --- %ld", indexPath.row);
    
    }];
    
    return @[leftBtn,leftBtn1, leftBtn2,leftBtn3];
}

- (NSArray<HeliosCellSwipeButton *> *)tableView:(UITableView *)tableView rightSwipeButtonsAtIndexPath:(NSIndexPath *)indexPath {
    HeliosCellSwipeButton *leftBtn = [[HeliosCellSwipeButton alloc] initWithTitle:@"右键1" image:nil even:^(UIButton *swipeButton) {
        NSLog(@"点击了右键1: --- %ld", indexPath.row);
        
    }];
    HeliosCellSwipeButton *leftBtn1 = [[HeliosCellSwipeButton alloc] initWithTitle:@"右键2" image:nil even:^(UIButton *swipeButton) {
        NSLog(@"点击了右键2: --- %ld", indexPath.row);
        
    }];
    
    HeliosCellSwipeButton *leftBtn2 = [[HeliosCellSwipeButton alloc] initWithTitle:@"右键3" image:nil even:^(UIButton *swipeButton) {
        NSLog(@"点击了右键3: --- %ld", indexPath.row);
        
    }];
    HeliosCellSwipeButton *leftBtn3 = [[HeliosCellSwipeButton alloc] initWithTitle:@"右键4" image:nil even:^(UIButton *swipeButton) {
        NSLog(@"点击了右键: --- %ld", indexPath.row);
        
    }];
    
    return @[leftBtn,leftBtn1, leftBtn2,leftBtn3];
}

- (void )longPressGestureRecognized:(id)sender {
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    //获取手势的状态
    UIGestureRecognizerState state = longPress.state;
    //手指在tableView的点 用点获取cell的indexPath
    CGPoint currentPoint = [longPress locationInView:_aTableView];
    NSIndexPath *indexPath = [_aTableView indexPathForRowAtPoint:currentPoint];
    //temp view and indexPath
    static UIView *moveCell;
    static NSIndexPath *tempIndexPath;
    
    switch (state) {
        case UIGestureRecognizerStateBegan:
        {
            if(indexPath){
                //判别是不是在cell上
                //获取要移动的cell的 indexpath
                tempIndexPath = indexPath;
                UITableViewCell *cell = [_aTableView cellForRowAtIndexPath:indexPath];
                moveCell = [self outViewFromView:cell];
                __block CGPoint center = cell.center;
                moveCell.center = center;
                [_aTableView addSubview:moveCell];
                
                //动画
                [UIView animateWithDuration:0.3 animations:^{
                    center.y = currentPoint.y;
                    moveCell.center = center;
                    moveCell.transform = CGAffineTransformMakeScale(1.05, 1.05);
                    moveCell.alpha = 0.98;
                    cell.alpha = 0.0;
                    cell.hidden = YES;
                }];
            }
             break;
        }
           
         case UIGestureRecognizerStateChanged:
        {
            //将手指点的位置 赋值在movecell
            CGPoint center = moveCell.center;
            center.y = currentPoint.y;
            moveCell.center = center;
            //交换数据源和cell
            if(indexPath && ![indexPath isEqual:tempIndexPath]){
                [_dataSource exchangeObjectAtIndex:indexPath.row withObjectAtIndex:tempIndexPath.row];
                [_aTableView moveRowAtIndexPath:tempIndexPath toIndexPath:indexPath];
                tempIndexPath = indexPath;
            }
            break;
        }
        default:
        {
            //清除
            UITableViewCell *cell = [_aTableView cellForRowAtIndexPath:tempIndexPath];
            cell.alpha = 0.0;
            [UIView animateWithDuration:0.25 animations:^{
                moveCell.center = cell.center;
                //还原成原来cell的大小
                moveCell.transform = CGAffineTransformIdentity;
                moveCell.alpha = 0.0;
                cell.alpha = 1.0;
                
            } completion:^(BOOL finished) {
                cell.hidden = NO;
                tempIndexPath = nil;
                [moveCell removeFromSuperview];
                moveCell = nil;
            }];
            break;
        }
            
    }
}
- (UIView *)outViewFromView:(UIView *)inputView {
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
    //截屏 截取inputView的
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    //从上下文获取新图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
     //关闭上下文
    UIGraphicsEndImageContext();
    //对return的view进行需求修改
    UIView *outView = [[UIImageView alloc]initWithImage:image];
    outView.backgroundColor = [UIColor redColor];
    //避免离屏渲染
    outView.layer.masksToBounds = NO;
    outView.layer.cornerRadius = 0.0;
    outView.layer.shadowOffset = CGSizeMake(-6.0, 0.0);
    outView.layer.shadowRadius = 6.0;
    outView.layer.shadowOpacity = 0.8;
    return outView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
