338.

给定一个非负整数 **num**。对于 **0 ≤ i ≤ num** 范围中的每个数字 **i** ，计算其二进制数中的 1 的数目并将它们作为数组返回。

int* countBits(int num, int* returnSize){

   *returnSize =num+1;

  int numone=0;

  int *array1 = (int *)malloc(sizeof(int) *(num+1));

  int numdiv=num;

  for(int i=0;i<=num;i++)

  {

​    numone=0;

​    numdiv=i;

​    while(numdiv)

​    {

​      if(numdiv%2==1)

​      {

​        numone++;

​      }

​      numdiv= numdiv/2;

​    }

​    array1[i]=numone;

​    

  }

  return array1;

}

50。实现 [pow(*x*, *n*)](https://www.cplusplus.com/reference/valarray/pow/) ，即计算 x 的 n 次幂函数。

double myPow(double x, int n){

 double r=1,base=x,a=n;

 while (n!=0)

 {

  if(n%2) r*=base;

  base*=base;

  n/=2;

 }

if (a>0)

{

  return r;

}

else

{

  return 1/r;

}

}

LCP3.

力扣团队买了一个可编程机器人，机器人初始位置在原点(0, 0)。小伙伴事先给机器人输入一串指令command，机器人就会无限循环这条指令的步骤进行移动。指令有两种：

U: 向y轴正方向移动一格
R: 向x轴正方向移动一格。
不幸的是，在 xy 平面上还有一些障碍物，他们的坐标用obstacles表示。机器人一旦碰到障碍物就会被损毁。

给定终点坐标(x, y)，返回机器人能否完好地到达终点。如果能，返回true；否则返回false。

 

。



bool IsOK(int *data, int len, int** obstacles, int obstaclesSize, int x, int y) 

{

  if (len == 0) {

​    if (x != 0) {

​      return false;

​    }

​    for (int i = 0; i < obstaclesSize; i++) {

​      if (obstacles[i][0] == 0 && obstacles[i][1] < y) {

​        return false;

​      }

​    }

  } else {

​    int cycCount = x / len;

​    int offset = x % len;

​    int start = 0;

​    if (offset != 0) {

​      start = data[offset - 1];

​    }

​    if (y < (cycCount * data[len] + start) || y > (cycCount * data[len] + data[offset])) {

​      return false;

​    }

​    for (int i = 0; i < obstaclesSize; i++) {

​      if (!(obstacles[i][0] <= x && obstacles[i][1] <= y)) {

​        continue;

​      }

​      cycCount = obstacles[i][0] / len;

​      offset = obstacles[i][0] % len;

​      start = 0;

​      if (offset != 0) {

​        start = data[offset - 1];

​      }

​      if (obstacles[i][1] >= (cycCount * data[len] + start) && obstacles[i][1] <= (cycCount * data[len] + data[offset])) {

​        return false;

​      }

​    }

  }

  return true;

}



bool robot(char * command, int** obstacles, int obstaclesSize, int* obstaclesColSize, int x, int y){

  int len = strlen(command);

  int *tempData = (int*)malloc((len + 1) * sizeof(int)); 

  if (tempData == NULL) {

​    return false;

  }

  memset(tempData, 0, (len + 1) * sizeof(int));

  int currentX = 0;

  for (int i = 0; i < len; i++) {

​    if (command[i] == 'U') {

​      tempData[currentX]++;

​    } else if (command[i] == 'R') {

​      tempData[currentX + 1] = tempData[currentX];

​      currentX++;

​    }

  }

  bool result = IsOK(tempData, currentX, obstacles, obstaclesSize, x, y);

  return result;

}