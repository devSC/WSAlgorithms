//
//  main.m
//  WSAlgorithms
//
//  Created by Wilson-Yuan on 15/8/30.
//  Copyright (c) 2015年 wilson-yuan. All rights reserved.
//
#include <stdio.h>

int a[101], n; //
//快速排序
void quicksorts(int left, int right) {
//    printf("%d %d", left, right);
    
    int i, j, t, temp;
    
    if (left > right) {
        return;
    }
    
    temp = a[left]; //temp中存的就是基数
    i = left;
    j = right;
    while (i != j) {
        
        //顺序很重要, 先从右向左
        while (a[j] >= temp && i < j) {
            j--;
        }
        
        while (a[i]<= temp && i < j) {
            i++;
        }
        
        //交换两个数在数组中的位置
        
        if (i < j) { //当哨兵i和哨兵j没有相遇时,
            
            t = a[i];
            a[i] = a[j];
            
            a[j] = t;
            
        }
        printf("a[%d]: %d a[%d]: %d", i, a[i], j, a[j]);
    }
    
    //最终,将基数归位
    a[left] = a[i];
    a[i] = temp;
    
    quicksorts(left, i - 1); //继续处理左边 这是递归过程
    quicksorts(i + 1, right);//继续处理右边 这是递归过程
    
    return;
}



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


int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        printf("Hello world");
        
        int i;
        //
        scanf("%d",&n);
        
        for ( i = 1; i <= n; i ++) {
            scanf("%d", &a[i]);
        }
        
        quicksorts(1, n);
//        sort(a, 1, 6);
        
        for (int i = 1; i <= n; i ++) {
            printf("%d", a[i]);
        }

    }
    
    
    return 0;
}
