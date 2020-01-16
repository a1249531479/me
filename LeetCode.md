#### [26. 删除排序数组中的重复项](https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/)

给定一个排序数组，你需要在**原地**删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。

class Solution:

​    def removeDuplicates(self, nums: List[int]) -> int:

​        if not nums:

​            return  

​        for i in range(len(nums)-1,0,-1):

​            if nums[i]==nums[i-1]:

​                nums.pop(i)

​                i-=1

​        return len(nums)



#### [1030. 距离顺序排列矩阵单元格](https://leetcode-cn.com/problems/matrix-cells-in-distance-order/)

给出 R 行 C 列的矩阵，其中的单元格的整数坐标为 (r, c)，满足 0 <= r < R 且 0 <= c < C。

另外，我们在该矩阵中给出了一个坐标为 (r0, c0) 的单元格。

返回矩阵中的所有单元格的坐标，并按到 (r0, c0) 的距离从最小到最大的顺序排，其中，两单元格(r1, c1) 和 (r2, c2) 之间的距离是曼哈顿距离，|r1 - r2| + |c1 - c2|。（你可以按任何满足此条件的顺序返回答案。）

class Solution:

​    def allCellsDistOrder(self, R: int, C: int, r0: int, c0: int) -> List[List[int]]:

​        a=[]

​        for i in range(R):

​            for j in range(C):

​                a.append([i,j])

​        a.sort(key=lambda x: abs(x[0]-r0)+(x[1]-c0))

​        return a

#### [976. 三角形的最大周长](https://leetcode-cn.com/problems/largest-perimeter-triangle/)

给定由一些正数（代表长度）组成的数组 `A`，返回由其中三个长度组成的、**面积不为零**的三角形的最大周长。

如果不能形成任何面积不为零的三角形，返回 `0`。

 

class Solution:

​    def largestPerimeter(self, A: List[int]) -> int:

​       A.sort(reverse =True)

​       while len(A)>=3:

​            a=A[0]

​            b=A[1] 

​            c=A[2]

​            if a-b<c:

​               return a+b+c

​            else:

​                A.pop(0)

​       return 0

#### [258. 各位相加](https://leetcode-cn.com/problems/add-digits/)

给定一个非负整数 `num`，反复将各个位上的数字相加，直到结果为一位数。

class Solution:

​    def addDigits(self, num: int) -> int:

​        num=str(num)

​        sum=0

​        for n in num:

​            sum+=int(n)

​        if len(str(sum))==1:

​            return sum

​        else:

​            return Solution.addDigits(self,sum)

#### [1122. 数组的相对排序](https://leetcode-cn.com/problems/relative-sort-array/)

给你两个数组，arr1 和 arr2，

arr2 中的元素各不相同
arr2 中的每个元素都出现在 arr1 中
对 arr1 中的元素进行排序，使 arr1 中项的相对顺序和 arr2 中的相对顺序相同。未在 arr2 中出现过的元素需要按照升序放在 arr1 的末尾。

 

class Solution:

​    def relativeSortArray(self, arr1: List[int], arr2: List[int]) -> List[int]:

​         l = []

​         tmp=[a for a in arr1 if a not in arr2] 

​         for num in arr2:

​            l += [num] * arr1.count(num)

​         tmp.sort()

​         return l+tmp