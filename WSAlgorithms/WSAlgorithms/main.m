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

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        printf("Hello world");
        
        int i;
        //
        scanf("%d",&n);
        
        for ( i = 0; i < n; i ++) {
            scanf("%d", &a[i]);
        }
        
        quicksorts(1, n);
        
        for (int i = 0; i < n; i ++) {
            printf("%d", a[i]);
        }

    }
    
    
    return 0;
}
