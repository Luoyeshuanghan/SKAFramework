//
//  SKATableViewH.m
//  啾啾健康版
//
//  Created by JZZ on 2017/1/23.
//  Copyright © 2017年 哥瑞. All rights reserved.
//

#import "SKATableViewH.h"

@implementation SKATableViewH
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SKATableViewModel * cell_object = self.array[indexPath.row];
    return cell_object.cell_height;
}
@end
