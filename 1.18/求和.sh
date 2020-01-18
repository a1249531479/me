a=0
b=0
ech "" Output.txt
for((i=11;i<100;i++));do
    b='expr $i / 10'
    a='expr $a + $b'
    b=0;
done;
a > Output