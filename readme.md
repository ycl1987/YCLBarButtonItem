效果如下:

![image](https://upload-images.jianshu.io/upload_images/1996081-ca2b0fb8c651f926.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image](https://upload-images.jianshu.io/upload_images/1996081-cd25d083f8bca36b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

设置思路:
1.UINavigationBar代码

    if (iOS11_Later) {
        
        self.layoutMargins = UIEdgeInsetsZero;
        
        for (UIView *subview in self.subviews) {
            
            if ([NSStringFromClass(subview.class) containsString:@"ContentView"]) {
                subview.layoutMargins = UIEdgeInsetsZero;//可修正iOS11之后的偏移
            }
        }
    }

2.UINavigationItem代码


        
        if ([item.customView isKindOfClass:[UIButton class]]){
            
            UIButton *leftBtn = item.customView;
            if (!item.fixedState) {
                
                UIEdgeInsets earlyEdge = leftBtn.contentEdgeInsets;
                earlyEdge.left += 15;
                leftBtn.width += 15;
                leftBtn.contentEdgeInsets = earlyEdge;
                item.fixedState = @"setted";
            }
            
        }else{
            
            UIBarButtonItem *fixBtn = [self fixedSpaceWithWidth:15];
            [self JR_setLeftBarButtonItems:@[fixBtn,item]];
            return;
        }
    


    
