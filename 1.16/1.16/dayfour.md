## 暴力枚举

将问题的所有可能的答案一一列举，然后根据条件判断此答案是否合适，合适就保留，不合适就丢弃（穷举）。维度的选择是解决穷举问题的关键。

## 选择排序

首先在未排序序列中找到最小（大）元素，放在排序序列的起始位置，然后，再从剩余未排序序列元素中继续寻找最小（大）元素，然后放到已排序列的末尾。以此类推，直到所有的元素均排序完毕。

时间复杂度较低

```
 for (int i = 0; i < arr.length- 1; i++) {
        int index = i;
        int j;
        // 找出最小值得元素下标
        for (j = i + 1; j < arr.length; j++) {
            if (arr[j] < arr[index]) {
                index = j;//交换位置（下标）？
            }
        }
        int tmp = arr[index];//交换元素
        arr[index] = arr[i];
        arr[i] = tmp;
        System.out.println(Arrays.toString(arr));
```

## 冒泡排序

原理：
要重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列工作是重复地进行直到没有再需要交换，也就是说该数列已经排列完成。

越小的元素会经由交换慢慢地“浮”到数列的顶端

复杂度:O(n^2)

for(int i=0;i<=a.length-1;i++){

​	for(int j=0;j<=a.length-1-i;j++){

​	if(a[j]>a[j+1]){

​	n =a[j];

​	a[j]=a[j+1];

​	a[j+1] = n;

​	}

​	}

}



## 快速排序

首先设定一个分界值，通过该分界值将数组分成左右两部分。 

将大于或等于分界值的数据集中到数组右边，小于分界值的数据集中到数组的左边。此时，左边部分中各元素都小于或等于分界值，而右边部分中各元素都大于或等于分界值。

然后，左边和右边的数据可以独立排序。对于左侧的数组数据，又可以取一个分界值，将该部分数据分成左右两部分，同样在左边放置较小值，右边放置较大值。右侧的数组数据也可以做类似处理。

重复上述过程，可以看出，这是一个递归定义。通过递归将左侧部分排好序后，再递归排好右侧部分的顺序。当左、右两个部分各数据排序完成后，整个数组的排序也就完成了。

时间复杂度:O(N*logN)


void quick_sort(int s[], int l, int r)
{
if (l < r)
{
//Swap(s[l], s[(l + r) / 2]);
int i = l, j = r, x = s[l];
while (i < j)
{
while(i < j && s[j] >= x) 
j--;  
if(i < j) 
s[i++] = s[j];
while(i < j && s[i] < x)
i++;  
if(i < j) 
s[j--] = s[i];
}
s[i] = x;
quick_sort(s, l, i - 1); // 递归调用 
quick_sort(s, i + 1, r);
}
}

## 贪心算法

将原问题拆分成几个小问题，每一步取得局部最优解.贪心算法不一定能得到整体最优解，但对问题而言它能产生整体最优解或者是整体最优解的近似解。（一种思想）

贪心算法的基本思路是从问题的某一个初始解出发一步一步地进行，根据某个优化测度，每一步都要确保能获得局部最优解。每一步只考虑一个数据，他的选取应该满足局部优化的条件。若下一个数据和部分最优解连在一起不再是可行解时，就不把该数据添加到部分解中，直到把所有数据枚举完，或者不能再添加算法停止

### 0-1背包问题

**⑴贪心策略：选取价值最大者。**

**⑵贪心策略：选取重量最小。**

**⑶贪心策略：选取单位重量价值最大的物品。**



## 递归

在调用一个函数的过程中调用该函数本身。（自己用自己）

注意递归结束条件，避免死循环

**递归的三大要素**

**第一要素：**明确你这个函数想要干什么。

**第二要素：**寻找递归结束条件。

**第三要素：**找出函数的等价关系式。不断缩小参数的范围，缩小之后，我们可以通过一些辅助的变量或者操作，使原函数的结果不变。

### 递归的优化

1**、考虑是否重复计算**

如果你使用递归的时候不进行优化，是有非常非常非常多的子问题被重复计算的。因此，使用递归的时候，必要须要考虑有没有重复计算，如果重复计算了，一定要把计算过的状态保存起来。

**2、考虑尾递归**

顾名思义，尾递归就是从最后开始计算, 每递归一次就算出相应的结果, 也就是说, 函数调用出现在调用者函数的尾部, 因为是尾部, 所以根本没有必要去保存任何局部变量。直接让被调用的函数返回时越过调用者, 返回到调用者的调用者去。

## 深度优先搜索算法

从一个顶点V0开始，沿着一条路一直走到底，如果发现不能到达目标解，那就返回到上一个节点，然后从另一条路开始走到底，尽量往深处走。

其过程简要来说是对每一个可能的分支路径深入到不能再深入为止，而且每个节点只能访问一次。

#### 基本步骤

（1）对于下面的树而言，DFS方法首先从根节点1开始，其搜索节点顺序是1,2,3,4,5,6,7,8（假定左分枝和右分枝中优先选择左分枝）。



![img](https:////upload-images.jianshu.io/upload_images/9406299-2132e6f322d7a697.png?imageMogr2/auto-orient/strip|imageView2/2/w/832/format/webp)



（2）从stack中访问栈顶的点；



![img](https:////upload-images.jianshu.io/upload_images/9406299-7ad5354d4fd91e6d.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)



（3）找出与此点邻接的且尚未遍历的点，进行标记，然后放入stack中，依次进行；



![img](https:////upload-images.jianshu.io/upload_images/9406299-4e7e862e5dfde579.png?imageMogr2/auto-orient/strip|imageView2/2/w/1196/format/webp)



（4）如果此点没有尚未遍历的邻接点，则将此点从stack中弹出，再按照（3）依次进行；



![img](https:////upload-images.jianshu.io/upload_images/9406299-69203b85a58aa38a.png?imageMogr2/auto-orient/strip|imageView2/2/w/1144/format/webp)

![img](https:////upload-images.jianshu.io/upload_images/9406299-30b12efd14ccadf1.png?imageMogr2/auto-orient/strip|imageView2/2/w/1156/format/webp)



（5）直到遍历完整个树，stack里的元素都将弹出，最后栈为空，DFS遍历完成。



![img](https:////upload-images.jianshu.io/upload_images/9406299-37348ce937f6e8fc.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)







![img](https:////upload-images.jianshu.io/upload_images/9406299-f28b668f26362cc1.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)



## 广度优先搜索算法

简称BFS；

 BFS是用于图的查找算法(要求能用图表示出问题的关联性)。它并不考虑结果的可能位置，彻底地搜索整张图，直到找到结果为止。

**基本过程**，BFS是从根节点开始，沿着树(图)的宽度遍历树(图)的节点。如果所有节点均被访问，则算法中止。一般用  **队列数据结构**？来辅助实现BFS算法。

BFS可用于解决2类问题：

从A出发是否存在到达B的路径；
从A出发到达B的最短路径；

其思路为从图上一个节点出发，访问先访问其直接相连的子节点，若子节点不符合，再问其子节点的子节点，按级别顺序依次访问，直到访问到目标节点。

  属于一种盲目搜寻法，目的是系统地展开并检查图中的所有节点，以找寻结果。换句话说，它并不考虑结果的可能位置，彻底地搜索整张图，直到找到结果为止。

#### 基本步骤

（1）给出一连通图，如图，初始化全是白色（未访问）；



![9406299-b9b6b11d626b9d0f](C:\Users\1\Desktop\1.16\图片\9406299-b9b6b11d626b9d0f.webp)

（2）搜索起点V1（灰色）；



![img](https:////upload-images.jianshu.io/upload_images/9406299-39149296eaeb1de3.png?imageMogr2/auto-orient/strip|imageView2/2/w/1094/format/webp)



（3）已搜索V1（黑色），即将搜索V2，V3，V4（标灰）；



![img](https:////upload-images.jianshu.io/upload_images/9406299-d8ca98462334da9b.png?imageMogr2/auto-orient/strip|imageView2/2/w/1082/format/webp)



（4）对V2，V3，V4重复以上操作；



![img](https:////upload-images.jianshu.io/upload_images/9406299-21acbb076ed916c2.png?imageMogr2/auto-orient/strip|imageView2/2/w/1112/format/webp)



（5）直到终点V7被染灰，终止；



![img](https:////upload-images.jianshu.io/upload_images/9406299-f6aaa6a77c341d20.png?imageMogr2/auto-orient/strip|imageView2/2/w/1112/format/webp)



（6）最短路径为V1，V4，V7.





python爬虫

模拟用户行为

拷贝浏览器访问时的客户端代码，头文件，cookie

设置请求时间

cookie保持登录状态

lxml库网页解析文档

使用xpath获取信息



