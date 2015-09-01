//
//  main.m
//  WSAlgorithms
//
//  Created by Wilson-Yuan on 15/8/30.
//  Copyright (c) 2015年 wilson-yuan. All rights reserved.
//
#include <stdio.h>

int a[101], n; //

void sort(int *a, int left, int right)
{
    if(left >= right)/*如果左边索引大于或者等于右边的索引就代表已经整理完成一个组了*/
    {
        return ;
    }
    int i = left;
    int j = right;
    int key = a[left];
    
    while(i < j)                               /*控制在当组内寻找一遍*/
    {
        while(i < j && key <= a[j])
        /*而寻找结束的条件就是，1，找到一个小于或者大于key的数（大于或小于取决于你想升
         序还是降序）2，没有符合条件1的，并且i与j的大小没有反转*/
        {
            j--;/*向前寻找*/
        }
        
        a[i] = a[j];
        /*找到一个这样的数后就把它赋给前面的被拿走的i的值（如果第一次循环且key是
         a[left]，那么就是给key）*/
        
        while(i < j && key >= a[i])
        /*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
         因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
        {
            i++;
        }
        
        a[j] = a[i];
    }
    
    a[i] = key;/*当在当组内找完一遍以后就把中间数key回归*/
    sort(a, left, i - 1);/*最后用同样的方式对分出来的左边的小组进行同上的做法*/
    sort(a, i + 1, right);/*用同样的方式对分出来的右边的小组进行同上的做法*/
    /*当然最后可能会出现很多分左右，直到每一组的i = j 为止*/
}


///left是左边的_index  right是右边的_index
void ws_quickSorts(int *a, int left, int right)
{
    if (left >= right) { //如果大于或者等于说明已整理完了
        return;
    }
    int i, j, key, temp;
    i = left;
    j = right;
    
    //获取到关键数据Key
    key = a[left];
    
    while (i < j) {
        //先从右向左 找到小余关键数据的index
        while (a[j] >= key && j > i) {//当满足a[j] > key && j > i时一直执行
            j--;
        }
        
        //从又向左, 找到大于关键数据的index
        while (a[i] <= key && i < j) {
            i++;
        }
     
        //交换位置
        if (i < j) {
            temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }

    }
    
    //将关键字放到中间
    temp = a[i];
    a[i] = key;
    a[left] = temp;
    
    //处理左边的数据
    ws_quickSorts(a, left, i - 1);
    //处理右边的数据
    ws_quickSorts(a, j + 1, right);
    
}
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        printf("Hello world");
        
        int i;
        //
        scanf("%d",&n);
        
        for ( i = 0; i <= n; i ++) {
            scanf("%d", &a[i]);
        }
        
        for (int j = 0; j <= n; j ++) {
            printf("  %d", a[j]);
        }

        
        ws_quickSorts(a, 0, i - 1);
//        sort(a, a[1], a[i -1]);
        
        printf("\n");
        for (int i = 0; i <= n; i ++) {
            printf(" %d", a[i]);
        }

    }
    
    
    return 0;
}
