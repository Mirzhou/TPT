//
//  alertSetFreeCell.m
//  tpt
//
//  Created by apple on 16/8/11.
//  Copyright © 2016年 MDJ. All rights reserved.
//

#import "alertSetFreeCell.h"

@interface alertSetFreeCell()<CustomSwitchDelegate>

@end

@implementation alertSetFreeCell

- (void)awakeFromNib {
    // Initialization code
    self.bgImgView.image = [[UIImage imageNamed:@"tui_cell_bg"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    self.titleLable.textColor = [UIColor orangeColor];
    self.titleOneLable.textColor = MainContentColor;
    self.titleTwoLable.textColor = MainContentColor;

    self.shengSwitchBtn.delegate = self;
    self.shengSwitchBtn.arrange = CustomSwitchArrangeONLeftOFFRight;
    self.shengSwitchBtn.onImage = [UIImage imageNamed:@"switchOne_on"];
    self.shengSwitchBtn.offImage = [UIImage imageNamed:@"switchOne_off"];
    self.shengSwitchBtn.status = UserModel.max_notify_voice;

    self.dongSwitchBtn.delegate = self;
    self.dongSwitchBtn.arrange = CustomSwitchArrangeONLeftOFFRight;
    self.dongSwitchBtn.onImage = [UIImage imageNamed:@"switchOne_on"];
    self.dongSwitchBtn.offImage = [UIImage imageNamed:@"switchOne_off"];
    self.dongSwitchBtn.status = UserModel.max_notify_vibration;

    self.lineView.backgroundColor = MainTitleColor;
    self.lineTwoView.backgroundColor = MainTitleColor;

    self.titleLable.text = NSLocalizedString(@"max_notify", @"");
    self.titleOneLable.text = NSLocalizedString(@"max_notify_voice", @"");
    self.titleTwoLable.text = NSLocalizedString(@"max_notify_vibration", @"");
}

+ (instancetype)thealertSetFreeCellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexpath{
    static NSString *ID = @"alerfreeCell";
    alertSetFreeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = (alertSetFreeCell*)[[NSBundle mainBundle]loadNibNamed:@"alertSetFreeCell" owner:nil options:nil][0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)customSwitchView:(CustomSwitch *)switchViwe SetStatus:(CustomSwitchStatus)status{

    if (self.shengSwitchBtn ==switchViwe) {
        UserModel.max_notify_voice = status;
    }else{
        UserModel.max_notify_vibration = status;
    }

    NSLog(@"ss = %d,dd = %d",UserModel.max_notify_voice,UserModel.max_notify_vibration);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
