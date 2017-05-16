//
//  SKALogHeader.h
//  SKALogTest
//
//  Created by JZZ on 16/7/1.
//  Copyright © 2016年 哥瑞. All rights reserved.
//

#define SKALog(fmt, ...) NSLog((@"\n<========== INFO START ==========>\n ---------- METHOD:LINE ---------\n%s:[line:%d]\n ------------- LOGS -------------\n" fmt "\n<=========== INFO END ===========>"), __FUNCTION__, __LINE__, ##__VA_ARGS__)
